# Maintainer: Oliver Jaksch <arch-aur@com-in.de>

pkgname=anydesk-test
pkgver=5.1.1
pkgrel=1
pkgdesc="'AnyDesk Free' is an All-In-One Software for Remote Support - Playground-Version"
arch=('i686' 'x86_64')
url="https://anydesk.de"
license=('custom:Freeware')
depends=('fakeroot' 'gtkglext' 'libglvnd' 'gtk2' 'libx11' 'glibc' 'glib2' 'gdk-pixbuf2' 'libxcb' 'cairo' 'pango' 'libxi' 'libxrandr' 'libxtst' 'libxext' 'libxfixes' 'libxdamage' 'gcc-libs')
optdepends=('libpulse')
conflicts=('anydesk')

source_i686=("http://download.anydesk.com/linux/anydesk_${pkgver}-1_i386.deb" "https://download.anydesk.com/linux/anydesk-${pkgver}-i686.tar.gz")
source_x86_64=("http://download.anydesk.com/linux/anydesk_${pkgver}-1_amd64.deb" "https://download.anydesk.com/linux/anydesk-${pkgver}-amd64.tar.gz")

sha256sums_i686=('527a94cfc4b0d80316591124182a9b353d6f3bb558cc2e92d915994a1b395694' '87d9a4ccfa6e46c7174e943453fc97418c73b6b8255631f36e9def3bc3fe6b82')
sha256sums_x86_64=('7b90303a65c33f1aa9744626662da9f00c373df1b617603aa1a070a3252c540a' 'cb72b79ac1476bfb295f3e27d2127d4868107e324f6473b089b448c7f3df55a4')

package() {
    cd "${pkgdir}"
    tar xf "${srcdir}/data.tar.gz"
    install -m755 "${srcdir}/anydesk-${pkgver}/anydesk" "${pkgdir}/usr/bin/anydesk"
    #
    # temporary fix for wrong permissions on subdirs:
    find "${pkgdir}" -type d -exec chmod 755 {} \;
    #
    msg2 "\e[1;32mAnyDesk now has a systemd file for unattendant access: anydesk.service \e[0m"
    install -D -m 644 "${pkgdir}/usr/share/anydesk/files/systemd/anydesk.service" "${pkgdir}/usr/lib/systemd/system/anydesk.service"
    sed -i "s/PIDFile=\/tm\/ad.pid/PIDFile=\/run\/anydesk.pid/" "${pkgdir}/usr/lib/systemd/system/anydesk.service"
}
