# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>
pkgname=ja2-stracciatella
pkgver=0.20.0
pkgrel=2
pkgdesc="Jagged Alliance 2 Stracciatella"
arch=('x86_64')
url="https://github.com/ja2-stracciatella/ja2-stracciatella"
license=('custom')
depends=('sdl2>2.0.6' 'fltk' 'rapidjson' 'lua53' 'sol2')
makedepends=('cargo' 'cmake' 'ninja' 'string-theory')
_magic_enum_ver='0.7.3'
# This is version 0.11.1; miniaudio doesn't do tags apparently
_miniaudio_commit='c153a947919808419b0bf3f56b6f2ee606d6c5f4'
source=(
    "https://github.com/${pkgname}/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
    # Header-only dependencies of JA2
    "https://github.com/Neargye/magic_enum/releases/download/v${_magic_enum_ver}/magic_enum.hpp"
    "https://github.com/mackron/miniaudio/archive/${_miniaudio_commit}.tar.gz"
)
sha256sums=('432e8c834ce5c5aaa2be3e10e44c47963970936ede39c33c95e7d8f874770ff8'
    '903f026fedfff836619b78e10ce4a352fff314ba801aba672a4b509735e38540'
    '5feb82b4ed59196aabac7325339621b49caddc078b86399d1a0b5425177462a9')

build() {
    cd "${srcdir}"

    # We deliberately don't set the build type here, because upstream sets a
    # reasonable default type
    cmake -GNinja -B build \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        -DEXTRA_DATA_DIR=/usr/share/ja2 \
        -DLOCAL_LUA_LIB=OFF \
        -DLOCAL_SOL_LIB=OFF \
        -DLOCAL_RAPIDJSON_LIB=OFF \
        -DLOCAL_STRING_THEORY_LIB=OFF \
        -DLOCAL_MAGICENUM_LIB=OFF \
        -DMAGICENUM_INCLUDE_DIR="${srcdir}" \
        -DLOCAL_MINIAUDIO_LIB=OFF \
        -DMINIAUDIO_INCLUDE_DIR="${srcdir}/miniaudio-${_miniaudio_commit}" \
        -DWITH_UNITTESTS=OFF \
        "${srcdir}/ja2-stracciatella-${pkgver}"
    cmake --build build
}

package() {
    cd "${srcdir}"

    DESTDIR="${pkgdir}" cmake --install build

    install -m644 -Dt "${pkgdir}/usr/share/doc/${pkgname}" "${srcdir}/ja2-stracciatella-${pkgver}/README.md"
    install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" "${srcdir}/ja2-stracciatella-${pkgver}/SFI Source Code license agreement.txt"
}
