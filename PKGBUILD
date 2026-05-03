# Maintainer: zsh-ncursed <zsh.ncursed@gmail.com>
pkgname=somafm_tui
pkgver=0.6.16
pkgrel=1
pkgdesc="Terminal user interface for SomaFM internet radio"
arch=('any')
url="https://github.com/zsh-ncursed/somafm_tui"
license=('MIT')
depends=('python' 'python-requests' 'python-mpv' 'python-dbus-next')
makedepends=('git')

# Use tarball for source
source=("https://github.com/zsh-ncursed/somafm_tui/archive/v${pkgver}.tar.gz")
sha256sums=('ca7ac218dba8cf30e544e3dcbe2265ce47317cd183256b3844607a465a53813c')

# pkgver() is used in CI to override version from git tag
pkgver() {
    if [ -n "$GITHUB_REF_NAME" ]; then
        echo "${GITHUB_REF_NAME#v}"
    elif [ -n "$VERSION" ]; then
        echo "${VERSION#v}"
    else
        # Local build - use hardcoded pkgver
        echo "$pkgver"
    fi
}

prepare() {
    cd "$pkgname"

    # Create wrapper script for system installation
    cat > somafm-tui << 'EOF'
#!/usr/bin/env python3
import os
import sys

# Add system installation directory to PYTHONPATH
sys.path.insert(0, '/usr/lib/somafm_tui')

# Import and run application
from somafm_tui.player import main

if __name__ == '__main__':
    main()
EOF
    chmod +x somafm-tui
}

package() {
    cd "$pkgname"

    # Create directories
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/lib/somafm_tui/somafm_tui"
    install -dm755 "$pkgdir/usr/lib/somafm_tui/somafm_tui/core"
    install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
    install -dm755 "$pkgdir/usr/share/doc/$pkgname"
    install -dm755 "$pkgdir/usr/share/bash-completion/completions"
    install -dm755 "$pkgdir/usr/share/fish/vendor_completions.d"

    # Install main Python package files (from somafm_tui/ subdirectory)
    install -Dm644 "$srcdir/$pkgname/somafm_tui/__init__.py" "$pkgdir/usr/lib/somafm_tui/somafm_tui/__init__.py"
    install -Dm644 "$srcdir/$pkgname/somafm_tui/__main__.py" "$pkgdir/usr/lib/somafm_tui/somafm_tui/__main__.py"
    install -Dm644 "$srcdir/$pkgname/somafm_tui/player.py" "$pkgdir/usr/lib/somafm_tui/somafm_tui/player.py"
    install -Dm644 "$srcdir/$pkgname/somafm_tui/config.py" "$pkgdir/usr/lib/somafm_tui/somafm_tui/config.py"
    install -Dm644 "$srcdir/$pkgname/somafm_tui/themes.py" "$pkgdir/usr/lib/somafm_tui/somafm_tui/themes.py"
    install -Dm644 "$srcdir/$pkgname/somafm_tui/themes.json" "$pkgdir/usr/lib/somafm_tui/somafm_tui/themes.json"
    install -Dm644 "$srcdir/$pkgname/somafm_tui/models.py" "$pkgdir/usr/lib/somafm_tui/somafm_tui/models.py"
    install -Dm644 "$srcdir/$pkgname/somafm_tui/channels.py" "$pkgdir/usr/lib/somafm_tui/somafm_tui/channels.py"
    install -Dm644 "$srcdir/$pkgname/somafm_tui/mpris_service.py" "$pkgdir/usr/lib/somafm_tui/somafm_tui/mpris_service.py"
    install -Dm644 "$srcdir/$pkgname/somafm_tui/ui.py" "$pkgdir/usr/lib/somafm_tui/somafm_tui/ui.py"
    install -Dm644 "$srcdir/$pkgname/somafm_tui/http_client.py" "$pkgdir/usr/lib/somafm_tui/somafm_tui/http_client.py"
    install -Dm644 "$srcdir/$pkgname/somafm_tui/terminal.py" "$pkgdir/usr/lib/somafm_tui/somafm_tui/terminal.py"
    install -Dm644 "$srcdir/$pkgname/somafm_tui/timer.py" "$pkgdir/usr/lib/somafm_tui/somafm_tui/timer.py"
    install -Dm644 "$srcdir/$pkgname/somafm_tui/cli.py" "$pkgdir/usr/lib/somafm_tui/somafm_tui/cli.py"
    install -Dm644 "$srcdir/$pkgname/somafm_tui/bitrate_utils.py" "$pkgdir/usr/lib/somafm_tui/somafm_tui/bitrate_utils.py"
    install -Dm644 "$srcdir/$pkgname/somafm_tui/constants.py" "$pkgdir/usr/lib/somafm_tui/somafm_tui/constants.py"

    # Install core module files
    install -Dm644 "$srcdir/$pkgname/somafm_tui/core/__init__.py" "$pkgdir/usr/lib/somafm_tui/somafm_tui/core/__init__.py"
    install -Dm644 "$srcdir/$pkgname/somafm_tui/core/playback.py" "$pkgdir/usr/lib/somafm_tui/somafm_tui/core/playback.py"
    install -Dm644 "$srcdir/$pkgname/somafm_tui/core/state.py" "$pkgdir/usr/lib/somafm_tui/somafm_tui/core/state.py"
    install -Dm644 "$srcdir/$pkgname/somafm_tui/core/input.py" "$pkgdir/usr/lib/somafm_tui/somafm_tui/core/input.py"

    # Install executable wrapper
    install -Dm755 somafm-tui "$pkgdir/usr/bin/somafm-tui"

    # Install shell scripts
    [[ -f somafm.bash ]] && install -Dm644 somafm.bash "$pkgdir/usr/share/bash-completion/completions/somafm"
    [[ -f somafm.fish ]] && install -Dm644 somafm.fish "$pkgdir/usr/share/fish/vendor_completions.d/somafm"

    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 CONTRIBUTING.md "$pkgdir/usr/share/doc/$pkgname/CONTRIBUTING.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
