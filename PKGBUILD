# Maintainer: Ming Li <mingmillennium@gmail.com>
pkgname=m2k-pomodoro-timer
pkgver=1.0.1
pkgrel=1
pkgdesc="A lightweight Pomodoro timer with zero dependencies - runs with pure Python"
arch=('any')
url="https://github.com/ming2k/pomodoro-timer"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
optdepends=(
    'python-gobject: GTK4 modern interface support'
    'python-cairo: GTK4 modern interface support'
    'gtk4: GTK4 modern interface support'
    'libadwaita: GTK4 modern interface support'
    'python-sounddevice: Enhanced audio with PipeWire support'
    'python-numpy: Enhanced audio generation'
    'pipewire: Modern audio backend'
    'alsa-utils: Audio playback (aplay)'
    'ffmpeg: Audio playback fallback'
    'mplayer: Audio playback fallback'
    'libnotify: Native desktop notifications (notify-send)'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('ec3862be2330da586336bfbc9887793c69c5c4c7')

build() {
    cd "pomodoro-timer-$pkgver"
    
    # Build wheel package - no external dependencies needed!
    python -m build --wheel --no-isolation
}

package() {
    cd "pomodoro-timer-$pkgver"
    
    # Create stow-compatible directory structure
    install -dm755 "$pkgdir/home/ming/stow/pomodoro-timer/bin"
    install -dm755 "$pkgdir/home/ming/stow/pomodoro-timer/lib/python3.13/site-packages"
    
    # Copy source files to stow directory (including audio resources)
    cp -r src/pomodoro_timer "$pkgdir/home/ming/stow/pomodoro-timer/lib/python3.13/site-packages/"
    
    # Create launcher script
    cat > "$pkgdir/home/ming/stow/pomodoro-timer/bin/pomodoro-timer" << 'EOF'
#!/usr/bin/env python3
"""
Pomodoro Timer launcher script for Stow installation
"""

import sys
import os

# Add the stow installation path to Python path
stow_path = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
site_packages = os.path.join(stow_path, 'lib', 'python3.13', 'site-packages')
sys.path.insert(0, site_packages)

# Import and run the main function
from pomodoro_timer.main import main

if __name__ == "__main__":
    main()
EOF
    
    # Make launcher script executable
    chmod +x "$pkgdir/home/ming/stow/pomodoro-timer/bin/pomodoro-timer"
    
    # Install desktop file
    install -Dm644 pomodoro-timer.desktop "$pkgdir/usr/share/applications/pomodoro-timer.desktop"
    
    # Install icon
    install -Dm644 pomodoro-timer.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/pomodoro-timer.svg"
    
    # Install license (if exists)
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE" 2>/dev/null || true
    
    # Install README and documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
