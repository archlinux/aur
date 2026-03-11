# Maintainer: Andrew Marin <andrewmarin367@gmail.com>
pkgname=vice-clipper
pkgver=1.0.9
pkgrel=1
pkgdesc="Medal.tv-style game clip recorder for Linux — instant replay, session recording, and one-click sharing"
arch=('x86_64')
url="https://github.com/eklonofficial/Vice"
license=('GPL-3.0-or-later')
depends=(
    'python'
    'systemd'
    'python-evdev'
    'python-aiohttp'
    'python-click'
    'python-psutil'
    'python-pywebview'
    'python-tomli-w'
    'ffmpeg'
    'webkit2gtk-4.1'
)
optdepends=(
    'gpu-screen-recorder: best performance recording backend (recommended)'
    'wf-recorder: Wayland fallback recording backend'
    'cloudflared: public share links that work outside your LAN'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/eklonofficial/Vice/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('08399cc2c7f54711818d2c7d3ed874018b590f7a80cfa7ccb42053cf1c196285')

build() {
    cd "$srcdir/Vice-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "$srcdir/Vice-$pkgver"
    python -m compileall vice
}

package() {
    cd "$srcdir/Vice-$pkgver"

    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 vice.desktop \
        "$pkgdir/usr/share/applications/vice.desktop"

    install -Dm644 assets/vice.svg \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/vice.svg"

    install -Dm644 packaging/vice.rules \
        "$pkgdir/usr/lib/udev/rules.d/70-vice-input.rules"
}
