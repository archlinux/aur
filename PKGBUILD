# Maintainer: Oliver Jaksch <arch-aur at com-in dot de>

pkgname=anydesk-rpi
pkgver=6.1.1
pkgrel=1
pkgdesc="'AnyDesk Free' is an All-In-One Software for Remote Support (for Raspberry Pi)"
arch=('armv7h')
url="https://anydesk.de"
license=('custom:Freeware')
depends=('fakeroot' 'minizip' 'python-shiboken2' 'gtkglext' 'libglvnd' 'gtk2' 'libx11' 'glibc' 'glib2' 'gdk-pixbuf2' 'libxcb' 'cairo' 'pango' 'libxi' 'libxrender' 'libxrandr' 'libxtst' 'libxext' 'libxfixes' 'libxdamage' 'gcc-libs' 'lsb-release' 'gnome-themes-extra')
optdepends=('libpulse: audio support')
source=(https://download.anydesk.com/rpi/${pkgname%-rpi}_${pkgver}-1_armhf.deb)
sha256sums=('f3f1e4a537846a36e81b7982dd6e421e66d1fde22ca376ad068586ae8b59732d')

package() {
    cd "${pkgdir}"
    tar xf "${srcdir}/data.tar.gz"
    #
    # temporary fix for wrong permissions on subdirs:
    find "${pkgdir}" -type d -exec chmod 755 {} \;
    #
    msg2 "\e[1;32mAnyDesk now has a systemd file for unattended access: anydesk.service \e[0m"
    install -D -m 644 "${pkgdir}/usr/share/anydesk/files/systemd/anydesk.service" "${pkgdir}/usr/lib/systemd/system/anydesk.service"
    sed -i "s/PIDFile=\/tm\/ad.pid/PIDFile=\/run\/anydesk.pid/" "${pkgdir}/usr/lib/systemd/system/anydesk.service"
}
