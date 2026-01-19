# Maintainer: voldardard <voldardard@example.com>
pkgname=mkv2cast
pkgver=1.2.4
pkgrel=1
pkgdesc="Smart MKV to Chromecast-compatible converter with hardware acceleration"
arch=('any')
url="https://github.com/voldardard/mkv2cast"
license=('GPL3')
provides=('python-mkv2cast')
conflicts=('python-mkv2cast')
depends=('python>=3.8' 'ffmpeg')
optdepends=(
    'python-rich: Beautiful progress UI with colors and animations'
    'python-tomli: TOML config support (Python < 3.11)'
    'python-plyer: Desktop notifications fallback'
    'libnotify: Desktop notifications via notify-send'
)
makedepends=('python-build' 'python-installer' 'python-hatchling')
source=("$pkgname-$pkgver.tar.gz::https://github.com/voldardard/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    
    # Man page
    install -Dm644 man/mkv2cast.1 "$pkgdir/usr/share/man/man1/mkv2cast.1"
    
    # Bash completion
    install -Dm644 completions/mkv2cast.bash "$pkgdir/usr/share/bash-completion/completions/mkv2cast"
    
    # Zsh completion
    install -Dm644 completions/_mkv2cast "$pkgdir/usr/share/zsh/site-functions/_mkv2cast"
    
    # Systemd user units
    install -Dm644 systemd/mkv2cast-cleanup.service "$pkgdir/usr/lib/systemd/user/mkv2cast-cleanup.service"
    install -Dm644 systemd/mkv2cast-cleanup.timer "$pkgdir/usr/lib/systemd/user/mkv2cast-cleanup.timer"
    install -Dm644 systemd/mkv2cast-watch.service "$pkgdir/usr/lib/systemd/user/mkv2cast-watch.service"
    install -Dm644 systemd/mkv2cast-watch.timer "$pkgdir/usr/lib/systemd/user/mkv2cast-watch.timer"
    
    # Systemd system units (optional, for root cleanup)
    install -Dm644 systemd/mkv2cast-cleanup-system.service "$pkgdir/usr/lib/systemd/system/mkv2cast-cleanup-system.service"
    install -Dm644 systemd/mkv2cast-cleanup-system.timer "$pkgdir/usr/lib/systemd/system/mkv2cast-cleanup-system.timer"
    
    # Documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=4 sw=4 et:
