# Maintainer: Eragon <eragon at eragon dot re>
# Contributor: MintStudios <mintstudios dot dev at gmail dot com>
# Contributor: Kuba Kowalik <bell@0x07.pl>

pkgname=libresprite
pkgver=1.1+dev
_pkgver=1.1-dev
pkgrel=0
epoch=1
pkgdesc='Animated sprite editor & pixel art tool -- Fork of the last GPLv2 commit of Aseprite'
arch=('x86_64' 'i686')
url='https://github.com/LibreSprite/LibreSprite'
license=('GPL')
depends=('pixman' 'curl' 'giflib' 'zlib' 'libpng' 'libjpeg-turbo' 'tinyxml' 'freetype2' 'libwebp' 'sdl2' 'sdl2_image' 'gtest' 'lua' 'zlib' 'nodejs')
makedepends=('cmake' 'ninja' 'git' 'patch')
source=("https://github.com/LibreSprite/LibreSprite/releases/download/v$_pkgver/SOURCE.CODE.+.submodules.tar.gz"
        "LibreSprite.desktop")
# The source code is packaged without a root folder, we need to extract it by ourself to fix that.
noextract=('SOURCE.CODE+.submodules.tar.gz')
sha256sums=('3a99338c85e37d165c13c224d462f15b384e404c6f8d019d43c365a57bf3d74e'
        '4d61881588d2c78825a135f31e83b45e310f25b92872d806b47bdf64bc36691a')
conflicts=("libresprite-appimage")

prepare() {
    # Here we extract the source code
    mkdir "$srcdir/LibreSprite"
    cd "$srcdir/LibreSprite"
    tar -xf "$srcdir/SOURCE.CODE.+.submodules.tar.gz"
}

build() {
    cd "$srcdir/LibreSprite"
	git submodule update --init --recursive
    mkdir -p build && cd build
    cmake -DUSE_SHARED_PIXMAN=ON \
        -DWITH_WEBP_SUPPORT=ON \
        -DUSE_SHARED_LIBWEBP=ON \
        -DUSE_SHARED_CURL=ON \
        -DUSE_SHARED_GIFLIB=ON \
        -DUSE_SHARED_JPEGLIB=ON \
        -DUSE_SHARED_ZLIB=ON \
        -DUSE_SHARED_LIBPNG=ON \
        -DUSE_SHARED_LIBLOADPNG=OFF \
        -DUSE_SHARED_TINYXML=ON \
        -DUSE_SHARED_SDL2=ON \
        -DUSE_SDL2_BACKEND=ON \
        -DENABLE_UPDATER=OFF \
        -DUSE_SHARED_FREETYPE=ON \
        -DFREETYPE_INCLUDE_DIR=/usr/include/freetype2 \
        -DCMAKE_INSTALL_PREFIX:STRING=/usr\
        -G Ninja ..
    ninja libresprite
}

package() {
    cd "$srcdir/LibreSprite"/build

    DESTDIR="$pkgdir/" ninja install
    install -Dm644 "$srcdir/LibreSprite.desktop" \
      "$pkgdir/usr/share/applications/LibreSprite.desktop"
    install -Dm644 "../data/icons/ase48.png" \
      "$pkgdir/usr/share/pixmaps/libresprite.png"
}

