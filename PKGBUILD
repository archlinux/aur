# Maintainer: Nico <d3sox at protonmail dot com>
pkgname=anydesk-bin
pkgver=8.0.0
pkgrel=1
pkgdesc="The Fast Remote Desktop Application"
arch=('x86_64' 'aarch64')
url="https://anydesk.com"
license=('custom')
depends=('fakeroot' 'minizip' 'libglvnd' 'gtk3' 'libx11' 'glibc' 'glib2' 'gdk-pixbuf2' 'libxcb' 'cairo' 'pango' 'libxi' 'libxrender' 'libxrandr' 'libxtst' 'libxext' 'libxfixes' 'libxdamage' 'libxkbfile' 'gcc-libs' 'lsb-release' 'polkit' 'yp-tools')
optdepends=('libpulse: audio support' 'gnome-themes-extra: adwaita theme')
conflicts=('anydesk')
provides=('anydesk')
options=('!strip')
source_x86_64=("https://download.anydesk.com/linux/anydesk-${pkgver}-amd64.tar.gz")
source_aarch64=("https://download.anydesk.com/rpi/anydesk-${pkgver}-arm64.tar.gz")
sha256sums_x86_64=('1a1ae83cb260b19a7570a68f08bd0d5a085e85d2cf970dec23ed57299de31e62')
sha256sums_aarch64=('78d0880015823caf357edc64ed83084a538bd50e7495f2e225fbce49cecb6724')

package() {
    # install binary
    install -Dm 755 "${srcdir}/anydesk-${pkgver}/anydesk" "${pkgdir}/usr/bin/anydesk"

    # install desktop entry
    install -Dm 644 "${srcdir}/anydesk-${pkgver}/anydesk.desktop" "${pkgdir}/usr/share/applications/anydesk.desktop"
    # workaround to fix crashes
    sed -i 's/^Exec=/Exec=env GDK_BACKEND=x11 /' "${pkgdir}/usr/share/applications/anydesk.desktop"

    # install polkit action
    install -Dm 644 "${srcdir}/anydesk-${pkgver}/polkit-1/com.anydesk.anydesk.policy" "${pkgdir}/usr/share/polkit-1/actions/com.anydesk.anydesk.policy"
    # install icon
    install -Dm 644 "${srcdir}/anydesk-${pkgver}/icons/hicolor/scalable/apps/anydesk.svg" "${pkgdir}/usr/share/pixmaps/anydesk.svg"
    # install license
    install -Dm 644 "${srcdir}/anydesk-${pkgver}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    printf "%b" "\e[1;33m==> WARNING: \e[0mAnyDesk has a systemd service for unattended access. Enable it with: systemctl enable --now anydesk\n"
    # install systemd service
    install -Dm 644 "${srcdir}/anydesk-${pkgver}/systemd/anydesk.service" "${pkgdir}/usr/lib/systemd/system/anydesk.service"
}
