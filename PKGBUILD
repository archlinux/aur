# Maintainer: Junio Calú <junio.calu@gmail.com>

pkgname=dde-istate-menus
pkgver=r49.8973ca3
pkgrel=0
pkgdesc="A dde-dock plugin which aims to implement most features of Istat menus(macOS) for Deepin V20"
arch=('x86_64')
url="https://github.com/SeptemberHX/dde-istate-menus"
license=('GPL')
depends=('deepin-network-utils' 'qt5-base' 'nethogs'
         'procps-ng' 'deepin-dock')
makedepends=('cmake' 'qt5-tools')
install="${pkgname}.install"
source=("$pkgname::git+https://github.com/SeptemberHX/dde-istate-menus"
        "fix.patch")
sha512sums=('SKIP'
            '15ca181aa59a8849690a7b985041f645d96935f8ea1684608453a56aafd63488ff5d4a095cd3482af44c13976dc0b79090b898fd244df1e13cd4b23b782fcd23')

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
