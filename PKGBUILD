# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>
# Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=ja2-stracciatella-git
pkgver=v0.20.0.r179.g0fa963e2d
pkgrel=1
pkgdesc='Jagged Alliance 2 Stracciatella'
arch=('x86_64')
url="https://github.com/ja2-stracciatella/ja2-stracciatella"
license=('custom')
conflicts=('ja2-stracciatella')
provides=('ja2-stracciatella')
depends=('sdl2' 'sdl2>2.0.6' 'lua53')
optdepends=('fltk: GUI launcher')
makedepends=('git' 'cargo' 'cmake' 'ninja' 'string-theory' 'sol2' 'fltk')
_magic_enum_ver='0.8.2'
# This is version 0.11.9; miniaudio doesn't do tags apparently
_miniaudio_commit='4dfe7c4c31df46e78d9a1cc0d2d6f1aef5a5d58c'
source=(
    'git+https://github.com/ja2-stracciatella/ja2-stracciatella.git'
    # Header-only dependencies of JA2
    "https://github.com/Neargye/magic_enum/releases/download/v${_magic_enum_ver}/magic_enum.hpp"
    "https://github.com/mackron/miniaudio/archive/${_miniaudio_commit}.tar.gz"
)
sha256sums=('SKIP'
            '903f026fedfff836619b78e10ce4a352fff314ba801aba672a4b509735e38540'
            '76c154a60e320ae2054ac0e93480f2dffc12a5129bdb2ed4a62e0cce8d345c36')
b2sums=('SKIP'
        '054a8de35818f3217b157601b3402ed8bc62c203e726f74ca5c696a36520429d05213fc742c675e6c7980226a9604c2ed7602b1284834fb7bf9fae6fac9fc2dd'
        'c579cb515633aaf947112ba66223ef2041e3d15aa66ca262b6afaa8a90f032a90ad06599ce16be4fc8b05ddab3b51e7e2dce8d66852ccb6fb0c7ae55cc94deb3')

pkgver() {
    cd "${srcdir}/ja2-stracciatella"
    git describe --tags --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}"

    cmake -GNinja -B build -S "${srcdir}/ja2-stracciatella" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
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
        -Wno-dev
    cmake --build build
}

package() {
    cd "${srcdir}/"

    DESTDIR="${pkgdir}" cmake --install build

    install -m644 -Dt "${pkgdir}/usr/share/doc/${pkgname}" "${srcdir}/ja2-stracciatella/README.md"
    install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" "${srcdir}/ja2-stracciatella/SFI Source Code license agreement.txt"
}
