# Maintainer: Joseph Petersen <me@jetersen.dev>

pkgname=t3-code
pkgver=0.0.0.alpha.22
pkgrel=1
pkgdesc="T3 Code - AI-native code editor by Ping Labs"
arch=('x86_64')
url="https://github.com/pingdotgg/t3code"
license=('MIT')
depends=('bash' 'fuse2' 'hicolor-icon-theme')
provides=('t3-code')
conflicts=('t3-code')
options=('!strip')

_upver="${pkgver//.alpha/-alpha}"
_appimage="T3-Code-${_upver}-x86_64.AppImage"
source=("${pkgname}-${pkgver}.AppImage::https://github.com/pingdotgg/t3code/releases/download/v${_upver}/${_appimage}"
        'start')
sha256sums=('874c768a54e341d41f825a963ca9c339442afec9abd63072a7775db4f3d999a6'
            'a08fe7f4c01d5c38a8d64195ccc335cc97397f9fc80bb13723999b035f3a0cc9')

prepare() {
    chmod +x "${srcdir}/${pkgname}-${pkgver}.AppImage"
    "${srcdir}/${pkgname}-${pkgver}.AppImage" --appimage-extract >/dev/null
}

build() {
    sed -i "s|Exec=.*|Exec=/usr/bin/${pkgname} --no-sandbox %U|" "${srcdir}/squashfs-root/t3-code-desktop.desktop"
    sed -i "s|Icon=.*|Icon=${pkgname}|"                          "${srcdir}/squashfs-root/t3-code-desktop.desktop"
}

package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}.AppImage" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"
    install -Dm755 "${srcdir}/start"                         "${pkgdir}/usr/bin/${pkgname}"

    install -dm755 "${pkgdir}/usr/share/applications/"
    install -dm755 "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/"

    install -m644 "${srcdir}/squashfs-root/t3-code-desktop.desktop" \
        "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -m644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/1024x1024/apps/t3-code-desktop.png" \
        "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/${pkgname}.png"

    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -m644 "${srcdir}/squashfs-root/LICENSE.electron.txt" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.electron.txt"
    install -m644 "${srcdir}/squashfs-root/LICENSES.chromium.html" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.chromium.html"
}
