# Maintainer: John Fajardo <fajardocj at gmail dot com>

pkgname=ms-outlook-nativefier
pkgver=0.01
pkgrel=1
pkgdesc="Outlook desktop built with nativefier (electron)"
arch=("armv7l" "i686" "x86_64")
url="https://outlook.office365.com/mail/inbox"
license=("custom")
depends=("gtk3" "libxss" "nss")
optdepends=("libindicator-gtk3")
makedepends=("imagemagick" "nodejs-nativefier" "unzip")
source=(
    "${pkgname}.png"
    "${pkgname}.desktop"
)
sha256sums=('ccd090788c82216916f2d5674c8db74473c9b3a82d3d0511ddf3dbde445ca43b'
            'f4186e7f6c5b41f19a54a65bca28e52321908f9feb8bf120785df89be9e89f84')

build() {
    cd "${srcdir}"

    nativefier \
        --name "MS Outlook" \
        --internal-urls '.*?(outlook.live.com|outlook.office365.com).*?' \
        --file-download-options '{"saveAs": true}' \
        --icon "${pkgname}.png" \
        --width "512px" \
        --height "512px" \
        --user-agent "safari" \
        --browserwindow-options '{"webPreferences": { "spellcheck": false, "webviewTag": true, "nodeIntegration": true, "nodeIntegrationInSubFrames": true, "nativeWindowOpen": true } }' \
        --verbose \
        --single-instance \
        --tray \
        "${url}"
}
# MSOutlook-linux-x64
package() {
    install -dm755 "${pkgdir}/"{opt,usr/{bin,share/{applications,licenses/${pkgname}}}}

    _folder=$(ls "${srcdir}" | grep "[Mm][Ss][-]*[Oo]utlook-linux-")
    _binary=$(ls "${srcdir}/${_folder}" | grep "[Mm][Ss][-]*[Oo]utlook")

    cp -rL "${srcdir}/${_folder}" "${pkgdir}/opt/${pkgname}"
    ln -s "/opt/${pkgname}/${_binary}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "${pkgdir}/opt/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    for _size in "512x512" "192x192" "128x128" "96x96" "64x64" "48x48" "32x32" "24x24" "22x22" "20x20" "16x16" "8x8"
    do
        install -dm755 "${pkgdir}/usr/share/icons/hicolor/${_size}/apps"
        convert "${srcdir}/${pkgname}.png" -strip -resize "${_size}" "${pkgdir}/usr/share/icons/hicolor/${_size}/apps/${pkgname}.png"
    done
}
