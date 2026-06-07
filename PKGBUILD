# Maintainer: tioguda  <guda.flavio@gmail.com>
# Contributor: Bruno Goncalves <bigbruno@gmail.com>

_pkgname=gtcrn-ladspa
pkgname=${_pkgname}-git
pkgdesc="GTCRN Speech Enhancement LADSPA plugin using ONNX Runtime"
pkgver=r100.6ee156e
pkgrel=1
arch=('x86_64')
url="https://github.com/biglinux/gtcrn-ladspa"
license=('MIT')
depends=('gcc-libs' 'glibc' 'onnxruntime-cpu')
makedepends=('cargo' 'clang' 'git' 'python-onnx' 'python-onnxruntime-cpu' 'python-typing_extensions' 'rust')
provides=("${_pkgname}" 'ladspa-host')
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/biglinux/gtcrn-ladspa.git")
sha512sums=('SKIP')

pkgver() {
    cd ${srcdir}/${_pkgname}
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${_pkgname}/ladspa"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "${_pkgname}/ladspa"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    CARGO_BUILD_JOBS=$(nproc)
    export CARGO_BUILD_JOBS
    # GTCRN_PYTHON tells build.rs to use the system python instead of .venv/bin/python.
    export GTCRN_PYTHON=python

    cargo build --release --locked --features dynamic --no-default-features
}

package() {
    cd "${_pkgname}/ladspa"

    install -Dm755 "target/release/libgtcrn_ladspa_ort.so" "${pkgdir}/usr/lib/ladspa/libgtcrn_ladspa.so"

    install -Dm644 "../LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
