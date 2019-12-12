# Maintainer: Arthur LAURENT <arthur.laurent4@gmail.com>
pkgname='ashes-git'
pkgver=r374.13b9bf7e
pkgrel=1
pkgdesc='Drop-in replacement for Vulkan shared library, for older hardware compatibility'

arch=('any')
url="https://github.com/DragonJoker/Ashes"
license=('MIT')

provides=('ashes')
depends=('libxrandr' 'mesa' 'vulkan-headers')
makedepends=('cmake' 'git')
conflicts=('ashes')

source=('git+https://github.com/DragonJoker/Ashes.git')
sha256sums=('SKIP')

pkgver() {
  cd 'Ashes'
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
    cd 'Ashes'
    git submodule update --init
}

build() {
    cd 'Ashes'
    cmake . -DASHES_BUILD_SAMPLES=OFF -DASHES_BUILD_TEMPLATES=OFF -DASHES_BUILD_SW_SAMPLES=OFF -DASHES_BUILD_TESTS=OFF -DPROJECTS_GENERATE_DOC=OFF -DPROJECTS_PROFILING=OFF -DPROJECTS_USE_PRECOMPILED_HEADERS=OFF -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="$pkgdir/usr"
    cmake --build .
}

package() {
    cd 'Ashes'
    cmake --build . --target install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/ashes-git/LICENSE"
}
