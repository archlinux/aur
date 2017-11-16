# Maintainer: Lucki <Lucki at holarse-linuxgaming dot de>

pkgname=yaup-git
pkgver=0.1.r1.g6543845
pkgrel=3
pkgdesc="Yet Another UPnP Portmapper - A GTK frontend for miniupnpc"
arch=('i686' 'x86_64')
url="https://github.com/Holarse-Linuxgaming/yaup"
license=('GPL3')
changelog=.CHANGELOG
depends=('miniupnpc' 'gtk3')
makedepends=('git' 'gendesk' 'intltool' 'libtool')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(${pkgname%-git}::git+https://github.com/Holarse-Linuxgaming/yaup.git)
sha512sums=('SKIP')

pkgver()
{
	cd "${srcdir}/${pkgname%-git}"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare()
{
	cd "${srcdir}"
	# generate .desktop-file
	gendesk -n -f --categories "Network;Utility;GTK"

	# update .CHANGELOG
	git -C ${srcdir}/${pkgname%-git} log --graph -10 > ${startdir}/.CHANGELOG
}

build()
{
	cd "${srcdir}/${pkgname%-git}"
	./autogen.sh --prefix=/usr
	make
}

package()
{
	cd "${srcdir}/${pkgname%-git}"
	make DESTDIR="${pkgdir}" install

	install -Dm644 "${srcdir}/${pkgname%-git}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-git}.desktop"
	install -Dm644 "${srcdir}/${pkgname%-git}/src/${pkgname%-git}-dark.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${pkgname%-git}.png"
}
