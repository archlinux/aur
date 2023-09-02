#Maintainer: Matthias Mailänder <matthias at mailaender dot name>
#Contributor NiNjA <heinep at gmail dot com>
#Contributor float <flo.at at gmx dot de>
#Contributor adlerweb <aur at adlerweb dot info>

pkgname=s25rttr
pkgver=0.9.5
pkgrel=3
pkgdesc="Return to the Roots is a reimplementation of Settlers II (Die Siedler II) by BlueByte Software GmbH. Put the files from the original game in the folder (/usr/share/s25rttr/S2/)"
arch=('i686' 'x86_64')
url="https://www.siedler25.org/"
license=('GPL3')
depends=('sdl2' 'sdl2_mixer' 'libcurl-gnutls' 'bzip2' 'glfw' 'libsamplerate' 'boost-libs' 'miniupnpc' 'lua51')
makedepends=('cmake' 'boost')
install="s25rttr.install"
source=("$pkgname-$pkgver.tar.gz::https://github.com/Return-To-The-Roots/s25client/releases/download/v$pkgver/s25client_src_v$pkgver.tar.gz"
    "s25rttr-gcc13.patch")
sha256sums=('c6a9ef5b90943b5f2e81543f1e3290ff773663a45ebbbcc5a786bb5f5495fbec'
    '66364841bf6e119e81117cf5aae75f4f84b7d9b16f7acd8edc63e8ecac9dde1e')
provides=("return-to-the-roots=${pkgver}")
conflicts=("return-to-the-roots")

prepare() {
    patch --forward --strip=1 --input="${srcdir}/s25rttr-gcc13.patch"
}

build() {
    cmake -B build -S "s25client_v$pkgver" \
    -D CMAKE_CXX_FLAGS="-Wno-error=deprecated-declarations -Wno-dangling-reference" \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D RTTR_BUILD_UPDATER=OFF \
    -D RTTR_USE_SYSTEM_LIBS=ON \
    -D BUILD_TESTING=OFF \
    -D LUA_INCLUDE_DIR=/usr/include/lua5.1/

    cmake --build build
}

package() {
    pushd build
        make DESTDIR="$pkgdir" install
    popd

    pushd "s25client_v$pkgver"
        install -D -m 0644 tools/release/debian/s25rttr.desktop "${pkgdir}/usr/share/applications/s25rttr.desktop"
        install -D -m 0644 tools/release/debian/s25rttr.png "${pkgdir}/usr/share/icons/hicolor/64x64/apps/s25rttr.png"
    popd
}
