# Maintainer: PaloMiku <palomiku@outlook.com>

pkgname=koharu-appimage
_pkgname=koharu
pkgver=0.44.6
pkgrel=1
pkgdesc="ML-powered manga translator"
arch=('x86_64')
url='https://github.com/mayocream/koharu'
license=('GPL-3.0-or-later')
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator' 'xdg-user-dirs')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("koharu_${pkgver}_amd64.AppImage::https://github.com/mayocream/koharu/releases/download/${pkgver}/koharu_${pkgver}_amd64.AppImage")
sha512sums_x86_64=('aa3021b00e1b0da0a6ffee4c2e512d03db2abfe80de1947956391267fbb0d730d5f5ee996b38c1378ae56803e247713a1d3e977f9e0ea18ac3a14d5e6e685861')
options=('!strip')

package() {
    mkdir -p "${pkgdir}/opt/${_pkgname}"
    chmod +x "${srcdir}/koharu_${pkgver}_amd64.AppImage"
    "${srcdir}/koharu_${pkgver}_amd64.AppImage" --appimage-extract >/dev/null 2>&1
    cp -a "${srcdir}/squashfs-root/." "${pkgdir}/opt/${_pkgname}/"
    rm -rf "${srcdir}/squashfs-root"

    mkdir -p "${pkgdir}/usr/share/applications"
    cat > "${pkgdir}/usr/share/applications/io.github.mayocream.koharu.desktop" <<EOF
[Desktop Entry]
Name=Koharu
Comment=ML-powered manga translator
Exec=/opt/koharu/koharu
Icon=io.github.mayocream.koharu
Terminal=false
Type=Application
Categories=Graphics;Utility;
Keywords=manga;translation;ml;
EOF

    mkdir -p "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
    if [[ -f "${pkgdir}/opt/koharu/koharu.png" ]]; then
        cp "${pkgdir}/opt/koharu/koharu.png" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/io.github.mayocream.koharu.png"
    fi
}