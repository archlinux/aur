# Maintainer: Junyi Xu <junyixu0@gmail.com>
pkgname=screenshot-translator
pkgver=1.0.0
pkgrel=1
pkgdesc="Screenshot translator with CLI and PyQt6 GUI using Gemini API"
arch=('any')
url="https://github.com/junyixu/pyqt-screenshot-translator"
license=('MIT')
depends=(
    'python'
    'python-openai'
    'python-pyqt6'
    'python-pyqt6-webengine'
    'python-markdown'
    'spectacle'
    'kdialog'
)
makedepends=('python-setuptools')
source=("git+https://github.com/junyixu/pyqt-screenshot-translator.git#branch=final-public")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/pyqt-screenshot-translator"
    printf "1.0.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/pyqt-screenshot-translator"
    python setup.py build
}

package() {
    cd "${srcdir}/pyqt-screenshot-translator"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    
    # Create wrapper scripts
    install -Dm755 <(cat << 'EOF'
#!/bin/bash
cd "/usr/lib/python3.11/site-packages/screenshot_translator"
python3 -m screenshot_translator.cli "$@"
EOF
    ) "$pkgdir/usr/bin/screenshot-translator-cli"
    
    install -Dm755 <(cat << 'EOF'
#!/bin/bash
cd "/usr/lib/python3.11/site-packages/screenshot_translator"
python3 -m screenshot_translator.gui "$@"
EOF
    ) "$pkgdir/usr/bin/screenshot-translator-gui"
    
    # Install desktop file
    install -Dm644 <(cat << 'EOF'
[Desktop Entry]
Version=1.0
Type=Application
Name=Screenshot Translator
Comment=Screenshot translator with graphical user interface
Exec=screenshot-translator-gui
Icon=screenshot-translator
Terminal=false
Categories=Utility;Translation;Qt;
EOF
    ) "$pkgdir/usr/share/applications/screenshot-translator.desktop"
    
    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE" 2>/dev/null || true
}