# Maintainer: Leonid Murin (Dasperal) <Dasperal1 at gmail dot com>
pkgname=inter-heretic
pkgver=6.0
pkgrel=1
pkgdesc="A limit-removing source port of Heretic with enhancements and translation to the Russian language"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/JNechaevsky/inter-doom"
license=('GPL2')
depends=('sdl2>=2.0.18' 'sdl2_mixer>=2.0.2' 'sdl2_net>=2.0.0' 'libsamplerate')
makedepends=(cmake python3 git)
optdepends=('heretic1-wad: Heretic shareware game data')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/JNechaevsky/inter-doom/archive/refs/tags/heretic-${pkgver}.tar.gz"
        "01-unique-resource-locations.patch")
b2sums=('fae01517158d654b85bad17c97d861bcc58733a0f8eb6511ebb059f3cba59b28a2ab752ce63bf968afca142de5e7d758fa5dd4ae93c0e53b248d1c36f91ce165'
        '5417bea2dcd92e25af85bb3272c24e5e6930064f687b24d89aa08393948fe41f091fe0e692d8f58eb11c43248459ab1da40ed3fca2ff4a73db688e3b89fdd825')

prepare() {
    cd "${srcdir}/inter-doom-heretic-${pkgver}"
    # Store internal resources in a unique location for each game to fix conflicts between packages
    patch --strip=1 -i "${srcdir}/01-unique-resource-locations.patch"
}

build() {
    # Upstream forces `-O2` for 'Release' build type
    cmake -S "inter-doom-heretic-${pkgver}" -B build \
    -D CMAKE_BUILD_TYPE="Release" \
    -D CMAKE_INSTALL_PREFIX="/usr" \
    -D COMPILE_DOOM="OFF" \
    -D COMPILE_HERETIC="ON" \
    -D COMPILE_HEXEN="OFF" \
    -D COMPILE_STRIFE="OFF" \
    -D BUILD_VERSION_OVERWRITE="${pkgver}"
    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
    mv "${pkgdir}/usr/share/doc/inter-doom/GPL.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    rm -r "${pkgdir}/usr/share/doc"
}
