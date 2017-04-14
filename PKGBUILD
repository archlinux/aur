# Maintainer: Bennett Piater <bennett at piater dot name>

pkgname=(aursec aursec-tui)
pkgver=0.10.1
pkgrel=1
pkgdesc='Verify AUR package sources against hashes stored in a blockchain.'
arch=(any)
url="https://github.com/clawoflight/$pkgname"
license=('custom:MPL2')

depends=(bc firejail geth vim)
makedepends=(pandoc)
checkdepends=(shellcheck)
#optdepends=()

#changelog="CHANGELOG"
source=(https://github.com/clawoflight/aursec/releases/download/v$pkgver/$pkgname-v$pkgver.tar.gz{,.asc})
sha512sums=('2668c0d67a0fbb611241b4a3b50c64b8b1056bf8e4544103726d942a0864e069586025d8b22d4c23fc4a1f3f971fa9bfb4d59f52744f31a11378d4a9344b9e14'
            'SKIP')
validpgpkeys=('871F10477DB3DDED5FC447B226C7E577EF967808'
              'EF685CFEA6460909C7E1EE70A3BD44B344AAE1FD')

build() {
	cd "$srcdir/$pkgname-$pkgver/aursec"
	make
	cd "$srcdir/$pkgname-$pkgver/tui"
	make
}

check() {
	cd "$srcdir/$pkgname-$pkgver/aursec"
	make -k check
}

package_aursec() {
	install=aursec.install
	optdepends=("aursec-tui: to manually inspect the blockchain.")

	cd "$srcdir/$pkgname-$pkgver/aursec"
	make PREFIX="/usr" DESTDIR="$pkgdir/" install
 }

package_aursec-tui() {
	pkgdesc='Inspect the aursec blockchain'
	depends=(python python-urwid aursec)

	cd "$srcdir/aursec-$pkgver/tui"
	make PREFIX="/usr" DESTDIR="$pkgdir/" install
}
