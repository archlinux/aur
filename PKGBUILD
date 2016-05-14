# Maintainer:  Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: csllbr
# Contributor: Cheer Xiao <xiaqqaix AT gmail DOT com>
# Contributor: Leo Scherer <aur AT leo-scherer DOT de>
# Contributor: Niklas Schmuecker (IRC: nisc) <nschmuecker (gmail)>

pkgname=brightd
pkgver=0.4_beta4
pkgrel=5
pkgdesc='Automatically dims screen when there is no user input (like a macbook :-).'
arch=('i686' 'x86_64')
license=('GPL2')
url='http://www.pberndt.com/Programme/Linux/brightd/'
depends=('libxss')
install="${pkgname}.install"
source=("http://www.pberndt.com/raw/Programme/Linux/brightd/_download/$pkgname-$pkgver.tar.bz2"
        'brightd.service'
        'proposal.patch'
        'makefile.patch')

md5sums=('31e455ea3f06da55a4c4d89da2bb6e2e'
         'f5d5c7ed5c48d2dbe408986d5f6249fb'
         '1fead7c648d3939970e7e62b21146734'
         '0875c269556e2cee2151a5dc95fe14e3')

build() {
    cd "${srcdir}/$pkgname-$pkgver"

    # fixes AC-detection by moving to /sys, blocks intel_backlight
    # and makes fade smoother
    patch -p1 -i ${srcdir}/proposal.patch

    # fixes install process
    patch -p1 -i ${srcdir}/makefile.patch

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
