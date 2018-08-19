# $Id$
# Maintainer: Gicu GORODENCO <cyclopsihus@gmail.com>
# Contributor (cups): Andreas Radke <andyrtr@archlinux.org>

_pkgbase="cups"
pkgbase="libcups-ipp14"
### Commenting the "split packages sections - unsupported by AUR apparently ###
#pkgname=('libcups-ipp14' 'cups-ipp14')
pkgname=(${pkgbase})
pkgver=2.2.8
pkgrel=3
arch=('i686' 'x86_64')
provides=('libcups=2.2.8-3')
replaces=('libcups')
conflicts=('libcups')
license=('GPL')
url="https://www.cups.org/"
makedepends=('libtiff' 'libpng' 'acl' 'pam' 'xdg-utils' 'krb5' 'gnutls'
             'cups-filters' 'bc' 'colord' 'xinetd' 'gzip' 'autoconf' 'libusb' 'dbus' 
             'avahi'  'hicolor-icon-theme' 'systemd' 'inetutils' 'libpaper' 'valgrind')
source=(https://github.com/apple/cups/releases/download/v${pkgver}/cups-${pkgver}-source.tar.gz{,.sig}
        cups.logrotate cups.pam
        cups.sysusers guid.patch
        # improve build and linking
        cups-no-export-ssllibs.patch
        cups-no-gzip-man.patch
        cups-1.6.2-statedir.patch
        # bugfixes
        cups-systemd-socket.patch
        guid.patch
        cups-2.2.8-5325.patch
        # IPP 1.4
        add-ipp-backend-of-cups-1.4.patch)

sha256sums=('3968fc1d26fc48727508db1c1380e36c6694ab90177fd6920aec5f6cc73af9e4'
            'SKIP'
            'd87fa0f0b5ec677aae34668f260333db17ce303aa1a752cba5f8e72623d9acf9'
            '57dfd072fd7ef0018c6b0a798367aac1abb5979060ff3f9df22d1048bb71c0d5'
            '06173dfaea37bdd9b39b3e09aba98c34ae7112a2f521db45a688907d8848caa2'
            'd4537526c1e075866ae22ad263da000fc2a592d36c26b79a459a1cfdade2bb2d'
            'ff3eb0782af0405f5dafe89e04b1b4ea7a49afc5496860d724343bd04f375832'
            'b8fc2e3bc603495f0278410350ea8f0161d9d83719feb64f573b63430cb4800b'
            '23349c96f2f7aeb7d48e3bcd35a969f5d5ac8f55a032b0cfaa0a03d7e37ea9af'
            'f909719e2595e016c320afa421cad74ccda285ac59b11749ddac58e707d4330a'
            'd4537526c1e075866ae22ad263da000fc2a592d36c26b79a459a1cfdade2bb2d'
            'b1daf250e16d34539149535c68a241f32223b1f34d142d0ee369fde019340de9'
            '375614399e38ddb7af9375472a75e8a83eb3c587595ee079286cbc45094e3c26')

validpgpkeys=('3737FD0D0E63B30172440D2DDBA3A7AB08D76223') # CUPS.org (CUPS.org PGP key) <security@cups.org>
validpgpkeys+=('45D083946E3035282B3CCA9AF434104235DA97EB') # "CUPS.org <security@cups.org>"
validpgpkeys+=('845464660B686AAB36540B6F999559A027815955') # "Michael R Sweet <michael.r.sweet@gmail.com>"

prepare() {

  cd ${_pkgbase}-${pkgver}

  # Applying patch to add ipp14 backend:
  patch -Np1 -i ${srcdir}/add-ipp-backend-of-cups-1.4.patch

  # improve build and linking
  # Do not export SSL libs in cups-config
  patch -Np1 -i ${srcdir}/cups-no-export-ssllibs.patch
  # don't zip man pages in make install, let makepkg do that / Fedora
  patch -Np1 -i ${srcdir}/cups-no-gzip-man.patch
  # move /var/run -> /run for pid file
  patch -Np1 -i ${srcdir}/cups-1.6.2-statedir.patch

  # bug fixes
  # make sure network is up when starting and notify systemd - FC
  patch -Np1 -i ${srcdir}/cups-systemd-socket.patch

  # FS#56818 - https://github.com/apple/cups/issues/5236
  patch -Np1 -i ${srcdir}/guid.patch

  # https://github.com/apple/cups/issues/5325
  patch -Np1 -i ${srcdir}/cups-2.2.8-5325.patch

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

  # use fixed cups user (id 209) since systemd adds "lp" group without a fixed id
  ./configure --prefix=/usr \
     --sysconfdir=/etc \
     --localstatedir=/var \
     --sbindir=/usr/bin \
     --libdir=/usr/lib \
     --with-logdir=/var/log/cups \
     --with-docdir=/usr/share/cups/doc \
     --with-exe-file-perm=0755 \
     --with-cups-user=209 \
     --with-cups-group=209 \
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

  cd ${_pkgbase}-${pkgver}
  make BUILDROOT=${pkgdir} install-headers install-libs
  # put this into the libs pkg to make other software find the libs(no pkg-config file included)
  mkdir -p ${pkgdir}/usr/bin 
  install -m755 ${srcdir}/${_pkgbase}-${pkgver}/cups-config ${pkgdir}/usr/bin/cups-config
}
