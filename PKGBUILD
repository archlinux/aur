# Maintainer: Nico <d3sox at protonmail dot com>
pkgname=anydesk-bin
pkgver=6.2.0
_pkgver_i686="6.0.1"
pkgrel=2
pkgdesc="The Fast Remote Desktop Application"
arch=('i686' 'x86_64')
url="https://anydesk.com"
license=('custom')
depends=('fakeroot' 'minizip' 'python-shiboken2' 'gtkglext' 'libglvnd' 'gtk2' 'libx11' 'glibc' 'glib2' 'gdk-pixbuf2' 'libxcb' 'cairo' 'pango' 'libxi' 'libxrender' 'libxrandr' 'libxtst' 'libxext' 'libxfixes' 'libxdamage' 'libxkbfile' 'gcc-libs' 'lsb-release' 'polkit')
optdepends=('libpulse: audio support' 'gnome-themes-extra: adwaita theme')
conflicts=('anydesk')
provides=('anydesk')
replaces=('anydesk-debian')
options=('!strip')


source_i686=("https://download.anydesk.com/linux/anydesk-${_pkgver_i686}-i386.tar.gz")
source_x86_64=("https://download.anydesk.com/linux/anydesk-${pkgver}-amd64.tar.gz")

sha256sums_i686=('cb22b026e2d81c0de220238fa3d4e13a6d0016787b8c680923794296bbd548e2')
sha256sums_x86_64=('93ce67407d855b21170e007e3dde324ad7cd0a3922206136bc0fd84d72da2b8a')

package() {
    if [ `uname -m` != "x86_64" ];
    then
        printf "%b" "\e[1;31m==> IMPORTANT: Support for 32bit operating systems has ended with version 6.1.0. We strongly recommend upgrading to 64bit operating system.\n"
        printf "%b" "\e[1;31mThis package will install version 6.0.1 on 32bit systems for now.\n"
    fi

    # install binary
    install -Dm 755 "${srcdir}/anydesk-${pkgver}/anydesk" "${pkgdir}/usr/bin/anydesk"

    # install desktop entry
    install -Dm 644 "${srcdir}/anydesk-${pkgver}/anydesk.desktop" "${pkgdir}/usr/share/applications/anydesk.desktop"

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
