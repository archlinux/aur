# Maintainer: Oliver Jaksch <arch-aur@com-in.de>

pkgname=anydesk-debian
pkgver=6.0.0
pkgrel=1
pkgdesc="'AnyDesk Free' is an All-In-One Software for Remote Support (Debian based package)"
arch=('i686' 'x86_64')
url="https://anydesk.de"
license=('custom:Freeware')
depends=('fakeroot' 'python-shiboken2' 'gtkglext' 'libglvnd' 'gtk2' 'libx11' 'glibc' 'glib2' 'gdk-pixbuf2' 'libxcb' 'cairo' 'pango' 'libxi' 'libxrandr' 'libxtst' 'libxext' 'libxfixes' 'libxdamage' 'gcc-libs' 'pango-anydesk')
optdepends=('libpulse')
conflicts=('anydesk-test' 'anydesk-bin')
replaces=('anydesk')

source_i686=(https://download.anydesk.com/linux/${pkgname%-debian}_${pkgver}-1_i386.deb)
source_x86_64=(https://download.anydesk.com/linux/${pkgname%-debian}_${pkgver}-1_amd64.deb)
source=('anydesk.sh')

sha256sums_i686=('c1dd6d997c0ba6349bf0f8b42b1a87ffa3e81ee0096e4c4f274dd3246554aaf5')
sha256sums_x86_64=('5aa31948fb6f8d1590667ad4bb8630e730ac8728fe375d652bdb29a126e79924')
sha256sums=('3d62433bbcb7c25070ffa634fd98551e24472619ee9d223c5ca5ac242eb07f6f')

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
