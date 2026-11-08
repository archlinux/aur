# Maintainer: Zeus-Deus <github.commits@widow.cc>
pkgname=voxtype-tui
pkgver=0.2.0
pkgrel=1
pkgdesc="Textual-based TUI for managing Voxtype (Linux voice-to-text daemon)"
arch=('any')
url="https://github.com/Zeus-Deus/voxtype-tui"
license=('MIT')
depends=(
    'python'
    'python-textual'
    'python-tomlkit'
    'voxtype-bin'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
optdepends=(
    'libpulse: audio device enumeration via pactl'
    'systemd: daemon restart prompts via systemctl --user'
    'python-gobject: learn corrections typed in other apps (AT-SPI)'
    'at-spi2-core: learn corrections typed in other apps (AT-SPI)'
    'libnotify: "Vocabulary learned" notifications'
)
install=voxtype-tui.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/Zeus-Deus/voxtype-tui/archive/v$pkgver.tar.gz")
sha256sums=('be7a6a99a17d6f1e95e25be55bc0557170f3bdb98e10692d9b780d82830737e7')

build() {
    cd "$pkgname-$pkgver"
    # Absolute path: a conda/pyenv python shadowing /usr/bin/python on the
    # builder's PATH lacks the system python-build/installer modules.
    /usr/bin/python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    /usr/bin/python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 CLAUDE.md "$pkgdir/usr/share/doc/$pkgname/DESIGN.md"
    install -Dm644 contrib/voxtype-tui.desktop \
        "$pkgdir/usr/share/applications/voxtype-tui.desktop"

    install -Dm755 scripts/install-omarchy.sh \
        "$pkgdir/usr/share/$pkgname/install-omarchy.sh"
    install -Dm755 scripts/uninstall-omarchy.sh \
        "$pkgdir/usr/share/$pkgname/uninstall-omarchy.sh"
}
