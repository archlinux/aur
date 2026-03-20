# Maintainer: Sean Doran <sdoran35@gmail.com>
# AUR updates are automated via GitHub Actions on version tag push
pkgname=turn-up-arch
pkgver=2.2.2
pkgrel=1
pkgdesc="USB serial knob/button mixer daemon for PipeWire/PulseAudio on Linux"
arch=('any')
url="https://github.com/sean351/turn-up-arch"
license=('MIT')
depends=(
    'python'
    'python-pyserial'
    'python-pulsectl'
    'python-fastapi'
    'uvicorn'
    'pipewire-pulse'
    'playerctl'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-hatchling'
)
optdepends=(
    'pulseaudio: alternative to pipewire-pulse'
)
install=turnupd.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/sean351/turn-up-arch/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9c81bfa118a2236d462c0eaa0e8da4e5f634ff76d7826dbce8b2b275676a70e7')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"

    python -m installer --destdir="$pkgdir" dist/*.whl

    # Systemd user services
    install -Dm644 contrib/turnupd.service \
        "$pkgdir/usr/lib/systemd/user/turnupd.service"
    install -Dm644 contrib/turnup-ui.service \
        "$pkgdir/usr/lib/systemd/user/turnup-ui.service"

    # License
    install -Dm644 LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Documentation
    install -Dm644 README.md \
        "$pkgdir/usr/share/doc/$pkgname/README.md"
}
