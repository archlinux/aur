# Contributor: pressh <pressh funnysymbol gmail dot com>
# Contributor: Eric Belanger <belanger@astro.umontreal.ca>
# Contributor: shaun lastra <badicalia@gmail.com>
# Maintainer: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=gcolor2
pkgver=0.4
pkgrel=9
pkgdesc="A simple GTK+2 color selector"
arch=('x86_64')
url="http://gcolor2.sf.net/"
license=('GPL')
depends=('gtk2')
makedepends=('perl-xml-parser')
source=("https://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz" \
        gcolor2-0.4-amd64.patch gcolor2.desktop)
md5sums=('02de9d925ad5921522685f402caec3ec'
         '5791378f6f86dd25a302ad8586292dd6'
         '1bbc11865df2a0529757cdbdf806b079')

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	[ "$CARCH" == "x86_64" ] && (patch -p1 < ../gcolor2-0.4-amd64.patch)

	# fix fs#25904
	sed -i 's/\[:space:\]/[&]/g' configure
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	CFLAGS+=' -fcommon' # https://wiki.gentoo.org/wiki/Gcc_10_porting_notes/fno_common
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	make DESTDIR="${pkgdir}" install

	# install desktop file
	install -Dm644 "${srcdir}/gcolor2.desktop" \
		"${pkgdir}/usr/share/applications/gcolor2.desktop"
}
