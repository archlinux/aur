# Maintainer: Thomas Büngener <tombueng@gmail.com>
pkgname=leolink
pkgver=0.1.1
pkgrel=1
pkgdesc="Native Linux client for Reolink cameras: live view, motion alerts, recording"
arch=('x86_64' 'aarch64')
url="https://github.com/tombueng/leolink"
license=('MIT')
# mpv provides libmpv, which does the decoding and the audio.
depends=('qt6-base' 'qt6-svg' 'mpv' 'hicolor-icon-theme')
makedepends=('cmake' 'ninja' 'qt6-tools')
# Recording and the detection leolink does itself both run ffmpeg as a program;
# viewing needs none of it, which is why this is optional rather than a hard
# dependency.
optdepends=('ffmpeg: recording to disk, and motion and sound detection')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e1bfeb34fb7b9afc3101dfe0bb1d514a2f85b886d3f6f5139abbd631fbc9df0e')

build() {
    cmake -S "$pkgname-$pkgver" -B build -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

check() {
    # Nothing to run against a camera here, but malformed metadata would be
    # rejected by every software centre — worth catching at build time.
    cmake --build build --target validate-metadata
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -Dm644 "$pkgname-$pkgver/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
