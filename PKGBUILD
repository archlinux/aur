# Maintainer: Your Name <your.email@example.com>
pkgname=opsec-shield
pkgver=1.0.0
pkgrel=1
pkgdesc="Privacy and security toolkit with Cloudflare WARP VPN integration, Java malware scanner, password fortifier, and metadata anonymizer"
arch=('x86_64')
url="https://github.com/YOUR_USERNAME/opsec-shield"
license=('MIT')
depends=(
    'python'
    'python-pyqt5'
    'python-pyqt5-webengine'
    'python-pywebview'
    'python-pillow'
    'python-requests'
    'qt5-webengine'
)
optdepends=(
    'cloudflare-warp-bin: Required for WARP VPN feature'
)
makedepends=(
    'python-pyinstaller'
)
source=(
    "opsec-shield-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
)
sha256sums=('SKIP')  # Update this after uploading to GitHub

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    
    # Build standalone binary with PyInstaller
    pyinstaller --onefile --noconsole --name "opsec-shield" \
        --add-data "index.html:." \
        --add-data "style.css:." \
        --add-data "app.js:." \
        --add-data "opsec.svg:." \
        main.py
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    
    # Install binary
    install -Dm755 "dist/opsec-shield" "${pkgdir}/usr/bin/opsec-shield"
    
    # Install desktop file
    install -Dm644 "opsec-shield.desktop" "${pkgdir}/usr/share/applications/opsec-shield.desktop"
    
    # Install icon (multiple sizes for better compatibility)
    install -Dm644 "opsec.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/opsec-shield.svg"
    
    # Install license
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    
    # Install documentation
    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
