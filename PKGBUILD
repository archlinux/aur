# Maintainer: Bennett Piater <bennett at piater dot name>

pkgname=(aursec aursec-tui)
pkgver=0.12
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
sha512sums=('c33fd9d9691fb93edccb9c917a86d33ce6717acd8f68310c51cdc2138549383e831165818495e113777b08a79ec7277fc5ddad11d7c381b541f0773131002739'
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
	depends=(python python-urwid python-requests aursec)

	cd "$srcdir/aursec-$pkgver/tui"
	make PREFIX="/usr" DESTDIR="$pkgdir/" install
}
