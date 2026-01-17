# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Maxime Gauduin <alucryd@archlinux>org>
# Contributor: quietvoid <tcChlisop0@gmail.com>

_android_arch=x86

pkgname=android-${_android_arch}-libdovi
pkgver=3.3.2
pkgrel=1
arch=('any')
pkgdesc="Library to read and write Dolby Vision metadata (Android ${_android_arch})"
url='https://github.com/quietvoid/dovi_tool/tree/main/dolby_vision'
license=('MIT')
groups=('android-libdovi')
depends=('android-ndk')
makedepends=('android-rust')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://github.com/quietvoid/dovi_tool/archive/refs/tags/libdovi-${pkgver}.tar.gz")
md5sums=('7586c4ff125ddc112bda475cf330cf6e')

prepare() {
    cd "${srcdir}/dovi_tool-libdovi-${pkgver}"
    source android-rust-env ${_android_arch}
    android_rust_prepare

    cargo fetch \
        --manifest-path dolby_vision/Cargo.toml
}

build() {
    cd "${srcdir}/dovi_tool-libdovi-${pkgver}"
    source android-rust-env ${_android_arch}

    android_cargo_cbuild \
        --manifest-path dolby_vision/Cargo.toml
}

package() {
    cd "${srcdir}/dovi_tool-libdovi-${pkgver}"
    source android-rust-env ${_android_arch}

    android_cargo_cinstall \
        --manifest-path dolby_vision/Cargo.toml \
        --destdir "${pkgdir}"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a

    install -vDm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
