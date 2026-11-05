# Maintainer: Nasir A <evilleader91@gmail.com>
pkgname=steam-library-mover
pkgver=0.1.4
pkgrel=1
pkgdesc="Move installed Steam games between Steam libraries safely"
arch=('x86_64')
url="https://github.com/NasirA1991/steam-library-mover"
license=('GPL-3.0-or-later')
depends=('qt6-base' 'qt6-svg' 'hicolor-icon-theme')
makedepends=('cmake' 'ninja')
optdepends=('steam: native Steam client'
            'flatpak: Flatpak Steam client')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f0f8f540f7c389b69e6f3b9cd1a2cafe53ccaf93d8ec9e9e7f23c178586dbdee')

build() {
    cmake -S "$pkgname-$pkgver" -B build \
        -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

check() {
    ctest --test-dir build --output-on-failure --timeout 60 -E tst_gui
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -Dm644 "$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
