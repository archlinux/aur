# $Id$
# Maintainer: Gicu GORODENCO <cyclopsihus@gmail.com>
# Contributor (cups): Andreas Radke <andyrtr@archlinux.org>

_pkgbase="cups"
pkgbase="${_pkgbase}-ipp14"
### Commenting the "split packages sections - unsupported by AUR apparently ###
#pkgname=('libcups-ipp14' 'cups-ipp14')
pkgname=(${pkgbase})
pkgver=2.0.2
pkgrel=1
arch=('i686' 'x86_64')
provides=('cups')
replaces=('cups')
conflicts=('cups')
license=('GPL')
url="http://www.cups.org/"
makedepends=('libtiff>=4.0.0' 'libpng>=1.5.7' 'acl' 'pam' 'xdg-utils' 'krb5' 'gnutls'
             'cups-filters' 'bc' 'colord' 'xinetd' 'gzip' 'autoconf' 'libusb' 'dbus' 
             'avahi'  'hicolor-icon-theme' 'systemd' 'inetutils' 'libpaper' 'valgrind')
source=(http://www.cups.org/software/${pkgver}/cups-${pkgver}-source.tar.bz2{,.sig}
        cups.logrotate cups.pam
        # improve build and linking
        cups-no-export-ssllibs.patch
        cups-no-gcrypt.patch
        cups-no-gzip-man.patch
        cups-1.6.2-statedir.patch
        cups-1.6.0-fix-install-perms.patch
        # bugfixes
        # IPP 1.4
        add-ipp-backend-of-cups-1.4.patch)

md5sums=('6e0ea72dbafcf5baaa1cf4178e71096d'
         'SKIP'
         'fc8286f185e2cc5f7e1f6843bf193e2b'
         '96f82c38f3f540b53f3e5144900acf17'
         '3ba9e3410df1dc3015463d615ef91b3b'
         '1beb4896f217bc241bc08a422274ec0c'
         '90c30380d4c8cd48a908cfdadae1ea24'
         '451609db34f95209d64c38474de27ce1'
         '5117f65342fcc69c6a506529e4daca9e'
         '49e1c75beb87e9b7c9511f59509839e7')


prepare() {

  cd ${_pkgbase}-${pkgver}
  
  # Applying patch to add ipp14 backend:
  patch -Np1 -i ${srcdir}/add-ipp-backend-of-cups-1.4.patch

  # improve build and linking
  # Do not export SSL libs in cups-config
  patch -Np1 -i ${srcdir}/cups-no-export-ssllibs.patch
  # https://www.cups.org/str.php?L4399
  patch -Np1 -i ${srcdir}/cups-no-gcrypt.patch
  # don't zip man pages in make install, let makepkg do that / Fedora
  patch -Np1 -i ${srcdir}/cups-no-gzip-man.patch
  # move /var/run -> /run for pid file
  patch -Np1 -i ${srcdir}/cups-1.6.2-statedir.patch
  # fix permissions on some files (by Gentoo) - alternative: cups-0755.patch by FC
  patch -Np0 -i ${srcdir}/cups-1.6.0-fix-install-perms.patch

  # bug fixes 
  
  # set MaxLogSize to 0 to prevent using cups internal log rotation
  sed -i -e '5i\ ' conf/cupsd.conf.in
  sed -i -e '6i# Disable cups internal logging - use logrotate instead' conf/cupsd.conf.in
  sed -i -e '7iMaxLogSize 0' conf/cupsd.conf.in
  
  # Rebuild configure script for not zipping man-pages.
  aclocal -I config-scripts
  autoconf -I config-scripts
}

build() {
  cd ${_pkgbase}-${pkgver}
  ./configure --prefix=/usr \
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
     --enable-threads \
     --enable-avahi\
     --enable-libpaper \
     --with-php=/usr/bin/php-cgi \
     --with-optim="$CFLAGS" #--help
  make
}

check() {
  cd ${_pkgbase}-${pkgver}
  #make -k check || /bin/true
}

package() {
pkgdesc="The CUPS Printing System - daemon package"
install=cups.install
backup=(etc/cups/cupsd.conf
        etc/cups/snmp.conf
        etc/cups/printers.conf
        etc/cups/classes.conf
        etc/cups/cups-files.conf
        etc/cups/subscriptions.conf
        etc/dbus-1/system.d/cups.conf
        etc/logrotate.d/cups
        etc/pam.d/cups)
depends=('acl' 'pam' "libcups-ipp14>=${pkgver}" 'cups-filters' 'bc' 'colord'
         'dbus' 'systemd' 'libpaper' 'hicolor-icon-theme')
optdepends=('xdg-utils: xdg .desktop file support')

  cd ${_pkgbase}-${pkgver}
  make BUILDROOT=${pkgdir} install-data install-exec

  # this one we ship in the libcups pkg
  rm -f ${pkgdir}/usr/bin/cups-config

  # kill the sysv stuff
  rm -rf ${pkgdir}/etc/rc*.d
  rm -rf ${pkgdir}/etc/init.d
  install -D -m644 ../cups.logrotate ${pkgdir}/etc/logrotate.d/cups
  install -D -m644 ../cups.pam ${pkgdir}/etc/pam.d/cups
  
  # fix perms on /var/spool and /etc
  chmod 755 ${pkgdir}/var/spool
  chmod 755 ${pkgdir}/etc

  # install ssl directory where to store the certs, solves some samba issues
  install -dm700 -g lp ${pkgdir}/etc/cups/ssl
  # remove directory from package, it will be recreated at each server start
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
  perl -p -i -e 's:^(.*\s+bannertops\s*)$:#\1:' $pkgdir/usr/share/cups/mime/mime.convs

  
  # comment out unnecessary PageLogFormat entry
  sed -i -e 's:PageLogFormat:#PageLogFormat:' $pkgdir/etc/cups/cupsd.conf*
}
