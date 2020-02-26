# Maintainer: Oliver Jaksch <arch-aur@com-in.de>

pkgname=anydesk-debian
pkgver=5.5.4
pkgrel=1
pkgdesc="'AnyDesk Free' is an All-In-One Software for Remote Support (Debian based package)"
arch=('i686' 'x86_64')
url="https://anydesk.de"
license=('custom:Freeware')
depends=('fakeroot' 'python-shiboken2' 'gtkglext' 'libglvnd' 'gtk2' 'libx11' 'glibc' 'glib2' 'gdk-pixbuf2' 'libxcb' 'cairo' 'pango' 'libxi' 'libxrandr' 'libxtst' 'libxext' 'libxfixes' 'libxdamage' 'gcc-libs' 'pango-anydesk')
optdepends=('libpulse')
conflicts=('anydesk-test' 'anydesk-bin')

source_i686=(https://download.anydesk.com/linux/${pkgname}_${pkgver}-1_i386.deb)
source_x86_64=(https://download.anydesk.com/linux/${pkgname}_${pkgver}-1_amd64.deb)
source=('anydesk.sh')

sha256sums_i686=('1bbecb117ccd092defd04df3fcd2412247dd3a020fc49cbb99ae74395007e8ed')
sha256sums_x86_64=('4253a0b738b1af17d74b7e5d69ad0af794f98da7c8cc1e636d6f093dc5b6da40')
sha256sums=('2368b0011fc52cbb4cf8013436628d25db3a86b35ae9a04868e221656a0f77a3')

package() {
    cd "${pkgdir}"
    tar xf "${srcdir}/data.tar.gz"
    #
    # temporary fix for wrong permissions on subdirs:
    find "${pkgdir}" -type d -exec chmod 755 {} \;
    #
    # temporary fix for issues with pango>=1.44
    install "${pkgdir}/usr/bin/anydesk" "${pkgdir}/usr/bin/anydesk.bin"
    install "${srcdir}/anydesk.sh" "${pkgdir}/usr/bin/anydesk"
    #
    msg2 "\e[1;32mAnyDesk now has a systemd file for unattended access: anydesk.service \e[0m"
    install -D -m 644 "${pkgdir}/usr/share/anydesk/files/systemd/anydesk.service" "${pkgdir}/usr/lib/systemd/system/anydesk.service"
    sed -i "s/PIDFile=\/tm\/ad.pid/PIDFile=\/run\/anydesk.pid/" "${pkgdir}/usr/lib/systemd/system/anydesk.service"
}
