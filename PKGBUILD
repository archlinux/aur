# Maintainer: Sean Doran <sdoran35@gmail.com>
# AUR updates are automated via GitHub Actions on version tag push
pkgname=turn-up-arch
pkgver=0.3.1
pkgrel=1
pkgdesc="USB serial knob/button mixer daemon for PipeWire/PulseAudio on Linux"
arch=('any')
url="https://github.com/sean351/turn-up-arch"
license=('MIT')
depends=(
    'python'
    'python-pyserial'
    'python-pulsectl'
    'pipewire-pulse'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-hatchling'
)
optdepends=(
    'playerctl: media key support via button commands'
    'pulseaudio: alternative to pipewire-pulse'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/sean351/turn-up-arch/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('cd738681432cd91f81c3f509e6dcd741f92315311ebf78a5cb55a2fd4c2f712b')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"

    python -m installer --destdir="$pkgdir" dist/*.whl

    # Systemd user service
    install -Dm644 contrib/turnupd.service \
        "$pkgdir/usr/lib/systemd/user/turnupd.service"

    # License
    install -Dm644 LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Documentation
    install -Dm644 README.md \
        "$pkgdir/usr/share/doc/$pkgname/README.md"
}
