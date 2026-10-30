# Maintainer: Petr Mrázek <peterix@gmail.com>

pkgname=ur44-control
pkgver=0.3.1
pkgrel=1
pkgdesc="Configure the DSP mixer and effects of the Steinberg UR44 audio interface"
arch=('x86_64' 'aarch64')
url="https://github.com/Dethware/UR-44"
license=('MS-PL')
depends=('qt6-base' 'alsa-lib' 'hicolor-icon-theme')
makedepends=('cmake' 'ninja' 'python')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e8e84dd852f256d0a7c4f712c58d70a8584e0bb37fbbadcae9a4e11d7c30ecdd')

build() {
    cmake -B build -S "UR-44-$pkgver" -G Ninja \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -Wno-dev
    cmake --build build
}

check() {
    QT_QPA_PLATFORM=offscreen ctest --test-dir build --output-on-failure
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    # MS-PL isn't one of Arch's common licenses, so the package carries it (and the presets' notice)
    install -Dm644 "UR-44-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "UR-44-$pkgver/NOTICE" "$pkgdir/usr/share/licenses/$pkgname/NOTICE"
}
