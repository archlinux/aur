# Maintainer: Diego Frias <styx5242@gmail.com>
# Maintainer: Ayoub Canon <imkonnu@gmail.com>

pkgname=projectable-git
_pkgname=projectable
_bin=prj
pkgver=1.3.0.2.g52da9b4
pkgrel=1
pkgdesc="A TUI file manager built for projects."
arch=('any')
url="https://github.com/dzfrias/projectable"
_git="https://github.com/dzfrias/projectable.git"
license=('MIT')
depends=()
makedepends=('git' 'cargo')
source=("${_pkgname}::git+${_git}")
sha256sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    git describe --tags | sed 's/-/./g'
}

prepare() {
    cd "$_pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo update
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$_pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

# The tests are way too long on top of a long build time
#check() {
#    cd "$_pkgname"
#    export RUSTUP_TOOLCHAIN=stable
#    cargo test --frozen --all-features
#}

package() {
    cd "$_pkgname"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$_bin"
}
