# Maintainer: Your Name <your.email@example.com>
pkgname=csfml-epitech
pkgver=2.6.1
pkgrel=2
pkgdesc="CSFML 2.6.1 with SFML 2.6.1 for Epitech projects"
arch=('x86_64' 'aarch64')
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
    'libudev.so'
)
makedepends=('cmake' 'git')
provides=('csfml' 'sfml')
conflicts=('csfml' 'sfml')
source=(
    "SFML-${pkgver}.tar.gz::https://github.com/SFML/SFML/archive/refs/tags/${pkgver}.tar.gz"
    "CSFML-${pkgver}.tar.gz::https://github.com/SFML/CSFML/archive/refs/tags/${pkgver}.tar.gz"
)
sha256sums=('82535db9e57105d4f3a8aedabd138f77571ab9a903e508a99a8baebe7f5c192d'
            '699e38c50e67d1d4ea6e43b6c33fd99c01ba38fc194ad651c121059dd48dcde5')

build() {
    cmake -S "SFML-${pkgver}" -B build-sfml \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DSFML_BUILD_EXAMPLES=OFF \
        -DSFML_BUILD_DOC=OFF
    cmake --build build-sfml

    cmake -S "CSFML-${pkgver}" -B build-csfml \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DSFML_DIR="${srcdir}/build-sfml" \
        -DCMAKE_BUILD_TYPE=Release
    cmake --build build-csfml
}

package() {
    DESTDIR="$pkgdir" cmake --install build-sfml
    DESTDIR="$pkgdir" cmake --install build-csfml

    install -Dm644 "SFML-${pkgver}/license.md" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
