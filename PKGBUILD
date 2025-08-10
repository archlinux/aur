# Maintainer: Gourav Solanki <itsgouravsolanki@gmail.com>
pkgname=lazylauncher
pkgver=1.0.0
pkgrel=1
pkgdesc="GUI Tool to Create Custom KRunner Shortcuts for KDE Plasma"
arch=('any')
url="https://github.com/gouravslnk/LazyLauncher"
license=('MIT')
depends=('python' 'tk' 'kservice')
optdepends=('kservice5: For KDE Plasma 5 support'
           'kservice6: For KDE Plasma 6 support')
source=("$pkgname-$pkgver.tar.gz::https://github.com/gouravslnk/LazyLauncher/archive/v$pkgver.tar.gz")
sha256sums=('d5d9bf734b80cd5b4c149125803a59ca233d1897c11f459b27583202e1a1b97d')

package() {
    cd "$srcdir/LazyLauncher-$pkgver"
    
    # Install Python package
    python -m installer --destdir="$pkgdir" dist/*.whl || {
        # Fallback: manual installation
        install -dm755 "$pkgdir/usr/lib/python$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')/site-packages"
        cp -r lazylauncher "$pkgdir/usr/lib/python$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')/site-packages/"
        
        # Install scripts
        install -Dm755 scripts/lazylauncher_cli.py "$pkgdir/usr/bin/lazylauncher-cli"
        
        # Create main launcher script
        install -Dm755 /dev/stdin "$pkgdir/usr/bin/lazylauncher" << 'EOF'
#!/usr/bin/env python3
import sys
sys.path.insert(0, '/usr/lib/python3.11/site-packages')
from lazylauncher.__main__ import main
if __name__ == '__main__':
    main()
EOF
    }
    
    # Install desktop file
    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/lazylauncher.desktop" << 'EOF'
[Desktop Entry]
Name=LazyLauncher
GenericName=KRunner Shortcut Creator
Comment=Create custom shortcuts for KDE KRunner
Exec=lazylauncher
Icon=preferences-desktop-keyboard-shortcuts
Type=Application
Categories=System;Settings;Qt;KDE;
Keywords=kde;krunner;shortcuts;plasma;
StartupNotify=true
EOF

    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    
    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
