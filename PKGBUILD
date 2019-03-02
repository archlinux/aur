# Maintainer: ValHue <vhuelamo at gmail dot com>
#
# Contributor: Steven Honeyman <stevenhoneyman at gmail dot com>
# Contributor: yugrotavele <yugrotavele at archlinux dot us>
# Contributor: Roman Kyrylych <roman at archlinux dot org>
# Contributor: Mateusz Herych <heniekk at gmail dot com>
# Contributor: Mefju <mefju at o2 dot pl>
#
pkgname=isomaster
pkgver=1.3.14
pkgrel=1
pkgdesc="CD image editor written in GTK2"
arch=('i686' 'x86_64')
url="http://littlesvr.ca/isomaster"
license=('GPL2')
depends=('gtk2' 'desktop-file-utils')
source=("${pkgname}-${pkgver}.tar.bz2::${url}/releases/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('8c8aa009277770741cafe41848c0da07057d0bc75d8617243df284e46465df6d')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    sed -i 's/^#WITHOUT_NLS/WITHOUT_NLS/' Makefile
    sed -i 's/mousepad/leafpad/' Makefile
    sed -i 's/m 644/Dm 644/' Makefile

    ## uncomment to disable the messagebox when last used dir is missing ##
    #sed -i 's/if(newDir == NULL)/& return false; if (1==2)/' fsbrowser.c
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
   	for n in ./po/*.po; do
		msgfmt $n -o ./po/`basename $n .po`.mo
	done

    make PREFIX=/usr
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
	install -d ${pkgdir}/usr/share/locale
	for n in ./po/*.mo; do
		install -p -D -m644 $n ${pkgdir}/usr/share/locale/`basename $n .mo`/LC_MESSAGES/${pkgname}.mo
	done
    make PREFIX=/usr DESTDIR="${pkgdir}" install

    install -D -m644 LICENCE.TXT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: set ts=4 sw=4 et syn=sh ft=sh:
