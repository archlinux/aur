# Maintainer: Naharashu 130159705+Naharashu@users.noreply.github.com
pkgname=flamelang-git
pkgver=r167ded0
pkgrel=1
pkgdesc="Flame language transpiler (git main branch)"
arch=('x86_64')
url="https://github.com/TheFlameLang/Flame"
license=('MIT')
depends=('glibc' 'gcc-libs') 
makedepends=('git' 'make' 'gcc')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags 2>/dev/null | sed 's/\([^-]*-\)*g/r/;s/-/./g' ||
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${pkgname%-git}"
  make
  cd "$srcdir/${pkgname%-git}/shiver"
  make
}

package() {
  cd "$srcdir/${pkgname%-git}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  echo "Installing Flame..."
  install -Dm755 ./flame "${pkgdir}/usr/bin/flame"
  
  cd "$srcdir/${pkgname%-git}/shiver"
  echo "Installing Shiver(build system for Flame)..."
  install -Dm755 ./shiver "${pkgdir}/usr/bin/shiver"
}
