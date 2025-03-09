# Maintainer: taotieren <admin@taotieren.com>

pkgname=kicad-allegro-git
pkgver=r9.4968f13
pkgrel=7
pkgdesc="Converter from Allegro to KiCad, and Allegro extract viewer "
arch=($CARCH)
url="https://github.com/system76/kicad-allegro"
license=("unkown")
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
#replaces=()
depends=(glibc
    gcc-libs)
makedepends=(git
    cargo)
optdepends=('kicad')
backup=()
options=()
#install=${pkgname}.install
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
    export CARGO_TARGET_DIR=target
    cargo fix --bin "kicad-allegro" --tests
    #     cargo test --release
}

package() {
    cd "${srcdir}/${pkgname}/"
    export RUSTUP_TOOLCHAIN=stable
    cargo install --no-track --all-features --root "$pkgdir/usr/" --path .
}
