# Maintainer: DolbyDAX2 <dolbydax2@fatihdurdu.xyz>
pkgname=llamatray-git
pkgver=1.0.2
pkgrel=1
pkgdesc="PyQt6 based Llama.cpp Tray Manager for Linux"
arch=('any')
url="https://github.com/DolbyDAX2/LlamaTray"
license=('MIT')
depends=('python' 'python-pyqt6' 'python-psutil' 'python-requests')
makedepends=('git') # Git deposundan çekim yapabilmek için şart
optdepends=('nvidia-ml-py: NVIDIA GPU monitoring support')
provides=('llamatray')
conflicts=('llamatray')

# Sabit tar.gz yerine doğrudan projenin ana Git deposunu kaynak alıyoruz
source=("${pkgname}::git+https://github.com/DolbyDAX2/LlamaTray.git")
md5sums=('SKIP')

package() {
    cd "${srcdir}/${pkgname}"

    # Python modüllerini /opt/LlamaTray altına kopyala
    install -d "${pkgdir}/opt/LlamaTray"

    # .git ve arch-package klasörlerini hariç tutarak tertemiz kopyalama yapalım
    cp -r LlamaTray "${pkgdir}/opt/LlamaTray/"
    cp requirements.txt "${pkgdir}/opt/LlamaTray/" 2>/dev/null || true
    cp README.md "${pkgdir}/opt/LlamaTray/" 2>/dev/null || true

    # Global çalıştırıcı wrapper script oluştur
    install -d "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/LlamaTray" << 'EOF'
#!/bin/bash
cleanup() {
    killall -9 llama-server 2>/dev/null || true
}
trap cleanup EXIT INT TERM

cd /opt/LlamaTray
python -m LlamaTray.main "$@"
EOF
    chmod +x "${pkgdir}/usr/bin/LlamaTray"

    # İkon dosyasını yerleştir
    install -d "${pkgdir}/usr/share/pixmaps"
    cp LlamaTray/assets/icon.png "${pkgdir}/usr/share/pixmaps/LlamaTray.png" 2>/dev/null || \
    cp LlamaTray/icon.png "${pkgdir}/usr/share/pixmaps/LlamaTray.png" 2>/dev/null || true

    # Masaüstü kısayolu
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
