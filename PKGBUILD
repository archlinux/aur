# Maintainer: Andrew Marin <andrewmarin367@gmail.com>
pkgname=vice-clipper
pkgver=1.0.1
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
source=("$pkgname-$pkgver.tar.gz::https://github.com/eklonofficial/Vice/archive/71f3e6d7298a955779b5759d4137df026940a4c0.tar.gz")
sha256sums=('160c8fd6d7b540acc2c202888d4e2f271ea696e210d5be2e1d5100f352c8bdca')

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
