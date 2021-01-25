# Maintainer: Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

pkgname=corrosion-git
pkgver=r164.2e4c62c
pkgrel=1
pkgdesc="Integrate Rust into existing CMake projects"
arch=('x86_64')
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
  cd "${pkgname%-git}"
  cmake -DCMAKE_INSTALL_PREFIX=/usr -B build
  make -C build
}

package() {
  cd "${pkgname%-git}"
  make -C build DESTDIR="${pkgdir}" PREFIX=/usr install
}