# Developer: Amamiya Shinki <jingtian30000@gmail.com>
# Maintainer: Dustin Van Tate Testa <toast27@gmail.com>

pkgname=marisahttpd-git
pkgver=0.4.r35.g45274d1 # calls `pkgver()` to replace this number (ver from git)
pkgrel=1
license=('GPL')
pkgdesc="High-effiency dynamic webpage server and runtime for C/C++"
url="https://github.com/AmamiyaRinyuki/MarisaHttpd"

arch=('any')

makedepends=('git' 'libmicrohttpd')

provides=("marisa" "libkirisame.so" "marisa-logview")

source=("$pkgname::git+https://github.com/AmamiyaRinyuki/MarisaHttpd")

md5sums=('SKIP')

pkgver() {
	cd $pkgname
	git describe --tags --long | sed -r -e 's,^[^0-9]*,,;s,([^-]*-g),r\1,;s,[-_],.,g'
}

package() {
	cd $pkgname

	mkdir $pkgdir/usr/
	mkdir $pkgdir/usr/bin/
	mkdir $pkgdir/usr/lib/

	gcc -shared -fpic -Ofast kirisame.c src/libs/*.c -Ilibs -o $pkgdir/lib/libkirisame.so
	gcc -Ofast src/marisa.c src/grimoire.c src/magicshop.c srd/kirisame.c -ldl -lm -lpthread -lmicrohttpd -o $pkgdir/usr/bin/marisa
	gcc -Ofast src/logview.c -o $pkgdir/usr/bin/marisa-logview

	install -D -m644 LICENSE $pkgdir/usr/share/licenses/${pkgname}/LICENSE

}
