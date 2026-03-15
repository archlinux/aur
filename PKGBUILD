pkgname=display-pilot-2
pkgver=1.1.0.0
pkgrel=1
pkgdesc="BenQ Display Pilot 2 - monitor control software for BenQ displays (DDC/CI)"
arch=('x86_64')
url="https://www.benq.com/en-us/monitor/software/display-pilot-2.html"
license=('LicenseRef-BenQ-EULA')
depends=('fuse2' 'ddcutil' 'hicolor-icon-theme')
options=('!strip' '!debug')
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.zip::https://esupportdownload.benq.com/esupport/VERTICAL%20&%20PROFESSIONAL%20DISPLAY/Software/Display%20Pilot%202/Display%20Pilot%202_Display%20Pilot%202%20for%20Linux_v1.1.0.0_Linux_251212162625.zip")
sha256sums=('c61e405bc4d509a4faab061e545afbd69667ecf6fc3235553acfbba634e20270')

prepare() {
    chmod +x "${srcdir}/Display Pilot 2-${pkgver}-release.AppImage"
    "${srcdir}/Display Pilot 2-${pkgver}-release.AppImage" --appimage-extract "usr/share/icons/*" > /dev/null 2>&1
    "${srcdir}/Display Pilot 2-${pkgver}-release.AppImage" --appimage-extract "*.desktop" > /dev/null 2>&1
}

package() {
    install -Dm755 "${srcdir}/Display Pilot 2-${pkgver}-release.AppImage" \
        "${pkgdir}/opt/${pkgname}/DisplayPilot2.AppImage"

    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/scalable/apps/dp2_svg.svg" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"

    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/${pkgname}.desktop" <<EOF
[Desktop Entry]
Name=Display Pilot 2
Comment=BenQ monitor control software
Exec=/opt/${pkgname}/DisplayPilot2.AppImage
Icon=${pkgname}
Type=Application
Categories=Utility;Settings;
StartupWMClass=Display Pilot 2
EOF

    install -Dm644 /dev/stdin "${pkgdir}/usr/share/modules-load.d/${pkgname}.conf" <<EOF
i2c-dev
EOF

    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/DisplayPilot2.AppImage" "${pkgdir}/usr/bin/display-pilot-2"
}
