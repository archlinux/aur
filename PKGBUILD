# Maintainer: Rafael Silva <perigoso@riseup.net>

_pkgname='bmputil'
pkgname="${_pkgname}-git"
pkgver=r57.59839df
pkgrel=1
pkgdesc='A tool for flashing Black Magic Probe firmware '
arch=('x86_64')
url='https://black-magic.org'
license=('None')
makedepends=('cargo')
source=("git+https://github.com/blackmagic-debug/bmputil.git")
sha512sums=('SKIP')

pkgver() {
    cd "${_pkgname}"

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${_pkgname}"

    cargo fetch --locked --target 'x86_64-unknown-linux-gnu'
}

build() {
    cd "${_pkgname}"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --features 'vendored'
}

check() {
    cd "${_pkgname}"

    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --features 'vendored'
}

package() {
    cd "${_pkgname}"

    install -Dm 755 -t "${pkgdir}/usr/bin/" "target/release/${_pkgname}"
    # install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
