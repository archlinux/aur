# Maintainer: shasherazi
pkgname=mpd-presence-git
pkgver=r1.0.0
pkgrel=1
pkgdesc="A lightweight, resilient Discord Rich Presence daemon for MPD"
arch=('any')
url="https://github.com/shasherazi/mpd-presence"
license=('MIT')
depends=(
    'python'
    'python-mpd2'
    'python-mutagen'
    'python-pillow'
    'python-pypresence'
)
makedepends=(
    'git'
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
)
provides=('mpd-presence')
conflicts=('mpd-presence')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/mpd-presence"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/mpd-presence"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/mpd-presence"
    python -m installer --destdir="$pkgdir" dist/*.whl

    # Systemd user service
    install -Dm644 systemd/mpd-presence.service "$pkgdir/usr/lib/systemd/user/mpd-presence.service"

    # Default configuration template
    install -Dm644 config.example.toml "$pkgdir/usr/share/doc/mpd-presence/config.example.toml"

    # License
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
