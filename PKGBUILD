# Maintainer: Charles Bos <charlesbos1 AT gmail>
# Contributor: Fritz <V155> Reichwald <fritz.reichwald at gmail.com>
# Contributor: Hauke Wesselmann <hauke at h-dawg.de>

pkgname=barry
pkgver=0.18.5
pkgrel=8
pkgdesc="Barry is an Open Source application that provides a Desktop GUI, synchronization, backup, restore and program management for BlackBerry ™ devices."
url=https://github.com/NetDirect/barry
license=('GPL')
arch=('i686' 'x86_64')
depends=('libusb' 'zlib' 'libglademm' 'libtar' 'libxml++2.6' 'wxgtk2' 'sdl' 'libgcal')
optdepends=('fuse2: for mounting the BB database with bfuse'
            'ppp: for tethering with pppob')
options=('!libtool')
source=("https://github.com/NetDirect/${pkgname}/archive/${pkgname}-${pkgver}.tar.gz"
        "barrydesktop.desktop"
        "barrybackup.desktop"
        "fix-sizeof-use.patch"
        "wx3.0-compat.patch"
        "c++11.patch"
        "iterator-buildfix.patch"
        "libusb-rules-noplugdev.patch")
sha256sums=('cfe5224c34b25575543bbdeebf979074f76ccc7d37116f15aef20509e6c06c91'
            'aa97e456e0bb1f39cf0d95b1f35080d328947a3bcf40b2b97a0ab11ad34ccc21'
            '1c6ecd68977da4a3184c3e6d4bea36e4c40949d6bf7bb4ad8717aa6c19fed4fa'
            'd1eb3ff669d5d8490112ceb4138fe9eb107bdbbc8621c98ead5ff47b9a7faf4e'
            'd89dec40916c99355426a9430130a34b9c9f8deccf2e0bd2be75c6eea46249f3'
            'bd211b7323a36f255af7cad13b886d8bb45d74f1d2bcecef00733bb5a9080f2c'
            '690d6d9cdd5f84ac120e5e2a0c974916217a059c25ad08dd1b45b33d858993ad'
            '2da11475bb3d5c9c94f7625b33e3ae29442413b25f320e9f70d4777180d5bd4a')

prepare() {
  mv ${srcdir}/${pkgname}-${pkgname}-${pkgver} ${srcdir}/${pkgname}-${pkgver}
  cd ${srcdir}/${pkgname}-${pkgver}

  # Debian patches
  patch -Np1 -i "${srcdir}/fix-sizeof-use.patch"
  patch -Np1 -i "${srcdir}/wx3.0-compat.patch"

  # C++11 compatibility
  patch -Np1 -i "${srcdir}/c++11.patch"

  # Fix build failure for functions that return reverse iterators
  patch -Np1 -i "${srcdir}/iterator-buildfix.patch"

  # Don't set device group ownership to plugdev in the udev rules file as Arch
  # doesn't have plugdev. Just apply read-write globally
  patch -Np1 -i "${srcdir}/libusb-rules-noplugdev.patch"

  autoreconf -fi
}

build() {
  cd ${srcdir}/${pkgname}-${pkgver}

  export CXXFLAGS="-std=c++11"
  export CPPFLAGS="-Wno-error"

  ./configure --prefix=/usr --libexec=/usr/lib --sbindir=/usr/bin \
    --enable-gui \
    --disable-desktop \
    --without-guisu

  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}

  make DESTDIR=${pkgdir} install

  # Install PPP scripts for pppob
  mkdir -p ${pkgdir}/etc/ppp/peers/ ${pkgdir}/etc/chatscripts/
  find ${srcdir}/${pkgname}-${pkgver}/ppp/ -name *.chat -exec cp {} ${pkgdir}/etc/chatscripts/ \;
  find ${srcdir}/${pkgname}-${pkgver}/ppp/ ! -name *.chat ! -name README -exec cp {} ${pkgdir}/etc/ppp/peers/ \;

  # Install .desktop file and icon
  mkdir -p ${pkgdir}/usr/share/pixmaps
  cp ./desktop/images/barry_logo_icon.xpm ${pkgdir}/usr/share/pixmaps
  
  mkdir -p ${pkgdir}/usr/share/applications
  # We are no longer compiling barrydesktop so there's no need to install the
  # desktop entry file
  # cp ../barrydesktop.desktop ${pkgdir}/usr/share/applications
  cp ../barrybackup.desktop ${pkgdir}/usr/share/applications

  # Install udev rules to allow barrybackup to access devices without root
  mkdir -p ${pkgdir}/usr/lib/udev/rules.d
  cp udev/99-blackberry-perms.rules ${pkgdir}/usr/lib/udev/rules.d
}
