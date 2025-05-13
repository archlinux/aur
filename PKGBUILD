# Maintainer: Tobias Boesch <tobias.boesch at googlemail dot com>
pkgbase=syng
pkgname=(syng-common syng-client syng-server)
pkgver=2.1.0
pkgrel=3
pkgdesc="All in one karaoke software"
arch=(any)
url="https://github.com/christofsteel/syng"
license=(AGPL-3.0-or-later)
makedepends=(
    git
    python-poetry-core
    python-build
    python-installer
)
source=(
    "$pkgbase-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
    'syng.desktop'
    '25cf5468.patch'
    '91dec5bc.patch'
)
sha256sums=('e8b42876a0ebcd11322381b760b1248449e481a3258911bdb8c3f69770079c08'
            '7ed5ae1a81667ebe73206736a531ce8425347b2a8c4240db363c026670efada2'
            'db8a2f19dc5aa3a6989bb9550504514f22f711f11fbeed57b9a1a180cf4454f0'
            '1db7e2edc125ffc7ef9eb91c8631546abf2191908d5d6eb408ab62b7fc14eb30')
prepare() {
    cd $pkgbase-$pkgver
    patch -Np1 -i ../25cf5468.patch
    patch -Np1 -i ../91dec5bc.patch
}
build() {
    cd $pkgbase-$pkgver
    python -m build --wheel --no-isolation
}
package_syng-common() {
    pkgdesc="All in one karaoke software (common)"
    pkgname=syng-common
    depends=(
        python
        python-aiohttp
        python-platformdirs
        python-socketio
        yt-dlp
    )
    optdepends=(
        'syng-server: Server requirements for syng'
        'syng-client: Client requirements for syng'
    )
    cd $pkgbase-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -vDm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" \
            resources/icons/hicolor/512x512/apps/rocks.syng.Syng.png
    install -vDm644 ../syng.desktop "$pkgdir/usr/share/applications/syng.desktop"
}
package_syng-server() {
    pkgdesc="All in one karaoke software (server)"
    pkgname=syng-server
    depends=(
        python-alt-profanity-check
        syng-common
    )
}
package_syng-client() {
    pkgdesc="All in one karaoke software (client)"
    pkgname=syng-client
    depends=(
        python-minio
        python-mpv
        python-pillow
        python-pymediainfo
        python-pyqt6
        python-pyyaml
        python-qasync
        python-qrcode
        hicolor-icon-theme
        syng-common
    )
}
