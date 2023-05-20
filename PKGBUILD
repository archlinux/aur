pkgname=lib32-xcb-util-image
pkgver=0.4.1
pkgrel=1
pkgdesc="Utility libraries for XC Binding - Port of Xlib's XImage and XShmImage functions. (32-bits)"
arch=('x86_64')
url='https://xcb.freedesktop.org'
license=('custom')
depends=('lib32-libxcb'
         "xcb-util-image=${pkgver}"
         )
makedepends=('xorg-util-macros')
source=("https://xorg.freedesktop.org/archive/individual/lib/xcb-util-image-${pkgver}.tar.xz"{,.sig}
        )
sha512sums=('9b47ba38b91196d76541b6ccabeaf291d3b91036f15422909cd6a79b3fd1a9786d5b1728e411bc41cfdf3d60a253485f4ef7c65ffa6ae646fa93439ec782746e'
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
  ../"xcb-util-image-${pkgver}"/configure \
    --prefix=/usr \
    --libdir=/usr/lib32 \
    --host=i686-linux-gnu \
    --disable-static

  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install

  install -Dm644 "xcb-util-image-${pkgver}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"

  rm -fr "${pkgdir}/usr/include"
}
