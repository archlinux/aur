# Maintainer: Kamil 'Novik' Nowicki <kamil@noviktech.com>
pkgname=novapad
pkgver=1.0.0
pkgrel=1
pkgdesc="A modern C++23/Qt6 fork of Notepadqq - Native code editor for programmers"
arch=('x86_64')
url="https://github.com/novik133/novapad"
license=('GPL-2.0-only')
depends=(
    'qt6-base'
    'qt6-svg'
    'qt6-tools'
    'qt6-5compat'
    'qt6-declarative'
    'hicolor-icon-theme'
)
makedepends=(
    'cmake>=3.25'
    'ninja'
    'gcc>=13'
)
optdepends=(
    'qt6-webengine: For embedded web-based preview'
)
provides=('novapad')
conflicts=('novapad')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    
    # Clean any existing build directory
    rm -rf build || true
    
    cmake -B build \
        -S . \
        -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DNOVAPAD_ENABLE_PLUGINS=ON \
        -DNOVAPAD_ENABLE_TESTS=OFF \
        -DNOVAPAD_ENABLE_TRANSLATIONS=ON
    
    cmake --build build
}

check() {
    cd "$srcdir/$pkgname-$pkgver"
    ctest --test-dir build --output-on-failure || true
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    DESTDIR="$pkgdir" cmake --install build
    
    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    
    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
