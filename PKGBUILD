# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=ekphos-git
_pkgname="${pkgname%-git}"
pkgver=0.5.0.r102.gf04e6cf
pkgrel=2
pkgdesc='A lightweight, fast, terminal-based markdown research tool inspired by Obsidian'
arch=(x86_64 aarch64)
url='https://github.com/hanebox/ekphos'
license=('MIT')
makedepends=(cargo git)
provides=(${pkgname%-*}=$pkgver)
conflicts=(${pkgname%-*})
source=("$_pkgname::git+$url.git#branch=main")
sha256sums=('SKIP')
# validpgpkeys=()

pkgver() {
  cd "$_pkgname"
  git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
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
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/LICENSE" LICENSE
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/README.md" README.md
}

