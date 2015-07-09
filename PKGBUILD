# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-dbus
pkgver=0.93
pkgrel=1
pkgdesc="Chicken Scheme Egg: A binding for libdbus, the IPC mechanism"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/dbus"
license=('MIT')
depends=('chicken>=4.5.0' 'chicken-easyffi' 'chicken-matchable' 'chicken-miscmacros' 'chicken-foreigners' 'dbus-core')
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=dbus&version=$pkgver"
		"$pkgname-$pkgver.html::http://wiki.call-cc.org/eggref/4/dbus.html"
        "dbus.patch")
md5sums=('891f74b8231f0d655297444e140f5e4f'
         '503a55be746bee8815a95f8ff07bef97'
         '3abccbef575aa13ac1b3cbaefee12ff1')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "dbus-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "dbus-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "dbus-$pkgver/$fname"
		else
			dd iflag=fullblock of="dbus-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done

    patch "dbus-${pkgver}/dbus.scm" dbus.patch
}

package () {
	cd "$srcdir/dbus-$pkgver"
	cp ../$pkgname-$pkgver.html dbus.html


	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/dbus"

	chicken-install -p "$pkgdir/usr"

		install -Dm644 "dbus.html" "$pkgdir/usr/share/doc/$pkgname/dbus.html"
}
