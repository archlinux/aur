# Maintainer: Jonathon Fernyhough <jonathon "manjaro+org>
# Contributor: AndyRTR <andyrtr@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=lib32-libxp
pkgver=1.0.3
pkgrel=3.0
pkgdesc="X11 X Print Library (32-bit)"
arch=(x86_64)
license=(custom)
url=https://xorg.freedesktop.org/
depends=(lib32-libxext)

makedepends=('xorg-util-macros' 'xorgproto')
source=(${url}/releases/individual/lib/libXp-${pkgver}.tar.bz2{,.sig}
        add-proto-files.patch)

sha512sums=('502a2500ec0f519dae69ac035bf93c65c47e3bc301604aacb350e90043455f3485626194db45208e5521300b282843825e08b7f7c412a7497ffa02f5f1560c8d'
            'SKIP'
            'e2b1bf1d132f2a219901feb8bf4eaf08cd795521bb6175627a82d745d422ad189c6d24ad221d5804b5e32f5798ad75bc733bb94b3505453fa57c5b7951bdece8')
validpgpkeys=('3BB639E56F861FA2E86505690FDD682D974CA72A') #  "Matt Turner <mattst88@gmail.com>"

prepare() {
  cd libXp-${pkgver}
  patch -Np1 -i ../add-proto-files.patch
}

build() {
  cd libXp-${pkgver}

  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  autoreconf -vfi
  ./configure --prefix=/usr --libdir=/usr/lib32 --disable-static
  make
}

package() {
  cd libXp-${pkgver}

  make DESTDIR="${pkgdir}" install
  rm -fr ${pkgdir}/usr/{include,share/man}

  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}
