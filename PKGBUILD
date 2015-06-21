# $Id$
# Maintainer: Gicu GORODENCO <cyclopsihus@gmail.com>
# Contributor (cups): Andreas Radke <andyrtr@archlinux.org>

_pkgbase="cups"
pkgbase="libcups-ipp14"
### Commenting the "split packages sections - unsupported by AUR apparently ###
#pkgname=('libcups-ipp14' 'cups-ipp14')
pkgname=(${pkgbase})
pkgver=2.0.2
pkgrel=1
arch=('i686' 'x86_64')
provides=('libcups')
replaces=('libcups')
conflicts=('libcups')
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
pkgdesc="The CUPS Printing System - client libraries and headers"
depends=('gnutls' 'libtiff>=4.0.0' 'libpng>=1.5.7' 'krb5' 'avahi' 'libusb')
backup=(etc/cups/client.conf)

  cd ${_pkgbase}-${pkgver}
  make BUILDROOT=${pkgdir} install-headers install-libs
  # put this into the libs pkg to make other software find the libs(no pkg-config file included)
  mkdir -p ${pkgdir}/usr/bin 
  install -m755 ${srcdir}/${_pkgbase}-${pkgver}/cups-config ${pkgdir}/usr/bin/cups-config
  
  # install client.conf man page and config file
  install -dm755 ${pkgdir}/usr/share/man/man5
  install -Dm644  ${srcdir}/${_pkgbase}-${pkgver}/man/client.conf.5 ${pkgdir}/usr/share/man/man5/
  install -dm755 -g lp ${pkgdir}/etc/cups
  touch ${pkgdir}/etc/cups/client.conf
  echo "# see 'man client.conf'" >> ${pkgdir}/etc/cups/client.conf
  echo "ServerName /run/cups/cups.sock #  alternative: ServerName hostname-or-ip-address[:port] of a remote server" >> ${pkgdir}/etc/cups/client.conf
  chgrp -R lp ${pkgdir}/etc/cups
}

