# Maintainer: Hanus Valenta <hans@hanusvalenta.com>
pkgname=grimatrix-git
pkgver=r4.591a755
pkgrel=1
pkgdesc="Warhammer CLI App screen waster inspired by cmatrix"
arch=('x86_64')
url="https://git.hanusvalenta.com/hans/grimatrix"
license=('EUPL1.2')
depends=('ncurses')
makedepends=('git' 'cmake' 'gcc')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://git.hanusvalenta.com/hans/grimatrix.git")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"

  if git describe --long --tags --abbrev=7 >/dev/null 2>&1; then
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
  else
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  fi
}

build() {
  cd "${pkgname%-git}"
  cmake -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  cd "${pkgname%-git}"
  
  install -Dm755 build/grimatrix "$pkgdir/usr/bin/grimatrix"
  
  install -Dm644 litanies.txt "$pkgdir/usr/share/grimatrix/litanies.txt"
  install -Dm644 logo.txt "$pkgdir/usr/share/grimatrix/logo.txt"
  
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
