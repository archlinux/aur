# Maintainer: mokurin000 <mokurin000@gmail.com>

pkgname=fitgirl-ddl-git
pkgdesc="fitgirl-repacks.site extractor"
_pkgname=fitgirl-ddl
pkgver=r27.g6fac928
pkgrel=1
url="https://github.com/mokurin000/fitgirl-ddl"
arch=('x86_64' 'aarch64')
license=('MIT')
depends=(gcc-libs glibc libcurl.so=4-64)
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

    export RUSTFLAGS="-C link-args=-flto"
    cargo build --frozen --release --bin ${_pkgname}
}

package() {
    conflicts=('fitgirl-ddl')
    provides=('fitgirl-ddl')

    cd "${_pkgname}"

    install -vDm755 "target/release/${_pkgname}" -t "${pkgdir}/usr/bin/"
    install -vDm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${_pkgname}-git"
}
