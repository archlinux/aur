# Maintainer: Oliver Jaksch <arch-aur@com-in.de>

pkgname=anydesk
pkgver=5.5.3
pkgrel=1
pkgdesc="'AnyDesk Free' is an All-In-One Software for Remote Support"
arch=('i686' 'x86_64')
url="https://anydesk.de"
license=('custom:Freeware')
depends=('fakeroot' 'python-shiboken2' 'gtkglext' 'libglvnd' 'gtk2' 'libx11' 'glibc' 'glib2' 'gdk-pixbuf2' 'libxcb' 'cairo' 'pango' 'libxi' 'libxrandr' 'libxtst' 'libxext' 'libxfixes' 'libxdamage' 'gcc-libs' 'pango-anydesk')
optdepends=('libpulse')

source_i686=(https://download.anydesk.com/linux/${pkgname}_${pkgver}-1_i386.deb)
source_x86_64=(https://download.anydesk.com/linux/${pkgname}_${pkgver}-1_amd64.deb)
source=('anydesk.sh')

sha256sums_i686=('20d93691c8191a2997adf10c06262c1e16778012b383742b90d53e1b6b52a096')
sha256sums_x86_64=('bcd7df64a74bd446eabccc07a6d9246709f4d49f7d98dcf2e7990d81476d670e')
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
    msg2 "\e[1;32mAnyDesk now has a systemd file for unattendant access: anydesk.service \e[0m"
    install -D -m 644 "${pkgdir}/usr/share/anydesk/files/systemd/anydesk.service" "${pkgdir}/usr/lib/systemd/system/anydesk.service"
    sed -i "s/PIDFile=\/tm\/ad.pid/PIDFile=\/run\/anydesk.pid/" "${pkgdir}/usr/lib/systemd/system/anydesk.service"
}
