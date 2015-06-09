# Maintainer: Charles Bos <charlesbos1 AT gmail>
# Contributor: Fritz <V155> Reichwald <fritz.reichwald at gmail.com>
# Contributor: Hauke Wesselmann <hauke at h-dawg.de>

pkgname=barry
pkgver=0.18.4
pkgrel=4
pkgdesc="Barry is an Open Source application that provides a Desktop GUI, synchronization, backup, restore and program management for BlackBerry ™ devices."
url=('http://www.netdirect.ca/software/packages/barry')
license=('GPL')
arch=('i686' 'x86_64')
depends=('libusbx' 'zlib' 'libglademm' 'libtar' 'libxml++' 'wxgtk' 'sdl' 'libgcal')
optdepends=('fuse: for mounting the BB database with bfuse'
            'ppp: for tethering with pppob')
options=('!libtool')
install=(${pkgname}.install)
source=("http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.bz2"
        "${pkgname}.desktop"
        "fix-sizeof-use.patch"
        "wx3.0-compat.patch")
sha256sums=('4036d9eb46a86794455f9f125e8d77dd922e06f74889c5be7f35554be3f48a73'
            'cb30b64a392ff5ff0482399cd31e6c997c57e60969145680497a54ffbb8f7d67'
            'd1eb3ff669d5d8490112ceb4138fe9eb107bdbbc8621c98ead5ff47b9a7faf4e'
            'd89dec40916c99355426a9430130a34b9c9f8deccf2e0bd2be75c6eea46249f3')

prepare() {
  cd ${srcdir}/${pkgname}-${pkgver}

  # Debian patches
  patch -Np1 -i "${srcdir}/fix-sizeof-use.patch"
  patch -Np1 -i "${srcdir}/wx3.0-compat.patch"

  # Disable Werror
  find /$(pwd) -type f -exec sed -i 's/-Werror//g' '{}' \;

  autoreconf -fi
}

build() {
  cd ${srcdir}/${pkgname}-${pkgver}

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
