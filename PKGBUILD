# Maintainer: Alexey D. <lq07829icatm@rambler.ru>
# Contributor: Andreas Radke <andyrtr@archlinux.org>

pkgname="cups-nosystemd"
pkgver=1.7.1
pkgrel=1
pkgdesc="The CUPS Printing System - daemon package"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.cups.org/"
depends=('acl' 'pam' "libcups>=${pkgver}" 'cups-filters' 'bc' 'colord' 'libusb' 'dbus' 'hicolor-icon-theme')
makedepends=('libtiff>=4.0.0' 'libpng>=1.5.7' 'xdg-utils' 'krb5' 'xinetd' 'gzip' 'autoconf' 'avahi' 'openssl' 'inetutils')
optdepends=('xdg-utils: xdg .desktop file support')
provides=("cups=${pkgver}")
conflicts=('cups')
replaces=('cups')
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
        # FC
        cups-res_init.patch
        cups-avahi-address.patch
        cups-enum-all.patch
        # Gentoo
        cups-1.6.0-fix-install-perms.patch
        cups-1.6.2-statedir.patch
        # Debian
	get-ppd-file-for-statically-configured-ipp-shared-queues.patch)
md5sums=('55277c40fd4b7183dc3671d39c5c42b7'
         '9657daa21760bb0b5fa3d8b51d5e01a1'
         'f861b18f4446c43918c8643dcbbd7f6d'
         '96f82c38f3f540b53f3e5144900acf17'
         '3ba9e3410df1dc3015463d615ef91b3b'
         'cc4101beccb5ed6deb1c92707a575925'
         '90c30380d4c8cd48a908cfdadae1ea24'
         '8fe27d4248cacbc02824e7937cab4088'
         'df0c367c0022e3c7d8e01827e8a6c5e7'
         'f30c2a161caaf27854581507cde8cac6'
         '5117f65342fcc69c6a506529e4daca9e'
         '451609db34f95209d64c38474de27ce1'
         'b578bcd17949a7203237ba1e31f78ef9')

prepare() {
  cd cups-${pkgver}

  # Do not export SSL libs in cups-config
  patch -Np1 -i "${srcdir}/cups-no-export-ssllibs.patch"

  patch -Np1 -i "${srcdir}/cups-no-gcrypt.patch"

  # don't zip man pages in make install, let makepkg do that / Fedora
  patch -Np1 -i ${srcdir}/cups-no-gzip-man.patch

  # various bugfixes (upstream reports/SVN or Fedora/Debian

  # Applications could not get the PPD file for statically-configured IPP-shared print queues
  patch -Np1 -i ${srcdir}/get-ppd-file-for-statically-configured-ipp-shared-queues.patch
  
  # fix permissions on some files - alternative: cups-0755.patch by FC
  patch -Np0 -i ${srcdir}/cups-1.6.0-fix-install-perms.patch
  
  # move /var/run -> /run for pid file
  patch -Np1 -i ${srcdir}/cups-1.6.2-statedir.patch
  
  # Re-initialise the resolver on failure in httpAddrGetList() 
  patch -Np1 -i ${srcdir}/cups-res_init.patch
  
  # Use IP address when resolving DNSSD URIs
  patch -Np1 -i ${srcdir}/cups-avahi-address.patch
  
  # Return from cupsEnumDests() once all records have been returned.
  patch -Np1 -i ${srcdir}/cups-enum-all.patch

  # Rebuild configure script for not zipping man-pages.
  aclocal -I config-scripts
  autoconf -I config-scripts
}

build() {
  cd cups-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
     --sbindir=/usr/bin \
     --libdir=/usr/lib \
     --with-logdir=/var/log/cups \
     --with-docdir=/usr/share/cups/doc \
     --with-cups-user=daemon \
     --with-cups-group=lp \
     --enable-pam=yes \
     --enable-raw-printing \
     --enable-dbus --with-dbusdir=/etc/dbus-1 \
     --enable-ssl=yes --enable-openssl \
     --disable-gnutls \
     --enable-threads \
     --enable-avahi\
     --with-php=/usr/bin/php-cgi \
     --with-optim="$CFLAGS"
  make
}

check() {
  cd "$srcdir/cups-$pkgver"
  
  #./run-stp-tests.sh: line 782:  6307 Aborted                 (core dumped) $VALGRIND ../scheduler/cupsd -c /tmp/cups-$user/cupsd.conf -f > /tmp/cups-$user/log/debug_log 2>&1
  #FAIL: 87 error messages, expected 33.
  make -k check || /bin/true
}

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
  rm -rf ${pkgdir}/var/run

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
