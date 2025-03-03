# Maintainer: pezcurrel <pezcurrel [at] insicuri.net>
# Contributor: Thomas Karmann <thomas [at] krmnn.de>

pkgname=xzoom
pkgver=0.3
pkgrel=10
pkgdesc='A screen magnifier'
arch=('x86_64')
url='https://www.ibiblio.org/pub/linux/libs/X/'
license=('GPL-2.0-or-later')
depends=('glibc' 'libx11' 'libxt' 'libxext')
makedepends=('imake')
source=(
	'https://www.ibiblio.org/pub/linux/libs/X/xzoom-0.3.tgz'
	'xzoom.diff'
	'xzoom.desktop'
	'xzoom.svg'
)
md5sums=(
	'c6ecc5fade34cf46cbe8c00b93d7ac78'
	'0de8aa268abad0db2d562ebd491da010'
	'78d5b562a9115faef9c5bc19c55bd937'
	'8905ff0ee0f46afcf49816cb7b2d6cac'
)

build() {
	cd "${pkgname}-${pkgver}"
	patch -Np1 < "${srcdir}/xzoom.diff"
	xmkmf
	sed -i "s/-O2/$(sed -e 's/\//\\\//g' <<<"${CFLAGS}") -Wl,-z,relro,-z,now/" ./Makefile
	make
}

package() {
	make -C "${pkgname}-${pkgver}" DESTDIR="${pkgdir}" install install.man
	mkdir "${pkgdir}/usr/share/applications" "${pkgdir}/usr/share/icons"
	cp xzoom.desktop "${pkgdir}/usr/share/applications"
	cp xzoom.svg "${pkgdir}/usr/share/icons"
}
