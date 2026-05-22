# Maintainer: DolbyDAX2 <dolbydax2@fatihdurdu.xyz>
pkgname=llamatray
pkgver=1.0.0
pkgrel=1
pkgdesc="PyQt6 based Llama.cpp Tray Manager for Linux"
arch=('any')
url="https://github.com/DolbyDAX2/LlamaTray"
license=('MIT')
depends=('python' 'python-pyqt6' 'python-psutil' 'python-requests')
optdepends=('nvidia-ml-py: NVIDIA GPU monitoring support')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/DolbyDAX2/LlamaTray/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=('SKIP')

package() {
    cd "${srcdir}/LlamaTray-${pkgver}"

    # Python modüllerini /opt/LlamaTray altına kopyala
    install -d "${pkgdir}/opt/LlamaTray"
    
    # Sadece gerekli dosyaları kopyala
    cp -r LlamaTray "${pkgdir}/opt/LlamaTray/"
    cp requirements.txt "${pkgdir}/opt/LlamaTray/" 2>/dev/null || true
    cp README.md "${pkgdir}/opt/LlamaTray/" 2>/dev/null || true

    # Sistemin global olarak çalıştırabilmesi için /usr/bin altına başlatıcı ekle
    install -d "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/LlamaTray" << 'EOF'
#!/bin/bash
# Temizlik fonksiyonu
cleanup() {
    killall -9 llama-server 2>/dev/null || true
}
trap cleanup EXIT INT TERM

cd /opt/LlamaTray
python -m LlamaTray "$@"
EOF
    chmod +x "${pkgdir}/usr/bin/LlamaTray"

    # İkon dosyasını sistem ikon dizinine kopyala
    install -d "${pkgdir}/usr/share/pixmaps"
    cp LlamaTray/assets/icon.png "${pkgdir}/usr/share/pixmaps/LlamaTray.png" 2>/dev/null || \
    cp LlamaTray/icon.png "${pkgdir}/usr/share/pixmaps/LlamaTray.png" 2>/dev/null || true

    # Masaüstü kısayolunu menüye yerleştir
    install -d "${pkgdir}/usr/share/applications"
    cat > "${pkgdir}/usr/share/applications/LlamaTray.desktop" << 'EOF'
[Desktop Entry]
Type=Application
Name=LlamaTray
Comment=Llama.cpp Tray Manager
Exec=LlamaTray
Icon=LlamaTray
Categories=Utility;
Terminal=false
EOF
    chmod 644 "${pkgdir}/usr/share/applications/LlamaTray.desktop"
}