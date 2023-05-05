# Maintainer: Benoît Allard <benoit.allard@gmx.de>
_gitname=dbt-extractor
pkgname="python-${_gitname,,}-git"
pkgver=r333.0829913
pkgrel=1
pkgdesc="A tool to analyze and extract information from Jinja used in dbt projects."
arch=(x86_64)
url="https://github.com/dbt-labs/dbt-extractor"
license=('Apache')
makedepends=("cargo" "maturin")
depends=("glibc" "gcc-libs")
source=("git+https://github.com/dbt-labs/${_gitname}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${_gitname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${_gitname}"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "${_gitname}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "${_gitname}"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd $_gitname
    pip install . --prefix ${pkgdir}/usr
}
