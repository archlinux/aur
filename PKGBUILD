# Maintainer: zsh-ncursed <zsh.ncursed@protonmail.com>
pkgname=somafm_tui
pkgver=0.4.0
pkgrel=3
pkgdesc="Terminal user interface for SomaFM internet radio"
arch=('any')
url="https://github.com/zsh-ncursed/somafm_tui"
license=('MIT')
depends=('python' 'python-requests' 'python-mpv' 'python-dbus-next')
makedepends=('git')
source=("git+https://github.com/zsh-ncursed/somafm_tui.git#tag=v0.4.0")
sha256sums=('SKIP')

prepare() {
    cd "$pkgname"

    # Create wrapper script for system installation
    cat > somafm_tui << 'EOF'
#!/usr/bin/env python3
import os
import sys

# Add system installation directory to PYTHONPATH
sys.path.insert(0, '/usr/lib')

# Import and run application
from somafm_tui.player import main

if __name__ == '__main__':
    main()
EOF
    chmod +x somafm_tui
}

package() {
    cd "$pkgname"

    # Create directories
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/lib/somafm_tui"
    install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
    install -dm755 "$pkgdir/usr/share/doc/$pkgname"
    install -dm755 "$pkgdir/usr/share/bash-completion/completions"
    install -dm755 "$pkgdir/usr/share/fish/vendor_completions.d"

    # Install main Python package files
    install -Dm644 __init__.py "$pkgdir/usr/lib/somafm_tui/__init__.py"
    install -Dm644 __main__.py "$pkgdir/usr/lib/somafm_tui/__main__.py"
    install -Dm644 player.py "$pkgdir/usr/lib/somafm_tui/player.py"
    install -Dm644 config.py "$pkgdir/usr/lib/somafm_tui/config.py"
    install -Dm644 themes.py "$pkgdir/usr/lib/somafm_tui/themes.py"
    install -Dm644 themes.json "$pkgdir/usr/lib/somafm_tui/themes.json"
    install -Dm644 models.py "$pkgdir/usr/lib/somafm_tui/models.py"
    install -Dm644 channels.py "$pkgdir/usr/lib/somafm_tui/channels.py"
    install -Dm644 stream_buffer.py "$pkgdir/usr/lib/somafm_tui/stream_buffer.py"
    install -Dm644 mpris_service.py "$pkgdir/usr/lib/somafm_tui/mpris_service.py"
    install -Dm644 ui.py "$pkgdir/usr/lib/somafm_tui/ui.py"
    install -Dm644 http_client.py "$pkgdir/usr/lib/somafm_tui/http_client.py"
    install -Dm644 terminal.py "$pkgdir/usr/lib/somafm_tui/terminal.py"

    # Install executable wrapper
    install -Dm755 somafm_tui "$pkgdir/usr/bin/somafm-tui"

    # Install shell scripts - use wrapper script instead of somafm.sh for system installation
    [[ -f somafm_tui ]] && install -Dm755 somafm_tui "$pkgdir/usr/bin/somafm"
    [[ -f somafm.bash ]] && install -Dm644 somafm.bash "$pkgdir/usr/share/bash-completion/completions/somafm"
    [[ -f somafm.fish ]] && install -Dm644 somafm.fish "$pkgdir/usr/share/fish/vendor_completions.d/somafm"

    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 CONTRIBUTING.md "$pkgdir/usr/share/doc/$pkgname/CONTRIBUTING.md"
    install -Dm644 IMPROVEMENTS.md "$pkgdir/usr/share/doc/$pkgname/IMPROVEMENTS.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
