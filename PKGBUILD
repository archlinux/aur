# Maintainer: Tobias Boesch <tobias.boesch at googlemail dot com>
pkgname=syng
pkgver=2.1.0
pkgrel=1
pkgdesc="All in one karaoke software"
arch=(any)
url="https://github.com/christofsteel/syng"
license=(AGPL-3.0-or-later)
depends=(
    python
    python-aiohttp
    python-alt-profanity-check
    python-minio
    python-mpv
    python-platformdirs
    python-pymediainfo
    python-pyqt6
    python-engineio
    python-socketio
    python-pyyaml
    python-qasync
    python-qrcode
    yt-dlp
    hicolor-icon-theme
)
makedepends=(
    git
    python-build
    python-installer
    python-poetry-core
)
checkdepends=(
    python-ruff
    python-poetry-core
)
source=(
    "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
    'syng.desktop'
    '25cf5468.patch'
    '91dec5bc.patch'
)
sha256sums=('e8b42876a0ebcd11322381b760b1248449e481a3258911bdb8c3f69770079c08'
            '7ed5ae1a81667ebe73206736a531ce8425347b2a8c4240db363c026670efada2'
            'db8a2f19dc5aa3a6989bb9550504514f22f711f11fbeed57b9a1a180cf4454f0'
            '1db7e2edc125ffc7ef9eb91c8631546abf2191908d5d6eb408ab62b7fc14eb30')
prepare() {
    cd $pkgname-$pkgver
    patch -Np1 -i ../25cf5468.patch
    patch -Np1 -i ../91dec5bc.patch
}
build() {
    cd $pkgname-$pkgver
    python -m build --wheel --no-isolation
}
check() {
    cd $pkgname-$pkgver
    python -m ruff check syng
}
package() {
    cd $pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -vDm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" \
            resources/icons/hicolor/512x512/apps/rocks.syng.Syng.png
    install -vDm644 ../syng.desktop "$pkgdir/usr/share/applications/syng.desktop"
}
