# Maintainer:  Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: csllbr
# Contributor: Cheer Xiao <xiaqqaix AT gmail DOT com>
# Contributor: Leo Scherer <aur AT leo-scherer DOT de>
# Contributor: Niklas Schmuecker (IRC: nisc) <nschmuecker (gmail)>

pkgname=brightd
pkgver=0.4.1
pkgrel=1
pkgdesc='Automatically dims screen when there is no user input (like a macbook :-).'
arch=('i686' 'x86_64')
license=('GPL2')
url='http://www.pberndt.com/Programme/Linux/brightd/'
depends=('libxss')
install="${pkgname}.install"
source=("http://www.pberndt.com/raw/Programme/Linux/brightd/_download/$pkgname-$pkgver.tar.bz2"
        'brightd.service'
        'proposal.patch')
md5sums=('42f1572c51162bf583d6436c3b36cc17'
         'f5d5c7ed5c48d2dbe408986d5f6249fb'
         '1fead7c648d3939970e7e62b21146734')

build() {
    cd "${srcdir}/$pkgname-$pkgver"

    # fixes AC-detection by moving to /sys, blocks intel_backlight
    # and makes fade smoother
    patch -p1 -i ${srcdir}/proposal.patch

    make
}

package() {
    cd "${srcdir}/$pkgname-$pkgver"
    make DESTDIR=${pkgdir} install
    install -Dsm755 "${srcdir}/$pkgname-$pkgver/brightd"   "${pkgdir}/usr/bin/brightd"
    install -Dm644  "${srcdir}/$pkgname-$pkgver/brightd.1" "${pkgdir}/usr/share/man/man1/brightd.1"
    install -Dm644  "${srcdir}/$pkgname-$pkgver/README"    "${pkgdir}/usr/share/doc/brightd/README"
    install -Dm644  "${srcdir}/$pkgname-$pkgver/gpl.txt"    "${pkgdir}/usr/share/licenses/brightd/LICENSE"
    install -Dm644  "${srcdir}/brightd.service"            "${pkgdir}/usr/lib/systemd/system/brightd.service"
}
