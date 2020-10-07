# Maintainer: Nico <d3sox at protonmail dot com>
pkgname=anydesk-bin
pkgver=6.0.1
pkgrel=1
pkgdesc="The Fast Remote Desktop Application (Generic based package)"
arch=('i686' 'x86_64')
url="https://anydesk.com"
license=('custom')
depends=('fakeroot' 'python-shiboken2' 'gtkglext' 'libglvnd' 'gtk2' 'libx11' 'glibc' 'glib2' 'gdk-pixbuf2' 'libxcb' 'cairo' 'pango' 'libxi' 'libxrender' 'libxrandr' 'libxtst' 'libxext' 'libxfixes' 'libxdamage' 'gcc-libs' 'lsb-release' 'gnome-themes-extra')
optdepends=('libpulse: audio support')
makedepends=('patchelf')
conflicts=('anydesk')
provides=('anydesk')
replaces=('anydesk-debian')
options=('!strip')

source_i686=("https://download.anydesk.com/linux/anydesk-${pkgver}-i386.tar.gz")
source_x86_64=("https://download.anydesk.com/linux/anydesk-${pkgver}-amd64.tar.gz")

sha256sums_i686=('cb22b026e2d81c0de220238fa3d4e13a6d0016787b8c680923794296bbd548e2')
sha256sums_x86_64=('b7826dcd379c27f615424d36d9383b8033c0b8c221751cad4ae7d9809f0fe5a4')

package() {
    # install start script which sets the env variable for theme?
    # install binary
    install -Dm 755 "${srcdir}/anydesk-${pkgver}/anydesk" "${pkgdir}/usr/bin/anydesk"
    # patch the binary to replace obsolete dependency
    patchelf --replace-needed 'libpangox-1.0.so.0' 'libpangoxft-1.0.so' "${pkgdir}/usr/bin/anydesk"

    # install desktop entry
    install -Dm 644 "${srcdir}/anydesk-${pkgver}/anydesk.desktop" "${pkgdir}/usr/share/applications/anydesk.desktop"
    # force gtk2 theme to adwaita in desktop entry to fix unreadable text
    sed -i -e "s:Exec=/usr/bin/anydesk:Exec=env GTK2_RC_FILES=/usr/share/themes/Adwaita/gtk-2.0/gtkrc /usr/bin/anydesk:g" "${pkgdir}/usr/share/applications/anydesk.desktop"

    # install polkit action
    install -Dm 644 "${srcdir}/anydesk-${pkgver}/polkit-1/com.philandro.anydesk.policy" "${pkgdir}/usr/share/polkit-1/actions/com.philandro.anydesk.policy"
    # install icon
    install -Dm 644 "${srcdir}/anydesk-${pkgver}/icons/hicolor/scalable/apps/anydesk.svg" "${pkgdir}/usr/share/pixmaps/anydesk.svg"
    # install license
    install -Dm 644 "${srcdir}/anydesk-${pkgver}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    
    warning "AnyDesk has a systemd service for unattended access. Enable it with: systemctl enable --now anydesk"
    # install systemd service
    install -Dm 644 "${srcdir}/anydesk-${pkgver}/systemd/anydesk.service" "${pkgdir}/usr/lib/systemd/system/anydesk.service"
}
