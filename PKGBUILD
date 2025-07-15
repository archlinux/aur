# Maintainer: Tobias Boesch <tobias.boesch at googlemail dot com>
pkgbase=syng
pkgname=(syng-common syng-client syng-server)
pkgver=2.2.0
pkgrel=1
pkgdesc="All in one karaoke software"
arch=(any)
url="https://github.com/christofsteel/syng"
license=(AGPL-3.0-or-later)
makedepends=(
    python-poetry-core
    python-build
    python-installer
)
source=(
    "$pkgbase-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
    'syng.desktop'
)
sha256sums=('278c840a5f5213f3248156047569aa212147d395a248659a6c4f7f05123f3e8b'
            '7ed5ae1a81667ebe73206736a531ce8425347b2a8c4240db363c026670efada2')
prepare() {
    cd $pkgbase-$pkgver
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
