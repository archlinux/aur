# Maintainer: Alexey D. <lq07829icatm@rambler.ru>
# Contributor: Andreas Radke <andyrtr@archlinux.org>

pkgname="cups-nosystemd"
pkgver=2.0.0
pkgrel=1
pkgdesc="The CUPS Printing System - daemon package"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.cups.org/"
groups=('eudev-base')
depends=('acl' 'pam' "libcups>=${pkgver}" 'cups-filters' 'bc' 'colord'
         'dbus' 'hicolor-icon-theme' 'libpaper')
makedepends=('libtiff>=4.0.0' 'libpng>=1.5.7' 'xdg-utils' 'krb5' 'xinetd'
             'gzip' 'autoconf' 'avahi' 'gnutls' 'inetutils')
optdepends=('xdg-utils: xdg .desktop file support'
            'cups-openrc: cups openrc initscript')
provides=("cups=${pkgver}")
conflicts=('cups' 'cups-eudev')
replaces=('cups' 'cups-eudev')
install=cups-nosystemd.install
backup=(etc/cups/cupsd.conf
        etc/cups/snmp.conf
        etc/cups/printers.conf
        etc/cups/classes.conf
        etc/cups/cups-files.conf
        etc/cups/subscriptions.conf
        etc/dbus-1/system.d/cups.conf
        etc/logrotate.d/cups
        etc/pam.d/cups
        etc/xinetd.d/cups-lpd)
source=(http://www.cups.org/software/${pkgver}/cups-${pkgver}-source.tar.bz2
        cups cups.logrotate cups.pam
        # improve build and linking
        cups-no-export-ssllibs.patch
        cups-no-gcrypt.patch
        cups-no-gzip-man.patch
	cups-1.6.0-fix-install-perms.patch
	cups-1.6.2-statedir.patch
	# bugfixes
	str4495.patch
	str4500.patch # FC
	)
md5sums=('2cdd81fea23e9e29555c24bdfd0d7c89'
         '9657daa21760bb0b5fa3d8b51d5e01a1'
         'fc8286f185e2cc5f7e1f6843bf193e2b'
         '96f82c38f3f540b53f3e5144900acf17'
         '3ba9e3410df1dc3015463d615ef91b3b'
         '1beb4896f217bc241bc08a422274ec0c'
         '90c30380d4c8cd48a908cfdadae1ea24'
         '5117f65342fcc69c6a506529e4daca9e'
         '451609db34f95209d64c38474de27ce1'
         '84da6459947d4fb62398e9bad7922a11'
         '8c0514e41c3b50b2b838b218f683e227')

prepare() {
  cd cups-${pkgver}

  # improve build and linking
  # Do not export SSL libs in cups-config
  patch -Np1 -i "${srcdir}/cups-no-export-ssllibs.patch"
  # https://www.cups.org/str.php?L4399
  patch -Np1 -i "${srcdir}/cups-no-gcrypt.patch"

  # don't zip man pages in make install, let makepkg do that / Fedora
  patch -Np1 -i ${srcdir}/cups-no-gzip-man.patch

  # move /var/run -> /run for pid file
  patch -Np1 -i ${srcdir}/cups-1.6.2-statedir.patch

  # fix permissions on some files (by Gentoo)
  patch -Np0 -i ${srcdir}/cups-1.6.0-fix-install-perms.patch


  # bugfixes
  # https://bugs.archlinux.org/task/40937 - https://www.cups.org/str.php?L4495
  # adds a warning to the config file and honors the FatalErrors directive
  patch -Np0 -i "${srcdir}/str4495.patch"

  # https://www.cups.org/str.php?L4500
  # /etc/cups/ppd/*.ppd not world-readable, cupsGetPPD() returns symlink
  patch -Np1 -i "${srcdir}/str4500.patch"


  # set MaxLogSize to 0 to prevent using cups internal log rotation
  sed -i -e '1iMaxLogSize 0' conf/cupsd.conf.in

  # Rebuild configure script for not zipping man-pages.
  aclocal -I config-scripts
  autoconf -I config-scripts
}

build() {
  cd cups-${pkgver}
  ./configure \
     --prefix=/usr \
     --sysconfdir=/etc \
     --localstatedir=/var \
     --sbindir=/usr/bin \
     --libdir=/usr/lib \
     --with-logdir=/var/log/cups \
     --with-docdir=/usr/share/cups/doc \
     --with-cups-user=daemon \
     --with-cups-group=lp \
     --enable-pam=yes \
     --enable-raw-printing \
     --enable-dbus --with-dbusdir=/etc/dbus-1 \
     --enable-ssl=yes \
     --disable-gnutls \
     --enable-threads \
     --enable-avahi \
     --enable-libpaper \
     --with-php=/usr/bin/php-cgi \
     --with-optim="$CFLAGS"
  make
}

#check() {
#  cd "$srcdir/cups-$pkgver"
#  
#  make -k check || /bin/true
#}

package() {
  cd ${srcdir}/cups-${pkgver}
  make BUILDROOT=${pkgdir} install-data install-exec

  # this one we ship in the libcups pkg
  rm -f ${pkgdir}/usr/bin/cups-config

  # kill the sysv stuff
  rm -rf ${pkgdir}/etc/rc*.d
  rm -rf ${pkgdir}/etc/init.d
  install -D -m755 ../cups ${pkgdir}/etc/rc.d/cupsd
  install -D -m644 ../cups.logrotate ${pkgdir}/etc/logrotate.d/cups
  install -D -m644 ../cups.pam ${pkgdir}/etc/pam.d/cups

  # fix perms on /var/spool and /etc
  chmod 755 ${pkgdir}/var/spool
  chmod 755 ${pkgdir}/etc

  # install ssl directory where to store the certs, solves some samba issues
  install -dm700 -g lp ${pkgdir}/etc/cups/ssl
  # remove directory from package, we create it in cups rc.d file
  rm -rf ${pkgdir}/run

  # install some more configuration files that will get filled by cupsd
  touch ${pkgdir}/etc/cups/printers.conf
  touch ${pkgdir}/etc/cups/classes.conf
  touch ${pkgdir}/etc/cups/subscriptions.conf
  chgrp -R lp ${pkgdir}/etc/cups

  # fix .desktop file
  sed -i 's|^Exec=htmlview http://localhost:631/|Exec=xdg-open http://localhost:631/|g' ${pkgdir}/usr/share/applications/cups.desktop

  # compress some driver files, adopted from Fedora
  find ${pkgdir}/usr/share/cups/model -name "*.ppd" | xargs gzip -n9f

  # remove client.conf man page
  rm -f ${pkgdir}/usr/share/man/man5/client.conf.5

  # remove files now part of cups-filters
  rm -v ${pkgdir}/usr/share/cups/banners/*
  rm -v ${pkgdir}/usr/share/cups/data/testprint
  # comment out all conversion rules which use any of the removed filters
  perl -p -i -e 's:^(.*\s+bannertops\s*)$:#\1:' "${pkgdir}/usr/share/cups/mime/mime.convs"
}
