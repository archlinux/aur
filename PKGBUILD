# Maintainer: Andrew Marin <andrewmarin367@gmail.com>
pkgname=vice-clipper
pkgver=1.0.0
pkgrel=1
pkgdesc="Medal.tv-style game clip recorder for Linux — instant replay, session recording, and one-click sharing"
arch=('x86_64')
url="https://github.com/eklonofficial/Vice"
license=('GPL-3.0-or-later')
depends=(
    'python'
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
source=("$pkgname-$pkgver.tar.gz::https://github.com/eklonofficial/Vice/archive/refs/tags/v1.0.0.tar.gz")
sha256sums=('c39a5597746609e5824e89b6fbeb881d1608f48f25e5e00b75a62c1b1eb39429')

build() {
    cd "$srcdir/Vice-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/Vice-$pkgver"

    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 vice.desktop \
        "$pkgdir/usr/share/applications/vice.desktop"

    install -Dm644 assets/vice.svg \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/vice.svg"

    install -Dm644 /dev/stdin \
        "$pkgdir/usr/share/doc/vice-clipper/README" <<EOF
Vice requires the user to be in the 'input' group for global hotkeys:
  sudo usermod -aG input \$USER
Then log out and back in.
EOF
}
