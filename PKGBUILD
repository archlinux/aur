# Maintainer: mokurin000 <mokurin000@gmail.com>

pkgname=fitgirl-ddl-qt6-git
pkgdesc="fitgirl-repacks.site extractor (Qt6 backend)"
conflicts=('fitgirl-ddl-qt6')
provides=('fitgirl-ddl-qt6')
_pkgname=fitgirl-ddl
_binname=fitgirl-ddl_gui
pkgver=r28.g44f72c3
pkgrel=1
url="https://github.com/mokurin000/${_pkgname}"
arch=('x86_64' 'aarch64')
license=('MIT')
depends=(gcc-libs glibc 'libcurl.so=4-64' qt6-base)
makedepends=(
    'rust' 'git'
)


source=("git+${url}.git")
options=(!lto)
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
    cargo build --frozen --release --bin ${_binname} --no-default-features -F qt
}

package() {

    cd "${_pkgname}"

    install -vDm755 "target/release/${_binname}" "${pkgdir}/usr/bin/fitgirl-ddl-qt"
    install -vDm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
