# Maintainer: mokurin000 <mokurin000@gmail.com>

pkgname=fitgirl-ddl-iced-git
pkgdesc="fitgirl-repacks.site extractor (iced backend)"
conflicts=('fitgirl-ddl-iced')
provides=('fitgirl-ddl-iced')
_pkgname=fitgirl-ddl-iced
_binname=${_pkgname}
pkgver=r7.g450cf2f
pkgrel=1
url="https://github.com/mokurin000/${_pkgname}"
arch=('x86_64' 'aarch64')
license=('MIT')
depends=(glibc gcc-libs 'libcurl.so=4-64')
makedepends=(
    'rust' 'git'
)


source=("git+${url}.git")

sha256sums=('SKIP')

prepare() {
    cd "${_pkgname}"

    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target ${CARCH}-unknown-linux-gnu
}

pkgver() {
    cd "${_pkgname}"

    export RUSTUP_TOOLCHAIN=stable
    echo "r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
    cd "${_pkgname}"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    cargo build --frozen --release --bin ${_binname} --bin ${_binname}-select
}

package() {

    cd "${_pkgname}"

    install -vDm755 "target/release/${_binname}" "${pkgdir}/usr/bin/${_binname}"
    install -vDm755 "target/release/${_binname}-select" "${pkgdir}/usr/bin/${_binname}-select"
    install -vDm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
