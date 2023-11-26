# Maintainer: Amolith <amolith@secluded.site>
pkgname=dotree-git
_pkgname=dt
pkgdesc="A small, interactive command runner"
_pkgid="${pkgname%-bin}-${pkgver}"
arch=("any")
url="https://github.com/KnorrFG/dotree"
_branch='main'
pkgver=r56.fe473a6
pkgrel=1
license=("GPL-3.0")
makedepends=("git" "cargo")
source=("$pkgname::git+$url.git#branch=$_branch")
sha256sums=("SKIP")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")

pkgver() {
  cd "$pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd $pkgname

  cargo build --release --frozen
}

check() {
  cd "$pkgname"
  cargo test --frozen
}

package() {
  cd "$pkgname"
  install -Dm755 "target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
