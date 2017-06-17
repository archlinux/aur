# Maintainer: Charles Bos <charlesbos1 AT gmail>
# Contributor: Fritz <V155> Reichwald <fritz.reichwald at gmail.com>
# Contributor: Hauke Wesselmann <hauke at h-dawg.de>

pkgname=barry
pkgver=0.18.5
pkgrel=4
pkgdesc="Barry is an Open Source application that provides a Desktop GUI, synchronization, backup, restore and program management for BlackBerry ™ devices."
url=http://www.netdirect.ca/software/packages/barry
license=('GPL')
arch=('i686' 'x86_64')
depends=('libusb' 'zlib' 'libglademm' 'libtar' 'libxml++2.6' 'wxgtk2' 'sdl' 'libgcal')
optdepends=('fuse2: for mounting the BB database with bfuse'
            'ppp: for tethering with pppob')
options=('!libtool')
source=("http://sourceforge.net/projects/${pkgname}/files/${pkgname}/${pkgname}-0.18.4/sources/debian/${pkgname}_${pkgver}.orig.tar.gz"
        "${pkgname}.desktop"
        "fix-sizeof-use.patch"
        "wx3.0-compat.patch"
        "c++11.patch")
sha256sums=('66cd913bcfcb5dc0fc3dfcbe8c375845d51649d573c321acba46b96b1bc0059e'
            'aa97e456e0bb1f39cf0d95b1f35080d328947a3bcf40b2b97a0ab11ad34ccc21'
            'd1eb3ff669d5d8490112ceb4138fe9eb107bdbbc8621c98ead5ff47b9a7faf4e'
            'd89dec40916c99355426a9430130a34b9c9f8deccf2e0bd2be75c6eea46249f3'
            'bd211b7323a36f255af7cad13b886d8bb45d74f1d2bcecef00733bb5a9080f2c')

prepare() {
  cd ${srcdir}/${pkgname}-${pkgver}

  # Debian patches
  patch -Np1 -i "${srcdir}/fix-sizeof-use.patch"
  patch -Np1 -i "${srcdir}/wx3.0-compat.patch"

  # C++11 compatibility
  patch -Np1 -i "${srcdir}/c++11.patch"

  autoreconf -fi
}

build() {
  cd ${srcdir}/${pkgname}-${pkgver}

  export CXXFLAGS="-std=c++11"
  export CPPFLAGS="-Wno-error"

  ./configure --prefix=/usr --libexec=/usr/lib --sbindir=/usr/bin \
    --enable-gui \
    --enable-desktop \
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
  cp ../barry.desktop ${pkgdir}/usr/share/applications
}
