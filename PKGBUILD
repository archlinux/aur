# Maintainer: radnus <radnus@gmail.com>
pkgname=tamil-assistant
pkgver=1.0.9
pkgrel=1
pkgdesc="AI-powered Tamil language learning companion for i3 window manager"
arch=('any')
url="https://github.com/jalabulajunx/tamil-assistant"
license=('MIT')
depends=(
    'python>=3.8'
    'python-requests>=2.31.0'
    'python-pillow>=10.0.0'
    'python-pdf2image>=1.16.0'
    'python-dbus>=1.3.2'
    'python-gobject>=3.42.0'
    'okular'
    'i3-wm'
    'poppler'
    'gtk3'
)
makedepends=('git')
optdepends=(
    'rofi: For application launcher integration'
    'dmenu: Alternative application launcher'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/jalabulajunx/tamil-assistant/archive/v$pkgver.tar.gz")
sha256sums=('4a7218e8fb6ab9983229447ace0a1296340920ff60d35e5aae0a194de980d4e4')
install=tamil-assistant.install

package() {
    cd "$pkgname-$pkgver"
    
    # Detect Python version dynamically
    _python_version=$(python -c "import sys; print(f'{sys.version_info.major}.{sys.version_info.minor}')")
    _python_site_packages="/usr/lib/python${_python_version}/site-packages"
    
    # Install main executable (wrapper script)
    install -Dm755 tamil-assistant-wrapper "$pkgdir/usr/bin/tamil-assistant"
    
    # Install Python modules as a proper package
    install -dm755 "$pkgdir/$_python_site_packages/tamil_assistant"
    install -Dm644 tamil_sidepanel.py "$pkgdir/$_python_site_packages/tamil_assistant/"
    install -Dm644 gemini_client.py "$pkgdir/$_python_site_packages/tamil_assistant/"
    install -Dm644 okular_interface.py "$pkgdir/$_python_site_packages/tamil_assistant/"
    install -Dm644 config_manager.py "$pkgdir/$_python_site_packages/tamil_assistant/"
    
    # Create __init__.py for proper Python package
    touch "$pkgdir/$_python_site_packages/tamil_assistant/__init__.py"
    
    # Install configuration template
    install -Dm644 config.ini.example "$pkgdir/etc/tamil-assistant/config.ini.example"
    
    # Install desktop file
    install -Dm644 tamil-assistant.desktop "$pkgdir/usr/share/applications/tamil-assistant.desktop"
    
    # Install documentation
    install -Dm644 readme.md "$pkgdir/usr/share/doc/tamil-assistant/README.md"
    
    # Install launcher script
    install -Dm755 launch_tamil.sh "$pkgdir/usr/bin/tamil-assistant-launcher"
    
    # Install package files
    install -Dm644 requirements.txt "$pkgdir/usr/share/tamil-assistant/requirements.txt"
    
    # Install prompt templates
    install -dm755 "$pkgdir/usr/share/tamil-assistant/prompts"
    install -Dm644 prompts/page_analysis.txt "$pkgdir/usr/share/tamil-assistant/prompts/"
    install -Dm644 prompts/word_lookup.txt "$pkgdir/usr/share/tamil-assistant/prompts/"
    
    # Note: Logs directory is now created in user's ~/.local/share/tamil-assistant/logs
    
    # Install post-install script
    install -Dm755 tamil-assistant-postinstall.sh "$pkgdir/usr/share/tamil-assistant/postinstall.sh"
}
