# Maintainer: Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

pkgname=corrosion-git
pkgver=r183.94087ce
pkgrel=1
pkgdesc="Integrate Rust into existing CMake projects"
arch=('x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/AndrewGaspar/corrosion"
license=('MIT')
depends=('rust' 'cmake')
makedepends=('git')
provides=('corrosion')
conflicts=('corrosion')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DCORROSION_BUILD_TESTS=OFF -B build -S "${pkgname%-git}"
  cmake --build build --config Release
}

package() {
  DESTDIR="${pkgdir}" cmake --install build --config Release
}