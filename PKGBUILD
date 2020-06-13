# Maintainer: Devin J. Pohly <djpohly+arch@gmail.com>
# Maintainer: Martin Kröning <m.kroening@hotmail.de>
# Contributor: sl1pkn07
# Contributor: Ryan Peters <sloshy45 at sbcglobal dot net>
# Contributor: Artefact2 <artefact2@gmail.com>
# Contributor: Lauri Niskanen <ape@ape3000.com>
# Contributor: Travis Nickles <ryoohki7@yahoo.com>
# Contributor: Stefan Lohmaier <noneuss at gmail dot com>
# Contributor: Dan Guzek <dguzek@gmail.com>
_pkgname=stepmania
pkgname=$_pkgname-git
pkgver=5.1.0.b2.r483.376e5f46d8
pkgrel=1
pkgdesc="An advanced rhythm game designed for both home and arcade use."
arch=(x86_64)
url=https://www.$_pkgname.com/
license=(MIT)
depends=(glew gtk2 libmad libpulse libtommath libva libvorbis)
makedepends=(cmake git ninja nasm)
provides=($_pkgname)
conflicts=($_pkgname)
source=(git+https://github.com/$_pkgname/$_pkgname.git)
sha256sums=('SKIP')

pkgver() {
    cd $_pkgname
    printf "%s" "$(git describe --tags | sed 's/v//g;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
    # Related issues
    # ffmpeg: https://github.com/stepmania/stepmania/issues/2016
    # jsoncpp: https://github.com/stepmania/stepmania/issues/1883
    # libpng: https://github.com/stepmania/stepmania/issues/1881
    # tomcrypt: https://github.com/stepmania/stepmania/issues/1885
    cmake -S $_pkgname -B build \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_C_FLAGS="$CPPFLAGS $CFLAGS" \
        -DCMAKE_CXX_FLAGS="$CPPFLAGS $CXXFLAGS" \
        -DCMAKE_INSTALL_PREFIX=/opt \
        -DCMAKE_INTERPROCEDURAL_OPTIMIZATION=ON \
        -DCMAKE_POSITION_INDEPENDENT_CODE=ON \
        -DWITH_SYSTEM_FFMPEG=OFF \
        -DWITH_SYSTEM_GLEW=ON \
        -DWITH_SYSTEM_JPEG=ON \
        -DWITH_SYSTEM_JSONCPP=OFF \
        -DWITH_SYSTEM_MAD=ON \
        -DWITH_SYSTEM_OGG=ON \
        -DWITH_SYSTEM_PCRE=ON \
        -DWITH_SYSTEM_PNG=OFF \
        -DWITH_SYSTEM_TOMCRYPT=OFF \
        -DWITH_SYSTEM_TOMMATH=ON \
        -DWITH_SYSTEM_ZLIB=ON \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build

    # Symlink stepmania binary which is located in /opt
    install -d "$pkgdir"/usr/bin
    ln -sf /opt/$_pkgname-5.1/$_pkgname "$pkgdir"/usr/bin/$_pkgname

    cd $_pkgname
    # Install auxiliary files
    install -Dm 644 $_pkgname.desktop -t "$pkgdir"/usr/share/applications
    install -d "$pkgdir"/usr/share
    cp -r icons "$pkgdir"/usr/share/icons

    # Install license
    install -Dm644 Docs/Licenses.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
