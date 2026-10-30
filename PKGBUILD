# Maintainer: edoaurahman <https://github.com/edoaurahman>
# Based on rustdesk-bin (AUR). Official 1.5.0 package + patched librustdesk.so
# (change resolution on KDE Plasma Wayland): https://github.com/edoaurahman/rustdesk/tree/1.5.0-kde-wayland

pkgname=rustdesk-kde-wayland-bin
_upver=1.5.0
_patch=1
pkgver=${_upver}.kde${_patch}
pkgrel=1
pkgdesc="RustDesk remote desktop, with resolution change support on KDE Plasma Wayland"
url="https://github.com/edoaurahman/rustdesk"
license=('AGPL-3.0-only')
arch=('x86_64')
provides=("rustdesk=${_upver}" "rustdesk-bin=${_upver}")
conflicts=('rustdesk' 'rustdesk-bin')
depends=('gtk3' 'xdotool' 'libxcb' 'libxfixes' 'libpulse' 'libva' 'libvdpau' 'pam'
         'gst-plugins-base' 'gst-plugin-pipewire' 'libvpx' 'libyuv' 'aom' 'opus')
optdepends=('libkscreen: resolution change on KDE Wayland (kscreen-doctor)'
            'libappindicator-gtk3: tray icon'
            'libayatana-appindicator: tray icon')
options=('!strip' '!lto' '!debug')
install=rustdesk.install
source=("rustdesk-${_upver}-x86_64.pkg.tar.zst::https://github.com/rustdesk/rustdesk/releases/download/${_upver}/rustdesk-${_upver}-0-x86_64.pkg.tar.zst"
        "librustdesk-${_upver}-kde-wayland.${_patch}.so::${url}/releases/download/${_upver}-kde-wayland.${_patch}/librustdesk-${_upver}-kde-wayland.${_patch}-x86_64.so")
noextract=("librustdesk-${_upver}-kde-wayland.${_patch}.so")
sha256sums=('e920621899aeaa18c6e7e23b2b565615e7dc957dc987494795ca7a94c3108d7d'
            'fa16b7ef1e37801e9129b1f3fdfcbbd03b9f22f5116c9e274d63aca17b93a833')

package() {
    install -d "${pkgdir}/usr/share/" "${pkgdir}/usr/bin/"
    cp -r "${srcdir}/usr/share/rustdesk/" "${pkgdir}/usr/share/"
    cp -r "${srcdir}/usr/share/icons/" "${pkgdir}/usr/share/"
    install -m 755 "${srcdir}/librustdesk-${_upver}-kde-wayland.${_patch}.so" "${pkgdir}/usr/share/rustdesk/lib/librustdesk.so"

    ln -s "/usr/share/rustdesk/rustdesk" "${pkgdir}/usr/bin/rustdesk"

    install -Dm 644 "${srcdir}/usr/share/rustdesk/files/rustdesk.service" "${pkgdir}/usr/lib/systemd/system/rustdesk.service"
    install -Dm 644 "${srcdir}/usr/share/rustdesk/files/rustdesk.desktop" "${pkgdir}/usr/share/applications/rustdesk.desktop"
    install -Dm 644 "${srcdir}/usr/share/rustdesk/files/rustdesk-link.desktop" "${pkgdir}/usr/share/applications/rustdesk-link.desktop"
    rm -r "${pkgdir}/usr/share/rustdesk/files/"
}
