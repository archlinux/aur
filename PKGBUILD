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
pkgver=5.1.0.b2.r514.89229ed915
pkgrel=1
pkgdesc="An advanced rhythm game designed for both home and arcade use."
arch=(x86_64)
url=https://www.$_pkgname.com/
license=(MIT)
depends=(ffmpeg glew gtk3 jsoncpp libmad libtomcrypt)
makedepends=(cmake git ninja)
provides=($_pkgname)
conflicts=($_pkgname)
source=(git+https://github.com/$_pkgname/$_pkgname.git
        0001-Don-t-require-assembler-for-system-FFmpeg.patch
        0002-Use-standard-tomcrypt-header.patch)
sha256sums=('SKIP'
            '99237c08a2d15ba56ef2763161181fbac356dc2e76bb6c1c7ccef1c8e30636b8'
            '6b915e4b54f7405e97e5333c134334030d46c6ed68afe09b097a965a28d6c7a6')

pkgver() {
    cd $_pkgname
    printf "%s" "$(git describe --tags | sed 's/v//g;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
    cd $_pkgname

    # Related issue: https://github.com/stepmania/stepmania/issues/2016
    patch -p1 -i "$srcdir"/0001-Don-t-require-assembler-for-system-FFmpeg.patch

    # Related issue: https://github.com/stepmania/stepmania/issues/1885
    patch -p1 -i "$srcdir"/0002-Use-standard-tomcrypt-header.patch
}

build() {
    # Related issues
    cmake -G Ninja -S $_pkgname -B build \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_C_FLAGS="$CPPFLAGS $CFLAGS" \
        -DCMAKE_CXX_FLAGS="$CPPFLAGS $CXXFLAGS" \
        -DCMAKE_INSTALL_PREFIX=/opt \
        -DCMAKE_INTERPROCEDURAL_OPTIMIZATION=ON \
        -DCMAKE_POSITION_INDEPENDENT_CODE=ON \
        -DWITH_SYSTEM_FFMPEG=ON \
        -DWITH_SYSTEM_GLEW=ON \
        -DWITH_SYSTEM_JPEG=ON \
        -DWITH_SYSTEM_JSONCPP=ON \
        -DWITH_SYSTEM_MAD=ON \
        -DWITH_SYSTEM_OGG=ON \
        -DWITH_SYSTEM_PCRE=ON \
        -DWITH_SYSTEM_PNG=ON \
        -DWITH_SYSTEM_TOMCRYPT=ON \
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
