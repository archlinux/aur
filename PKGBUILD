# Maintainer: taotieren <admin@taotieren.com>

pkgbase=rustdesk-nightly
pkgname=(rustdesk{,-appimage}-nightly)
pkgver=1.2.2
pkgrel=0
pkgdesc="Yet another remote desktop software, written in Rust. Works out of the box, no configuration required. Great alternative to TeamViewer and AnyDesk!"
arch=('x86_64' 'aarch64')
url="https://github.com/rustdesk/rustdesk"
license=('GPL3')
optdepends=(
    'libappindicator-gtk3: tray icon'
    'libayatana-appindicator: tray icon'
)
options=('!strip')
source=("${pkgbase%-nightly}-${pkgver}-$CARCH.pkg.tar.zst::$url/releases/download/${pkgver}/rustdesk-${pkgver}-0-$CARCH.pkg.tar.zst")
source_x86_64=("${pkgbase%-nightly}-${pkgver}-x86_64.AppImage::${url}/releases/download/${pkgver}/${pkgbase%-nightly}-${pkgver}-x86_64.AppImage")
source_aarch64=("${pkgbase%-nightly}-${pkgver}-aarch64.AppImage::${url}/releases/download/${pkgver}/${pkgbase%-nightly}-${pkgver}-aarch64.AppImage")
sha256sums=('SKIP')
sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')

_install_path="/opt/appimages"

prepare() {
    sed -i "s/^\(Icon=\).*$/\1rustdesk/" "$srcdir/usr/share/rustdesk/files/rustdesk.desktop"
    cd ${srcdir}
    chmod a+x ${pkgbase%-nightly}-${pkgver}-${CARCH}.AppImage
    "./${pkgbase%-nightly}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
    sed 's|usr/lib/rustdesk/rustdesk|/opt/appimages/rustdesk.AppImage|g' -i "${srcdir}/squashfs-root/${pkgbase%-nightly}.desktop"
}

package_rustdesk-nightly() {
    provides=("${pkgname%-nightly}")
    conflicts=("${pkgname%-nightly}")
    depends=(
        'gstreamer'
        'gst-plugins-base-libs'
        'gtk3'
        'libpulse'
        'libva'
        'libvdpau'
        'libxcb'
        'libxfixes'
        'xdg-utils'
        'xdotool'
        'hicolor-icon-theme'
    )

# TODO: add dep on libsciter-gtk, remove libsciter-gtk.so from this package

    mkdir -p "$pkgdir/usr/bin/"
    ln -s "/usr/lib/rustdesk/rustdesk" "$pkgdir/usr/bin/rustdesk"

    mkdir -p "$pkgdir/usr/lib/"
    cp -r "$srcdir/usr/lib/rustdesk/" "$pkgdir/usr/lib/"

    install -Dm644 "$srcdir/usr/share/icons/hicolor/256x256/apps/rustdesk.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/rustdesk.png"
    install -Dm644 "$srcdir/usr/share/icons/hicolor/scalable/apps/rustdesk.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/rustdesk.svg"
    install -Dm644 "$srcdir/usr/share/rustdesk/files/rustdesk.desktop" "$pkgdir/usr/share/applications/rustdesk.desktop"
    install -Dm644 "$srcdir/usr/share/rustdesk/files/rustdesk-link.desktop" "$pkgdir/usr/share/applications/rustdesk-link.desktop"
    install -Dm644 "$srcdir/usr/share/rustdesk/files/rustdesk.service" "$pkgdir/usr/lib/systemd/system/rustdesk.service"
}

package_rustdesk-appimage-nightly() {
    pkgdesc+=" (AppImage)"
    provides=("${pkgname%-appimage-nightly}")
    conflicts=("${pkgname%-appimage-nightly}")

    install -Dm755 "${srcdir}"/${pkgbase%-nightly}-${pkgver}-${CARCH}.AppImage "${pkgdir}"/${_install_path}/${pkgbase%-nightly}.AppImage

    local _icon
    for _icon in 32 64 128 ; do
        install -Dm0644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icon}x${_icon}/apps/${pkgbase%-nightly}.png" \
                    -t  "${pkgdir}/usr/share/icons/hicolor/${_icon}x${_icon}/apps"
    done

    install -Dm644 "${srcdir}/squashfs-root/${pkgbase%-nightly}.desktop" -t "${pkgdir}/usr/share/applications"
}
