# Maintainer: Oliver Jaksch <arch-aur@com-in.de>

pkgname=anydesk-rpi
pkgver=5.5.5
pkgrel=1
pkgdesc="'AnyDesk Free' is an All-In-One Software for Remote Support"
arch=('armv7h')
url="https://anydesk.de"
license=('custom:Freeware')
depends=('fakeroot' 'python-shiboken2' 'gtkglext' 'libglvnd' 'gtk2' 'libx11' 'glibc' 'glib2' 'gdk-pixbuf2' 'libxcb' 'cairo' 'pango' 'libxi' 'libxrandr' 'libxtst' 'libxext' 'libxfixes' 'libxdamage' 'gcc-libs')
optdepends=('libpulse')
source=(https://download.anydesk.com/rpi/${pkgname%-rpi}_${pkgver}-1_armhf.deb)
sha256sums=('4bd2f735aa0affc5b91faa68eb43e78961887648fbe4b53ec96e3c4eb1934e5f')

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
