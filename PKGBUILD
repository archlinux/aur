# Maintainer: Lucki <Lucki at holarse-linuxgaming dot de>

pkgname=yaup-git
_pkgname=yaup

pkgver=0.1.r1.g6543845
pkgrel=2
pkgdesc="Yet Another UPnP Portmapper - A GTK frontend for miniupnpc"
arch=('i686' 'x86_64')
url="https://github.com/Holarse-Linuxgaming/yaup"
license=('GPL3')
changelog=.CHANGELOG
depends=('miniupnpc' 'gtk3')
makedepends=('git')
provides=('yaup')
source=(${pkgname}::git+https://github.com/Holarse-Linuxgaming/yaup.git)
sha512sums=('SKIP')

pkgver()
{
	cd "$srcdir/$pkgname"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare()
{
	# generate .desktop-file
	gendesk -n -f --categories "Game"

	# update .CHANGELOG
	git -C ${srcdir}/${pkgname} log --graph -10 > ${startdir}/.CHANGELOG
}

build()
{
	cd "$srcdir/$pkgname"
	./configure --prefix=/usr
	make
}

package()
{
	cd "$srcdir/$pkgname"
	make DESTDIR="$pkgdir" install

	install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
	install -Dm644 "${srcdir}/${pkgname}/src/${_pkgname}-dark.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
}
