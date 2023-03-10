# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>
# Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=ja2-stracciatella-git
pkgver=v0.20.0.r147.g42628dc4d
pkgrel=1
pkgdesc='Jagged Alliance 2 Stracciatella'
arch=('x86_64')
url="https://github.com/ja2-stracciatella/ja2-stracciatella"
license=('custom')
conflicts=('ja2-stracciatella')
provides=('ja2-stracciatella')
depends=('sdl2' 'sdl2>2.0.6' 'lua53' 'sol2')
optdepends=('fltk')
makedepends=('git' 'cargo' 'cmake' 'ninja' 'string-theory' 'fltk')
_magic_enum_ver='0.7.3'
# This is version 0.11.1; miniaudio doesn't do tags apparently
_miniaudio_commit='c153a947919808419b0bf3f56b6f2ee606d6c5f4'
source=(
    'git+https://github.com/ja2-stracciatella/ja2-stracciatella.git'
    # Header-only dependencies of JA2
    "https://github.com/Neargye/magic_enum/releases/download/v${_magic_enum_ver}/magic_enum.hpp"
    "https://github.com/mackron/miniaudio/archive/${_miniaudio_commit}.tar.gz"
)
sha256sums=('SKIP'
    '903f026fedfff836619b78e10ce4a352fff314ba801aba672a4b509735e38540'
    '5feb82b4ed59196aabac7325339621b49caddc078b86399d1a0b5425177462a9')
b2sums=('SKIP'
    '054a8de35818f3217b157601b3402ed8bc62c203e726f74ca5c696a36520429d05213fc742c675e6c7980226a9604c2ed7602b1284834fb7bf9fae6fac9fc2dd'
    '8518478e2adc5f7c0e122b82abb576b3795d1fc7918df09e1d2a0f9a0d31b46f9d1d57536119baf73981af487b51d9336ba753d83e9ecd0a19e9d7f391b27de6')

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
