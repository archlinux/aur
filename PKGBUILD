pkgname=rizzo-pii-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Rizzo PII - anonimizzazione in locale"
arch=('x86_64')
url="https://github.com/Rizzo-AI-Academy/rizzo-pii"
license=('MIT')
provides=('rizzo-pii')
conflicts=('rizzo-pii')
options=('!strip' '!debug')
source=("${pkgname}-${pkgver}.AppImage::https://github.com/Rizzo-AI-Academy/rizzo-pii/releases/download/v${pkgver}/Rizzo-PII-${pkgver}-Linux-x86_64.AppImage")
sha256sums=('0c9059b96c8f5540931e307976fe455174570749dd1d7d939f5343b245653350')

prepare() {
    chmod +x "${srcdir}/${pkgname}-${pkgver}.AppImage"
    "${srcdir}/${pkgname}-${pkgver}.AppImage" --appimage-extract
    
    cd squashfs-root
    rm -f usr/lib/libwayland-*.so*
    rm -f usr/lib/libEGL.so*
    rm -f usr/lib/libGL.so*
}

package() {
    install -d "${pkgdir}/opt/${pkgname}"
    cp -r "${srcdir}/squashfs-root/"* "${pkgdir}/opt/${pkgname}/"
    
    chmod -R 755 "${pkgdir}/opt/${pkgname}"
    
    install -d "${pkgdir}/usr/bin"
    echo '#!/bin/bash
export GDK_BACKEND=x11
cd /opt/'"${pkgname}"'
exec ./AppRun "$@"' > "${pkgdir}/usr/bin/rizzo-pii"
    chmod +x "${pkgdir}/usr/bin/rizzo-pii"

    install -d "${pkgdir}/usr/share/applications"
    echo '[Desktop Entry]
Categories=Office;
Comment=Rizzo PII - anonimizzazione in locale
Exec=rizzo-pii
StartupWMClass=app
Icon=/opt/'"${pkgname}"'/app.png
Name=Rizzo PII
Terminal=false
Type=Application' > "${pkgdir}/usr/share/applications/rizzo-pii.desktop"
}
