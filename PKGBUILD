# Maintainer: Leonid Murin (Dasperal) <Dasperal1 at gmail dot com>
pkgname=inter-doom
pkgver=6.2.1
pkgrel=1
pkgdesc="A limit-removing source port of Doom with enhancements and translation to the Russian language"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/JNechaevsky/inter-doom"
license=('GPL2')
depends=('sdl2>=2.0.18' 'sdl2_mixer>=2.0.2' 'sdl2_net>=2.0.0' 'libsamplerate')
makedepends=(cmake python3)
optdepends=('doom1-wad: Doom shareware game data')
conflicts=('inter-doom-git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/JNechaevsky/inter-doom/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('1873ee89b109dc9ac83d6584f44f6137c907a30026d88a4976d7b96e30974fb107d5584cf6b9539286f6ebe5f5db7cb605c21fda7895559b01a230fd15a42ed9')

build() {
    # Upstream forces `-O2` for 'Release' build type
    cmake -S "${pkgname}-${pkgver}" -B build \
    -D CMAKE_BUILD_TYPE="Release" \
    -D CMAKE_INSTALL_PREFIX="/usr" \
    -D COMPILE_DOOM="ON" \
    -D COMPILE_HERETIC="OFF" \
    -D COMPILE_HEXEN="OFF" \
    -D COMPILE_STRIFE="OFF" \
    -D BUILD_VERSION_OVERWRITE="${pkgver}" \
    -D NO_GIT_HASH="ON"
    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
    mv "${pkgdir}/usr/share/doc/${pkgname}/GPL.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    rm -r "${pkgdir}/usr/share/doc"
}
