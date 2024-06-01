# Maintainer: Romain Chardiny <romain.chardiny@gmail.com>
pkgname=floc-git
pkgver=r28.7fc641a
pkgrel=1
pkgdesc="Flo Compiler"
arch=("any")
url="https://github.com/romch007/floc"
license=('MIT')
depends=("llvm" "clang")
provides=('floc')
makedepends=('git' 'rust') # 'bzr', 'git', 'mercurial' or 'subversion'
source=('git+https://github.com/romch007/floc.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/floc"

# Git, no tags available
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/floc"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$srcdir/floc"
  cargo build --release --locked --offline
}

package() {
  cd "$srcdir/floc"

  install -Dm755 target/release/floc "$pkgdir"/usr/bin/floc

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/floc/LICENSE
}
