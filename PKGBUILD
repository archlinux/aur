# Maintainer: Amolith <amolith@secluded.site>
pkgname=dela-git
_pkgname=${pkgname%-git}
pkgdesc='A task runner that delegates the work to other tools'
arch=("x86_64" "aarch64")
url="https://github.com/aleyan/dela"
_branch='main'
pkgver=r218.90fc83b
pkgrel=2
license=("MIT")
makedepends=("git" "cargo")
depends=("glibc" "gcc-libs")
source=("$pkgname::git+$url.git#branch=$_branch")
sha256sums=('SKIP')
provides=("$_pkgname")

pkgver() {
  cd "$pkgname" || exit
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$pkgname" || exit
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --all-features
}

check() {
  cd "$pkgname" || exit
  export RUSTUP_TOOLCHAIN=stable
  cargo test --all-features
}

package() {
  install -Dm755 "$pkgname/target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
