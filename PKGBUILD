# Maintainer: Amolith <amolith@secluded.site>

pkgname=git-series-git
_pkgname=${pkgname%-git}
pkgver=0.9.1.r34.g9c5d40e
pkgrel=1
pkgdesc='Track changes to a patch series over time'
arch=('x86_64')
url='https://github.com/git-series/git-series'
license=('MIT')
depends=('git' 'libgit2' 'libssh2' 'openssl')
makedepends=('cargo' 'libgit2' 'libssh2')
provides=('git-series')
conflicts=('git-series')
source=("git+https://github.com/git-series/git-series.git#branch=master")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname" || exit
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "$_pkgname" || exit
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$_pkgname" || exit
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export LIBGIT2_SYS_USE_PKG_CONFIG=1
  export LIBSSH2_SYS_USE_PKG_CONFIG=1
  cargo build --frozen --release --all-features
}

check() {
  cd "$_pkgname" || exit
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd "$_pkgname" || exit
  install -Dm755 "target/release/git-series" "$pkgdir/usr/bin/git-series"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 git-series.1 "$pkgdir/usr/share/man/man1/git-series.1"
}
