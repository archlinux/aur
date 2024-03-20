# Maintainer: xiretza <xiretza+aur@xiretza.xyz>
pkgname=shelltestrunner
pkgver=1.10
pkgrel=2
pkgdesc="Easy, repeatable testing of CLI programs/commands"
arch=(x86_64)
url="https://github.com/simonmichael/shelltestrunner"
license=('GPL')
depends=(ghc-libs haskell-cmdargs haskell-diff haskell-filemanip haskell-hunit
         haskell-pretty-show haskell-regex-tdfa haskell-safe haskell-test-framework
		 haskell-test-framework-hunit haskell-utf8-string
		 haskell-hspec haskell-hspec-core haskell-hspec-contrib
		)
makedepends=(ghc)
checkdepends=()
optdepends=()
source=("https://hackage.haskell.org/packages/archive/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('07bd3365fbbde9b4c80a3139792c30c1b1929736175fc207b4af1285bb97cbb0')

prepare() {
	cd "$pkgname-$pkgver"
}

build() {
	cd "$pkgname-$pkgver"

	runhaskell Setup configure -O --enable-shared --enable-executable-dynamic --disable-library-vanilla \
		--prefix=/usr --docdir="/usr/share/doc/$pkgname" --datasubdir="$pkgname" --enable-tests \
		--dynlibdir=/usr/lib --libsubdir=\$compiler/site-local/\$pkgid \
		--ghc-option=-optl-Wl\,-z\,relro\,-z\,now \
		--ghc-option='-pie'

	runhaskell Setup build
}

check() {
	cd "$pkgname-$pkgver"
	runhaskell Setup test
}

package() {
	cd "$pkgname-$pkgver"
	runhaskell Setup copy --destdir="$pkgdir"
	install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	rm -f "$pkgdir/usr/share/doc/$pkgname/LICENSE"
	# there are no docs
	rmdir "$pkgdir/usr/share/doc/$pkgname"
	rmdir "$pkgdir/usr/share/doc"
}
