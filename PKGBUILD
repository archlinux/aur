# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-foreigners
pkgver=1.4.1
pkgrel=1
pkgdesc="Chicken Scheme Egg: Foreign helper macros for Chicken 4"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/foreigners"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-matchable' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=foreigners&version=$pkgver"
		"$pkgname-$pkgver.html::http://wiki.call-cc.org/eggref/4/foreigners.html")
md5sums=('5e7027cadfdba6af5607ae7e6d966a81'
         '4df43c333846583c39e63c47f594cad7')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "foreigners-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "foreigners-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "foreigners-$pkgver/$fname"
		else
			dd iflag=fullblock of="foreigners-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
}

package() {
	cd "$srcdir/foreigners-$pkgver"
	cp ../$pkgname-$pkgver.html foreigners.html


	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/foreigners"

	chicken-install -p "$pkgdir/usr"

		install -Dm644 "foreigners.html" "$pkgdir/usr/share/doc/$pkgname/foreigners.html"
}
