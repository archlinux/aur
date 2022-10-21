pkgname=lib32-xcb-util-wm
pkgver=0.4.2
pkgrel=1
pkgdesc="Utility libraries for XC Binding - client and window-manager helpers for ICCCM. (32-bits)"
arch=('x86_64')
url='https://xcb.freedesktop.org'
license=('custom')
depends=('lib32-libxcb'
         "xcb-util-wm=${pkgver}"
         )
makedepends=('xorg-util-macros')
source=("https://xorg.freedesktop.org/archive/individual/lib/xcb-util-wm-${pkgver}.tar.xz"{,.sig}
        )
sha512sums=('eab6588e6a47d28a3b25ecd13b5018529419db6b49c74458c093699b60a194933be1e1f6f7799abf03344f7ebc7af88586ff2935938d53644bdd5c763a7fa9b0'
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
  ../"xcb-util-wm-${pkgver}"/configure \
    --prefix=/usr \
    --libdir=/usr/lib32 \
    --host=i686-linux-gnu \
    --disable-static

  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install

  install -Dm644 "xcb-util-wm-${pkgver}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"

  rm -fr "${pkgdir}/usr/include"
}
