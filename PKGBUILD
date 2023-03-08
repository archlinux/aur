# Maintainer: Salamandar <felix@piedallu.me>

_pkgname=pylyzer
pkgname="${_pkgname}-git"
pkgver=0.0.10.r0.gf255d0e
pkgrel=1
pkgdesc='A fast static code analyzer & language server for Python - git version'
arch=('any')
url='https://github.com/mtshiba/pylyzer'
license=('MIT')
conflicts=( "$_pkgname" )
provides=( "$_pkgname" )
makedepends=(
    'cargo'
)
depends=(
)

source=(
    "git+${url}"
)
sha256sums=(
    'SKIP'
)
# Disable checks for now...
BUILDENV+=('!check')

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
    cargo build --frozen --release --all-features
}

check() {
    cd "$_pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo test --frozen --all-features
}

package () {
    cd "$_pkgname"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$_pkgname"
}
