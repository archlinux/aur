# Maintainer: StressarN <martin.gustavsen@kreatell.com>
pkgname=droidproxy-linux
pkgver=1.8.9
pkgrel=1
pkgdesc="Proxy Claude, Codex, and Gemini subscriptions for Factory Droid CLI (Linux port)"
arch=('any')
url="https://github.com/StressarN/droidproxy-linux"
license=('MIT')
depends=(
    'python>=3.11'
    'python-aiohttp'
    'python-watchdog'
    'python-platformdirs'
    'python-tomli-w'
    'python-psutil'
    'python-gobject'
    'gtk3'
    'libayatana-appindicator'
    'xdg-utils'
)
optdepends=(
    'cloudflared: expose the proxy to the public internet'
)
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
provides=('droidproxy')
conflicts=('droidproxy' 'droidproxy-linux-bin')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('331515adbfd405758155cf08560ef043b987d0d293f6e8040c15217f7192ee16')

build() {
    cd "$srcdir/${pkgname}-${pkgver}/src"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}/src"
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 packaging/droidproxy.desktop \
        "$pkgdir/usr/share/applications/droidproxy.desktop"
    install -Dm644 src/droidproxy/resources/icon-active.png \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/droidproxy.png"
    install -Dm644 packaging/droidproxy.service \
        "$pkgdir/usr/lib/systemd/user/droidproxy.service"
    install -Dm644 "../LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
