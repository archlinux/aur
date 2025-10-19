# Maintainer: Danko Aleksejevs <danko@very.lv>
# Contributor: Matthias De Bie <mattydebie@gmail.com>
# Contributor: Yi donghoon <icq4ever@gmail.com>
pkgname='kemai-git'
pkgdesc='A QT6 client for Kimai time tracker'
pkgver=0.12.0.r451.728d829
pkgrel=1
url='https://github.com/AlexandrePTJ/kemai'
arch=('i686' 'x86_64')
license=('MIT')
source=('git+https://github.com/AlexandrePTJ/kemai.git#branch=develop')
sha256sums=('SKIP')
makedepends=('git' 'cmake' 'range-v3' 'magic_enum' 'qt6-tools')
depends=('qt6-base' 'spdlog' 'libxss' 'hicolor-icon-theme' 'fmt' 'libx11')
provides=('kemai')
conflicts=('kemai')

pkgver() {
  cd kemai
  echo $(grep -oP '(?<=KemaiProject VERSION )\S+' CMakeLists.txt) .r $(git rev-list --count HEAD) . $(git rev-parse --short HEAD) | tr -d '[:space:]'
}

build() {
  cmake kemai \
    -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DKEMAI_BUILD_LOCAL_DEPENDENCIES=OFF \
    -DCMAKE_CXX_STANDARD_INCLUDE_DIRECTORIES=/usr/include/magic_enum \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 kemai/LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname"
}
