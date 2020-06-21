# Maintainer: Junio Calú <junio.calu@gmail.com>

pkgname=dde-istate-menus
pkgver=r53.5738918
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
            'b2d24f07d1daea87ccbf965effe0374dd8dd7928c44b94ed266213ad945056f5f6f20b1baf216a03a43032d03ead8359f1b1c6ed331b010d39ec8aae2e228855')

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
