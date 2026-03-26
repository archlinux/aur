# Maintainer: Andrew Marin <andrewmarin367@gmail.com>
pkgname=vice-clipper
pkgver=1.0.20
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
    'gpu-screen-recorder'
    'webkit2gtk-4.1'
    'gstreamer'
    'gst-plugins-base'
    'gst-plugins-good'
)
optdepends=(
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
sha256sums=('58bc0869657991e2bc9a72c4326df9e61f7f094a7e080d2a0ca9ec49ec6eabbb')

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
