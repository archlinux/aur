pkgname=eshot-bin
pkgver=4.6.1
pkgrel=1
pkgdesc='Screenshot, annotation, OCR, GIF and video capture tool'
arch=('x86_64')
url='https://github.com/Benoks/EShot'
license=('MIT')
depends=('fuse2' 'xdg-desktop-portal' 'libsecret')
optdepends=('xdg-desktop-portal-gnome: GNOME screenshot and recording integration'
            'gnome-shell-extension-appindicator: tray icon support on GNOME'
            'xdg-desktop-portal-kde: KDE Plasma screenshot and recording integration'
            'ffmpeg: GIF encoding and media export'
            'tesseract: OCR support'
            'gst-plugin-pipewire: Wayland GIF and video recording')
provides=('eshot')
conflicts=('eshot')
options=('!strip')

_appimage="EShot-v${pkgver}-x86_64.AppImage"
source=("${_appimage}::https://github.com/Benoks/EShot/releases/download/v${pkgver}/${_appimage}"
        'eshot')
sha256sums=('ebb452adbe454aac3a64f09a335e9e090a7d5f4bb711dfa20687386005f579aa'
            'SKIP')

prepare() {
    chmod +x "${srcdir}/${_appimage}"
    "${srcdir}/${_appimage}" --appimage-extract >/dev/null
}

package() {
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/eshot/EShot.AppImage"
    install -Dm755 "${srcdir}/eshot" "${pkgdir}/usr/bin/eshot"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/applications/io.github.benoks.EShot.desktop" \
        "${pkgdir}/usr/share/applications/io.github.benoks.EShot.desktop"
    sed -i -E 's|^Exec=eshot-launcher(.*)$|Exec=eshot\1|' \
        "${pkgdir}/usr/share/applications/io.github.benoks.EShot.desktop"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/scalable/apps/io.github.benoks.EShot.svg" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/io.github.benoks.EShot.svg"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/scalable/apps/io.github.benoks.EShot-v4.svg" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/io.github.benoks.EShot-v4.svg"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/metainfo/io.github.benoks.EShot.metainfo.xml" \
        "${pkgdir}/usr/share/metainfo/io.github.benoks.EShot.metainfo.xml"
}
