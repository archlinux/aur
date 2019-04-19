pkgname=lib32-xcb-util-wm
pkgver=0.4.1
pkgrel=1
pkgdesc="Utility libraries for XC Binding - client and window-manager helpers for ICCCM. (32-bits)"
arch=('x86_64')
url="https://xcb.freedesktop.org"
license=('custom')
depends=('lib32-libxcb'
         'xcb-util-wm'
         )
makedepends=('xorg-util-macros')
source=("https://xcb.freedesktop.org/dist/xcb-util-wm-${pkgver}.tar.bz2"
        'LICENSE::https://git.archlinux.org/svntogit/packages.git/plain/trunk/LICENSE?h=packages/xcb-util-wm')
sha512sums=('cd1b3bcf9fcfc52e329ddc42b370d50dcf7d473c8e94f01cf7ea7fdbe0dc9176790890214eecb2a8ac43405f4938c121e38d282ae988cd8e90a6610d214ef326'
            '62f83468f9d9503a5a8c1ebaac78cbaefe3c485f8bfd7192817ec59254872fe2914ed66ae8b9e7f7a6ef5af283048c11390f44eb8f0f70b1c136ef5c75282e8c')

prepare() {
  mkdir -p build
}

build() {
  export CFLAGS+=" -m32"
  export CXXFLAGS+=" -m32"
  export LDFLAGS+=" -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd build
  ../xcb-util-wm-${pkgver}/configure \
    --prefix=/usr \
    --libdir=/usr/lib32 \
    --host=i686-linux-gnu \
    --disable-static

  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install

  install -Dm644 "${srcdir}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  rm -fr "${pkgdir}/usr/include"
}
