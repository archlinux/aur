# Maintainer: Your Name <your.email@example.com>
pkgname=csfml-epitech
pkgver=2.6.1
pkgrel=1
pkgdesc="CSFML 2.6.1 with SFML 2.6.1 for Epitech projects"
arch=('x86_64')
url="https://www.sfml-dev.org/"
license=('Zlib')
depends=(
    'libx11'
    'libxrandr'
    'libxcursor'
    'libxi'
    'freetype2'
    'flac'
    'libogg'
    'libvorbis'
    'openal'
    'systemd-libs'
)
makedepends=('cmake' 'unzip')
provides=('csfml' 'sfml')
conflicts=('csfml' 'sfml')
source=(
    "https://www.sfml-dev.org/files/SFML-${pkgver}-sources.zip"
    "https://www.sfml-dev.org/files/CSFML-${pkgver}-sources.zip"
)
sha256sums=(
    'SKIP'
    'SKIP'
)

build() {
    # Build SFML
    cd "$srcdir/SFML-${pkgver}"
    mkdir -p build && cd build
    cmake .. \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DSFML_BUILD_EXAMPLES=OFF \
        -DSFML_BUILD_DOC=OFF
    make -j$(nproc)

    # Build CSFML
    cd "$srcdir/CSFML-${pkgver}"
    mkdir -p build && cd build
    cmake .. \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DSFML_DIR="$srcdir/SFML-${pkgver}/build" \
        -DCMAKE_BUILD_TYPE=Release
    make -j$(nproc)
}

package() {
    # Install SFML
    cd "$srcdir/SFML-${pkgver}/build"
    make DESTDIR="$pkgdir" install

    # Install CSFML
    cd "$srcdir/CSFML-${pkgver}/build"
    make DESTDIR="$pkgdir" install

    # Install license
    install -Dm644 "$srcdir/SFML-${pkgver}/license.md" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
