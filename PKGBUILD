# Maintainer: taotieren <admin@taotieren.com>

pkgname=breed-enter-rust-git
pkgver=0.1.6.r2.g9519e03
pkgrel=7
pkgdesc="A rust version of breedenter, automatically start browser http://192.168.1.1/ when breed is entered."
arch=($CARCH)
url="https://github.com/wwng2333/breed-enter-rust"
license=('MIT')
provides=(${pkgname%-git} breed-enter breedenter-rust)
conflicts=(${pkgname%-git} breed-enter breedenter-rust)
replaces=()
depends=(glibc
    gcc-libs)
makedepends=(
    git
    cargo)
backup=()
options=()
install=
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    (
        set -o pipefail
        git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
            printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
}

build() {
    cd "${srcdir}/${pkgname}/"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --all-features
}

check() {
    cd "${srcdir}/${pkgname}/"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --release --all-features
}

package() {
    cd "${srcdir}/${pkgname}/"

    export RUSTUP_TOOLCHAIN=stable
    install -Dm755 -t "$pkgdir/usr/bin/" "target/release/breedenter-rust"

}
