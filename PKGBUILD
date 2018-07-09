# Maintainer: Charles Bos <charlesbos1 AT gmail>
# Contributor: Fritz <V155> Reichwald <fritz.reichwald at gmail.com>
# Contributor: Hauke Wesselmann <hauke at h-dawg.de>

pkgname=barry
pkgver=0.18.5
pkgrel=10
pkgdesc="Barry is an Open Source application that provides a Desktop GUI, synchronization, backup, restore and program management for BlackBerry ™ devices."
url=https://github.com/NetDirect/barry
license=('GPL')
arch=('i686' 'x86_64')
depends=('libusb' 'zlib' 'libglademm' 'libtar' 'libxml++2.6' 'wxgtk2' 'sdl' 'libgcal')
optdepends=('fuse2: for mounting the BB database with bfuse'
            'ppp: for tethering with pppob')
options=('!libtool')
source=("https://github.com/NetDirect/${pkgname}/archive/${pkgname}-${pkgver}.tar.gz"
        "barrybackup.desktop"
        "fix-sizeof-use.patch"
        "c++11.patch"
        "libusb-rules-noplugdev.patch")
sha256sums=('cfe5224c34b25575543bbdeebf979074f76ccc7d37116f15aef20509e6c06c91'
            '1c6ecd68977da4a3184c3e6d4bea36e4c40949d6bf7bb4ad8717aa6c19fed4fa'
            'd1eb3ff669d5d8490112ceb4138fe9eb107bdbbc8621c98ead5ff47b9a7faf4e'
            'bd211b7323a36f255af7cad13b886d8bb45d74f1d2bcecef00733bb5a9080f2c'
            'a68c9a86fd2a034ff25ee85be609f0ff98e371d0f79fb7902e0289b8cb37b547')

prepare() {
  mv ${srcdir}/${pkgname}-${pkgname}-${pkgver} ${srcdir}/${pkgname}-${pkgver}
  cd ${srcdir}/${pkgname}-${pkgver}

  # Debian patches
  patch -Np1 -i "${srcdir}/fix-sizeof-use.patch"

  # C++11 compatibility
  patch -Np1 -i "${srcdir}/c++11.patch"

  # Don't set device group ownership to plugdev in the udev rules file as Arch
  # doesn't have plugdev. Use uaccess instead
  patch -Np1 -i "${srcdir}/libusb-rules-noplugdev.patch"

  autoreconf -fi
}

build() {
  cd ${srcdir}/${pkgname}-${pkgver}

  export CXXFLAGS="-std=c++11"
  export CPPFLAGS="-Wno-error"

  ./configure --prefix=/usr --libexec=/usr/lib --sbindir=/usr/bin --enable-gui

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
  cp ../barrybackup.desktop ${pkgdir}/usr/share/applications

  # Install udev rules to allow barrybackup to access devices without root
  mkdir -p ${pkgdir}/usr/lib/udev/rules.d
  cp udev/70-blackberry-perms.rules ${pkgdir}/usr/lib/udev/rules.d
}
