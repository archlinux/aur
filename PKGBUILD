# Maintainer: X0rg

pkgname=manpages-fr-extra
pkgver=20151231
pkgrel=1
pkgdesc="Pages de manuel Linux francophones complementaires de 'Debian-l10n-French'"
arch=('any')
url="http://www.debian.org/international/french/"
license=('custom')
group=('manpagesfr')
optdepends=('man-pages-fr: pages de base')
provides=('man-pages-fr-extra')
options=(docs)
changelog=changelog
source=(http://ftp.fr.debian.org/debian/pool/main/m/"$pkgname"/"$pkgname"_"$pkgver"_all.deb)
md5sums=('a57b402486cd4f2b2970245e963e89c3')

prepare() {
	cd "$srcdir"

	msg2 "Supprime les fichiers inutiles..."
	rm -v control.tar.gz debian-binary

	msg2 "Décompresse l'archive contenant les données..."
	tar xJvf data.tar.xz
}

build() {
	cd "$srcdir/usr/share/man/fr"

	msg2 "Renomme les pages de manuel françaises complémentaires en conflit..."
	fichiersignores=$(pacman -Qql $pkgname 2> /dev/null | grep ".gz" | cut -d/ -f6-)
	for fichierteste in man*/*; do
		( [[ -f /usr/share/man/fr/$fichierteste ]] && ! echo $fichiersignores | grep -qF $fichierteste ) && \
		( mv -v $fichierteste $(echo $fichierteste | sed "s|\.|2.|") || return 1 )
	done

	true
}

package() {
	msg2 "Mise en place des pages de manuel francophones complémentaires..."
	mkdir -p "$pkgdir/usr/share/man"
	mv -v "$srcdir/usr/share/man" "$pkgdir/usr/share/"

	msg2 "Installe la licence..."
	install -Dvm644 "$srcdir/usr/share/doc/$pkgname/copyright" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
