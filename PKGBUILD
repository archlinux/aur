pkgname=eshot-bin
pkgver=4.8.0
pkgrel=1
pkgdesc='Screenshot, annotation, OCR, GIF and video capture tool'
arch=('x86_64')
url='https://github.com/Benoks/EShot'
license=('MIT')
# The AppImage is extracted at build time and run from /opt/eshot, so FUSE is
# not needed and the executable path stays the same across launches.
depends=('xdg-desktop-portal' 'libsecret')
optdepends=('xdg-desktop-portal-gnome: GNOME screenshot and recording integration'
            'gnome-shell-extension-appindicator: tray icon support on GNOME'
            'xdg-desktop-portal-kde: KDE Plasma screenshot and recording integration'
            'ffmpeg: GIF encoding and media export'
            'tesseract: OCR support'
            'tesseract-data-eng: English OCR language data'
            'gst-plugin-pipewire: Wayland GIF and video recording'
            'gst-plugins-good: video recording (MP4 muxer, audio capture)'
            'gst-plugins-bad: video recording (H.264 parser)'
            'gst-plugins-ugly: video recording (x264 encoder)'
            'gst-libav: video recording (AAC audio encoder)')
provides=('eshot')
conflicts=('eshot')
options=('!strip')

_appimage="EShot-v${pkgver}-x86_64.AppImage"
source=("${_appimage}::https://github.com/Benoks/EShot/releases/download/v${pkgver}/${_appimage}"
        'eshot')
sha256sums=('750ae4f051575ba2aee4711f2c7da27ed635bbebebb374c6856a5a043642ae6e'
            'SKIP')

prepare() {
    chmod +x "${srcdir}/${_appimage}"
    "${srcdir}/${_appimage}" --appimage-extract >/dev/null
}

package() {
    install -d "${pkgdir}/opt"
    cp -a "${srcdir}/squashfs-root" "${pkgdir}/opt/eshot"
    chmod -R u=rwX,go=rX "${pkgdir}/opt/eshot"
    # Autostart entries, GNOME shortcuts and KWin permissions created by older
    # packages point at /opt/eshot/EShot.AppImage; keep that path working.
    ln -s AppRun "${pkgdir}/opt/eshot/EShot.AppImage"
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
