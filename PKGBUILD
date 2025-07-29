# Maintainer: NeatCode Labs <neatcodelabs@gmail.com>

pkgname=arch-smart-update-checker
pkgver=2.3.1
pkgrel=1
pkgdesc="Smart update checker for Arch Linux that shows relevant news before updating"
arch=('any')
url="https://github.com/NeatCode-Labs/arch-smart-update-checker"
license=('GPL3')
depends=(
    'python>=3.8'
    'python-requests>=2.25.0'
    'python-feedparser>=6.0.0' 
    'python-colorama>=0.4.0'
    'python-psutil>=5.8.0'
    'tk'  # For tkinter GUI support
    'polkit'  # For privilege elevation with pkexec
)
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
)
optdepends=(
    'python-pytest: for running tests'
    'python-mypy: for type checking'
    'apparmor: for enhanced security using AppArmor profiles'
)
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$pkgname-$pkgver-complete.tar.gz")
sha256sums=('4837c81c0c1f4bea76f2ed438e1c7a7f90a55003dce16e9612c7616b5664326f')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    
    # Install Python package manually to avoid script conflicts
    local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
    install -d "$pkgdir/$site_packages"
    cp -r src "$pkgdir/$site_packages/"
    
    # Create wrapper scripts that use python -m
    install -d "$pkgdir/usr/bin"
    
    # Create asuc-cli wrapper
    cat > "$pkgdir/usr/bin/asuc-cli" << 'EOF'
#!/usr/bin/python
import sys
import os

# Simple wrapper that bypasses instance lock import issues
try:
    # Set up Python path
    from src.cli.main import main as cli_main
    cli_main()
except KeyboardInterrupt:
    print("\nInterrupted by user", file=sys.stderr)
    sys.exit(130)
except Exception as exc:
    print(f"Fatal error: {exc}", file=sys.stderr)
    import traceback
    traceback.print_exc()
    sys.exit(1)
EOF
    chmod +x "$pkgdir/usr/bin/asuc-cli"
    
    # Create asuc-gui wrapper  
    cat > "$pkgdir/usr/bin/asuc-gui" << 'EOF'
#!/usr/bin/python
import sys

try:
    from src.gui.main_window import MainWindow
    app = MainWindow()
    app.run()
except KeyboardInterrupt:
    print("\nApplication interrupted by user")
except Exception as exc:
    print(f"Error starting application: {exc}", file=sys.stderr)
    import traceback
    traceback.print_exc()
    sys.exit(1)
EOF
    chmod +x "$pkgdir/usr/bin/asuc-gui"
    
    # Create asuc symlink to asuc-cli for backward compatibility
    ln -s asuc-cli "$pkgdir/usr/bin/asuc"
    
    # Install icons
    for size in 16 32 48 64 128 256 512; do
        install -Dm644 "icons/asuc-${size}x${size}.svg" \
            "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/asuc.svg"
    done
    install -Dm644 "icons/asuc.svg" \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/asuc.svg"
    
    # Install desktop file
    install -d "$pkgdir/usr/share/applications"
    cat > "$pkgdir/usr/share/applications/asuc.desktop" << EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=Arch Smart Update Checker
Comment=Check for updates with relevant news filtering
Exec=asuc-gui
Icon=asuc
Terminal=false
Categories=System;PackageManager;
Keywords=update;upgrade;news;pacman;arch;
StartupNotify=true
EOF
    
    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    
    # Install security profiles (optional)
    install -Dm644 security/apparmor/usr.bin.asuc \
        "$pkgdir/usr/share/doc/$pkgname/apparmor/usr.bin.asuc"
    install -Dm644 security/apparmor/README.md \
        "$pkgdir/usr/share/doc/$pkgname/apparmor/README.md"
}

post_remove() {
    cat << EOF

================================================================================
ARCH SMART UPDATE CHECKER - UNINSTALL NOTICE
================================================================================

The package has been removed, but user configuration and cache files remain in:

  • ~/.config/arch-smart-update-checker/
    - Configuration settings
    - Log files
    - Window geometry
    - Security metrics

  • ~/.cache/arch-smart-update-checker/
    - Update history
    - News cache
    - Temporary data

To completely remove all traces, run:

  rm -rf ~/.config/arch-smart-update-checker ~/.cache/arch-smart-update-checker

To remove temporary files:

  rm -f /tmp/asuc-* /tmp/arch-smart-update-checker-*

Note: Keeping these files allows you to retain your settings if you reinstall.

================================================================================

EOF
}

# vim: set ts=4 sw=4 et: 