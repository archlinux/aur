# Maintainer: Your Name <mehad605@gmail.com>
pkgname=bangla-typer-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Master Bangla Typing with Real-World Content & YouTube Integration (binary release)"
arch=('x86_64')
url="https://github.com/mehad605/Bangla_Typer"
license=('custom:CC-BY-NC-SA-4.0')
depends=(
    'gtk3'
    'webkit2gtk'
)
provides=('bangla-typer')
conflicts=('bangla-typer')
source=("bangla-typer-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/bangla-typer-${pkgver}.tar.gz")
sha256sums=('0d6030f763d04f9cd8af625ea6d75f12f25717fd75b6ebfd857e463b9ce71198')

prepare() {
    # Create desktop file
    cat > "bangla-typer.desktop" << EOF
[Desktop Entry]
Name=Bangla Typer
Comment=Master Bangla Typing with Real-World Content
Exec=bangla-typer
Icon=bangla-typer
Terminal=false
Type=Application
Categories=Education;Utility;
Keywords=typing;bangla;bengali;trainer;
EOF
}

package() {
    # Create installation directories
    install -dm755 "${pkgdir}/opt/bangla-typer"
    install -dm755 "${pkgdir}/usr/bin"
    install -dm755 "${pkgdir}/usr/share/applications"
    install -dm755 "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
    install -dm755 "${pkgdir}/usr/share/licenses/bangla-typer"
    
    # Copy binary directory contents to /opt/bangla-typer
    cp -r "${srcdir}/bangla-typer-${pkgver}/bin/"* "${pkgdir}/opt/bangla-typer/"
    
    # Make the main binary executable
    chmod +x "${pkgdir}/opt/bangla-typer/bangla-typer"
    
    # Create symlink to /usr/bin
    ln -s "/opt/bangla-typer/bangla-typer" "${pkgdir}/usr/bin/bangla-typer"
    
    # Install icon (if exists)
    if [ -f "${pkgdir}/opt/bangla-typer/static/icon.svg" ]; then
        install -Dm644 "${pkgdir}/opt/bangla-typer/static/icon.svg" \
            "${pkgdir}/usr/share/icons/hicolor/scalable/apps/bangla-typer.svg"
    fi
    
    # Install desktop entry (created in prepare())
    install -Dm644 "${srcdir}/bangla-typer.desktop" \
        "${pkgdir}/usr/share/applications/bangla-typer.desktop"
    
    # Install license from tarball root
    install -Dm644 "${srcdir}/bangla-typer-${pkgver}/LICENSE" \
        "${pkgdir}/usr/share/licenses/bangla-typer/LICENSE"
}
