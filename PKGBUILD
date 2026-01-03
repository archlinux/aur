# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=tsql-git
_pkgname="${pkgname%-git}"
pkgver=v0.2.0.r66.g4518df8
pkgrel=1
epoch=
pkgdesc="A modern PostgreSQL manager TUI"
arch=(x86_64 aarch64)
url="https://github.com/fcoury/tsql"
license=('MIT')
# depends=('tree-sitter==0.24.7')
makedepends=(cargo tree-sitter)
install=
changelog=
provides=(${pkgname%-*}=$pkgver)
conflicts=(${pkgname%-*})
source=("$_pkgname::git+$url.git#branch=master")
sha256sums=('SKIP')
# validpgpkeys=()

pkgver() {
  cd "$_pkgname"
  # cutting off 'foo-' prefix that presents in the git tag
  git describe --long --abbrev=7 | sed 's/^foo-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$_pkgname"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$_pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    # fix the naitive linking errors
    export RUSTFLAGS="-Clinker-plugin-lto"
    cargo build --release --frozen
}

package() {
  cd "$_pkgname"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$_pkgname"
}

