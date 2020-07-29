# Maintainer: Nico <desoxhd@gmail.com>
pkgname=anydesk-bin
pkgver=6.0.0
pkgrel=1
pkgdesc="The Fast Remote Desktop Application (Generic based package)"
arch=('i686' 'x86_64')
url="https://anydesk.com"
license=('custom')
depends=('fakeroot' 'python-shiboken2' 'gtkglext' 'libglvnd' 'gtk2' 'libx11' 'glibc' 'glib2' 'gdk-pixbuf2' 'libxcb' 'cairo' 'pango' 'libxi' 'libxrender' 'libxrandr' 'libxtst' 'libxext' 'libxfixes' 'libxdamage' 'gcc-libs' 'lsb-release' 'gnome-themes-extra')
optdepends=('libpulse: audio support')
makedepends=('patchelf')
conflicts=('anydesk' 'anydesk-test' 'anydesk-debian' 'pango-anydesk')
provides=('anydesk')
options=('!strip')

source_i686=("https://download.anydesk.com/linux/anydesk-${pkgver}-i386.tar.gz")
source_x86_64=("https://download.anydesk.com/linux/anydesk-${pkgver}-amd64.tar.gz")

sha256sums_i686=('369ed52f4876f29ea4d3713401493e28fa21749bc0f24f0809e5b770c93e8c37')
sha256sums_x86_64=('9df6583097865591d153853f730f02dde003756dd5840dc670d25f3c275d86a5')

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
    
    msg2 "\e[1;32mAnyDesk has a systemd service for unattended access. Enable it with: systemctl enable --now anydesk \e[0m"
    # install systemd service
    install -Dm 644 "${srcdir}/anydesk-${pkgver}/systemd/anydesk.service" "${pkgdir}/usr/lib/systemd/system/anydesk.service"
}
