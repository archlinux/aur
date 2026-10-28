# Maintainer: Gijs Vermeulen <gijsvrm@gmail.com>
# Contributor: Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Daniel Bermond <dbermond@archlinux.org>
# Contributor: drakkan <nicola.murino at gmail dot com>

_pkgname=openh264
pkgname=lib32-openh264
pkgver=2.7.0
pkgrel=1
# https://github.com/cisco/openh264/blob/v2.7.0/Makefile#L33
_gtestver=1.15.2
pkgdesc='H.264 encoder and decoder (32-bit)'
arch=('x86_64')
url='https://www.openh264.org/'
license=('BSD-2-Clause')
depends=(
    'lib32-gcc-libs'
    'lib32-glibc'
    "${_pkgname}=${pkgver}")
makedepends=(
    'nasm')
provides=('libopenh264.so')
source=("https://github.com/cisco/openh264/archive/v${pkgver}/${_pkgname}-${pkgver}.tar.gz"
        "https://github.com/google/googletest/archive/v${_gtestver}/googletest-${_gtestver}.tar.gz")
sha256sums=('5178775c8b440073e70920e97d195efff721c0e56d0a78cc82c919e95d54924d'
            '7b42b4d6ed48810c5362c265a17faebe90dc2373c885e5216439d37927f02926')

# ENABLE64BIT=No selects the upstream 32-bit target (adds -m32 to CFLAGS/LDFLAGS).
# ENABLEPIC=Yes defines X86_32_PICASM, without which the x86 asm emits text
# relocations in a shared library.
_make_options=(
    ENABLE64BIT=No
    ENABLEPIC=Yes
    PREFIX='/usr'
    LIBDIR_NAME='lib32'
    SHAREDLIB_DIR='/usr/lib32')

prepare() {
    ln -sf "../googletest-${_gtestver}" "${_pkgname}-${pkgver}/gtest"
}

build() {
    make -C "${_pkgname}-${pkgver}" "${_make_options[@]}"
}

check() {
    make -C "${_pkgname}-${pkgver}" "${_make_options[@]}" test
    cd "${_pkgname}-${pkgver}/testbin"
    ./CmdLineExample.sh
}

package() {
    make -C "${_pkgname}-${pkgver}" "${_make_options[@]}" DESTDIR="$pkgdir" install-shared
    # the Makefile hardcodes libdir as $(PREFIX)/lib with no override hook
    sed -i 's|^libdir=/usr/lib$|libdir=/usr/lib32|' "${pkgdir}/usr/lib32/pkgconfig/${_pkgname}.pc"
    # headers are provided by the native openh264 package
    rm -r "${pkgdir}/usr/include"
    install -D -m644 "${_pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
