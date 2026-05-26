# Maintainer: maqsatto <maqsatto@users.noreply.github.com>

pkgname=rux-git
pkgver=0.2.1.r33.g35a6787
pkgrel=1
pkgdesc='Rux programming language compiler (development version)'
arch=('x86_64')
url='https://github.com/rux-lang/Rux'
license=('MIT')
depends=('gcc-libs')
makedepends=('cmake' 'git' 'gcc')
provides=('rux')
conflicts=('rux')
source=('git+https://github.com/maqsatto/Rux.git#branch=linux-x64-host-support')
sha256sums=('SKIP')

pkgver() {
  cd Rux

  local version
  version="$(grep -m1 'project(Rux VERSION' CMakeLists.txt | sed -E 's/.*VERSION[[:space:]]+([0-9.]+).*/\1/')"

  printf '%s.r%s.g%s' "$version" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cmake -S Rux -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build --parallel
}

package() {
  install -Dm755 build/rux "$pkgdir/usr/bin/rux"
  install -Dm644 Rux/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 Rux/README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
