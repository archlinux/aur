# Maintainer: X0rg

pkgname=man-pages-fr
pkgver=3.70
pkgrel=2
pkgdesc="Pages de manuel Linux francophones de 'Traduc.org'"
arch=('any')
url="http://traduc.org/perkamon/"
license=('custom')
group=('manpagesfr')
optdepends=('manpages-fr-extra: pages complémentaires')
options=(docs)
install=$pkgname.install
source=(http://perkamon.alioth.debian.org/archives/$pkgver/$pkgname-$pkgver-1.tar.xz)
md5sums=('66a6033fb2ed3641c35b1d53c0fe5deb')

prepare() {
	mv -v "$srcdir/fr/README.fr" "$srcdir"
}

build() {
	cd "$srcdir/fr"

	msg2 "Renomme les pages de manuel françaises en conflit..."
	fichiersignores=$(pacman -Qql $pkgname 2> /dev/null | grep ".gz" | cut -d/ -f6-)
	for fichierteste in man*/*; do
		( [[ -f /usr/share/man/fr/$fichierteste.gz ]] && ! echo $fichiersignores | grep -qF $fichierteste ) && \
		( mv -v $fichierteste $(echo $fichierteste | sed "s|\.|2.|") || return 1 )
	done

	true
}

package() {
	msg2 "Mise en place des pages de manuel francophones..."
	mkdir -p "$pkgdir/usr/share/man/"
	mv -v "$srcdir/fr" "$pkgdir/usr/share/man/"

	msg2 "Installe la licence..."
	install -Dvm644 "$srcdir/README.fr" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
