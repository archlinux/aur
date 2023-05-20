# Maintainer: Jan Stephan <jan.stephan.dd@gmail.com>
# Maintainer: Hocking Lee <hockinglee@gmail.com>

pkgname=lib32-xcb-util-renderutil
pkgver=0.3.10
pkgrel=1
pkgdesc="Utility libraries for XC Binding - Convenience functions for the Render extension. (32-bits)"
arch=('x86_64')
url='https://xcb.freedesktop.org'
license=('custom')
depends=('lib32-libxcb'
         "xcb-util-renderutil=${pkgver}"
         )
makedepends=('xorg-util-macros')
source=("https://xorg.freedesktop.org/archive/individual/lib/xcb-util-renderutil-${pkgver}.tar.xz"{,.sig}
        )
sha512sums=('9cfa9201be2df7c0b832e1e1fe506e7c7a1e0f2b1b1d4a4b58620eadc241190a36478fa3ea27c32047fa79bf199f17dcd0b106853dbf5eda8cd584f3fc2b0c15'
            'SKIP'
            )
options=('debug')
validpgpkeys=('4A193C06D35E7C670FA4EF0BA2FB9E081F2D130E') # Alan Coopersmith <alan.coopersmith@oracle.com>

prepare() {
  mkdir -p build
}

build() {
  export CFLAGS+=" -m32"
  export CXXFLAGS+=" -m32"
  export LDFLAGS+=" -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd build
  ../"xcb-util-renderutil-${pkgver}"/configure \
    --prefix=/usr \
    --libdir=/usr/lib32 \
    --host=i686-linux-gnu \
    --disable-static

  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install

  install -Dm644 "xcb-util-renderutil-${pkgver}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"

  rm -fr "${pkgdir}/usr/include"
}
