# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Daniel Bermond <dbermond@archlinux.org>
# Contributor: Chocobo1 <chocobo1@archlinux.net>

_android_arch=aarch64

pkgname=android-${_android_arch}-rav1e
pkgver=0.7.1
pkgrel=2
arch=('any')
pkgdesc="An AV1 encoder focused on speed and safety (Android ${_android_arch})"
url="https://github.com/xiph/rav1e/"
license=('custom:BSD')
depends=('android-ndk')
makedepends=('android-rust'
             'nasm')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://github.com/xiph/rav1e/archive/refs/tags/v${pkgver}.tar.gz"
        "Cargo-rav1e-${pkgver}.lock::https://github.com/xiph/rav1e/releases/download/v${pkgver}/Cargo.lock")
md5sums=('2e48f60bea23049a750f0721e30cdd54'
         '3c8e14548d37d9fd0efad829bb979e76')

prepare() {
    cd "${srcdir}/rav1e-$pkgver"
    source android-rust-env ${_android_arch}
    android_rust_prepare

    cp -f "${srcdir}/Cargo-rav1e-${pkgver}.lock" Cargo.lock
    cargo fetch \
        --locked \
        --manifest-path Cargo.toml
}

build() {
    cd "${srcdir}/rav1e-$pkgver"
    source android-rust-env ${_android_arch}

    android_cargo_cbuild \
        --no-default-features \
        --features asm,threading,signal_support \
        --manifest-path Cargo.toml
}

package() {
    cd "${srcdir}/rav1e-$pkgver"
    source android-rust-env ${_android_arch}

    android_cargo_cinstall \
        --destdir "${pkgdir}" \
        --features asm,threading,signal_support \
        --no-default-features
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
    ${ANDROID_STRIP} -g "$pkgdir"/${ANDROID_PREFIX_LIB}/*.a
}
