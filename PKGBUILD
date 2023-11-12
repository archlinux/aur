# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>
pkgname=ja2-stracciatella
pkgver=0.21.0
pkgrel=2
pkgdesc="Jagged Alliance 2 Stracciatella"
arch=('x86_64')
url="https://github.com/ja2-stracciatella/ja2-stracciatella"
license=('custom')
depends=('sdl2>2.0.6' 'lua53')
optdepends=('fltk: GUI launcher')
makedepends=('cargo' 'cmake' 'ninja' 'string-theory' 'sol2' 'fltk')
_magic_enum_ver='0.8.2'
# This is version 0.11.9; miniaudio doesn't do tags apparently
_miniaudio_commit='4dfe7c4c31df46e78d9a1cc0d2d6f1aef5a5d58c'
source=(
    "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    # Header-only dependencies of JA2
    "magic_enum_${_magic_enum_ver}.hpp::https://github.com/Neargye/magic_enum/releases/download/v${_magic_enum_ver}/magic_enum.hpp"
    "https://github.com/mackron/miniaudio/archive/${_miniaudio_commit}.tar.gz"
)
sha256sums=('1c15b4f281bba9aff1c3409d4308d22840eb815a8a3ab53f7be69a5841f300a2'
            'f34487663db05b10acae7077dd0b5cf5794112a379567322e251ef0068875dc4'
            '76c154a60e320ae2054ac0e93480f2dffc12a5129bdb2ed4a62e0cce8d345c36')

build() {
    cd "${srcdir}" || return 1

    mkdir -p "${srcdir}/magic_enum"
    cp "${srcdir}/magic_enum_${_magic_enum_ver}.hpp" "${srcdir}/magic_enum/magic_enum.hpp"

    cmake -GNinja -B build -S "${srcdir}/ja2-stracciatella-${pkgver}" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DEXTRA_DATA_DIR=/usr/share/ja2 \
        -DLOCAL_LUA_LIB=OFF \
        -DLOCAL_SOL_LIB=OFF \
        -DLOCAL_STRING_THEORY_LIB=OFF \
        -DLOCAL_MAGICENUM_LIB=OFF \
        -DMAGICENUM_INCLUDE_DIR="${srcdir}/magic_enum" \
        -DLOCAL_MINIAUDIO_LIB=OFF \
        -DMINIAUDIO_INCLUDE_DIR="${srcdir}/miniaudio-${_miniaudio_commit}" \
        -DWITH_UNITTESTS=OFF \
        -Wno-dev
    cmake --build build
}

package() {
    cd "${srcdir}" || return 1

    DESTDIR="${pkgdir}" cmake --install build

    install -m644 -Dt "${pkgdir}/usr/share/doc/${pkgname}" "${srcdir}/ja2-stracciatella-${pkgver}/README.md"
    install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" "${srcdir}/ja2-stracciatella-${pkgver}/SFI Source Code license agreement.txt"
}
