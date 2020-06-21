# Maintainer: Junio Calú <junio.calu@gmail.com>

pkgname=dde-istate-menus
pkgver=r57.c6c69bb
pkgrel=2
pkgdesc="A dde-dock plugin which aims to implement most features of Istat menus(macOS) for Deepin V20"
arch=('x86_64')
url="https://github.com/SeptemberHX/dde-istate-menus"
license=('GPL')
depends=('deepin-network-utils' 'qt5-base' 'nethogs'
         'procps-ng' 'deepin-dock' 'dtkwm' 'qt5-charts')
makedepends=('cmake' 'qt5-tools')
install="${pkgname}.install"
source=("$pkgname::git+https://github.com/SeptemberHX/dde-istate-menus"
        "fix.patch")
sha512sums=('SKIP'
            '22c886d9ae3b217b57095324cc450a47979f70bbe907f7b9f6c5f5454a6070cca1e25865b8acec5e656b67c7e2ef905262fbc47437558813b0dbda2349c4a42d')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd ${pkgname}
  patch -p1 -i ../fix.patch
  mkdir build
  cd nethogs
  make libnethogs
}

build() {
  cd $pkgname/build
  cmake ..  \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd $pkgname/build
  install -Dm 755 "libdde_istate_menus.so" "${pkgdir}/usr/lib/dde-dock/plugins/libdde_istate_menus.so"
}
