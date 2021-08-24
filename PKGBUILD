# Maintainer: Thor M. K. Høgås <thor alfakrøll roht dott no>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: AndreasBWagner <AndreasBWagner@pointfree.net>
# Contributor: Mark Taylor <skymt0@gmail.com>

pkgname=programmers-dvorak
pkgver=1.2.1
_pkgver=${pkgver//./_}
pkgrel=1
pkgdesc='Variant of the Dvorak keyboard layout designed for programmers'
arch=(any)
url=http://www.kaufmann.no/roland/dvorak/
license=(custom)
install=programmers-dvorak.install
depends=(libxslt)
source=("http://www.kaufmann.no/downloads/linux/kbddvp-$_pkgver-src-linux.tgz"
        "http://www.kaufmann.no/downloads/linux/dvp-$_pkgver.map.gz"
        "$url/license.html")
noextract=("${source[1]##*/}")
sha256sums=('0f56b55432d63a6d81c08ff5f722cf48c6d9a15c34c304f594d02eb2223fc4fa'
            '0e859211cfe16a18a3b9cbf2ca3e280a23a79b4e40b60d8d01d0fde7336b6d50'
            '19185beec2780c609495676bc3c77db7ffe14c6a9aa4b7a8c3670982d2f7f2f5')

prepare() {
	cd "kbddvp-${pkgver%.*}"
	# Upstream install script makes too many assumptions about the host system:
	# directories existing, being root, etc. We'll make our own way...
	rm dvp.install.sh
}

package() {
	cd "kbddvp-${pkgver%.*}"
	install -Dm0755 -t "$pkgdir/usr/share/$pkgname/" dvp.*.sh
	install -Dm0644 "../${source[1]##*/}" "$pkgdir/usr/share/kbd/keymaps/i386/dvorak/dvp.map.gz"
	# Adapt relevant system installation bits from dvp.install.sh...
	for f in dvp hex atm 102 ops semi; do
		install -Dm0644 "$f.xkb" "$pkgdir/usr/share/X11/xkb/symbols/$f"
	done
	install -Dm0644 shift3.xkb "$pkgdir/usr/share/X11/xkb/types/shift3"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" "../license.html"
}
