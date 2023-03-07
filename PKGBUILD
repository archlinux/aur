# Maintainer: MithicSpirit <rpc01234 at gmail dot com>

_pkgname=wordexp
pkgname="haskell-$_pkgname"
pkgver=0.2.2
pkgrel=2
pkgdesc='wordexp(3) wrappers'
url='https://github.com/supki/wordexp'
license=('BSD')
arch=('x86_64')
depends=('ghc-libs' 'haskell-semigroups')
makedepends=('ghc' 'c2hs')
source=("$_pkgname-$pkgver.tar.gz::https://hackage.haskell.org/packages/archive/$_pkgname/$pkgver/$_pkgname-$pkgver.tar.gz")
sha256sums=('64fdc6676c4fca51334ada49fe49bf6e11477c93801bc357640d7c9910ce6cd5')

build() {
	cd "$srcdir/$_pkgname-$pkgver"

	runhaskell Setup configure -O --enable-shared --enable-executable-dynamic --disable-library-vanilla \
		--prefix=/usr --docdir=/usr/share/doc/$pkgname --datasubdir=$pkgname --enable-tests \
		--dynlibdir=/usr/lib --libsubdir=\$compiler/site-local/\$pkgid \
		--ghc-option=-optl-Wl\,-z\,relro\,-z\,now \
		--ghc-option='-pie'

	runhaskell Setup build
	runhaskell Setup register --gen-script
	runhaskell Setup unregister --gen-script
	sed -i -r -e "s|ghc-pkg.*update[^ ]* |&'--force' |" register.sh
	sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
}

package() {
	cd "$srcdir/$_pkgname-$pkgver"

	install -D -m744 register.sh "$pkgdir"/usr/share/haskell/register/$pkgname.sh
	install -D -m744 unregister.sh "$pkgdir"/usr/share/haskell/unregister/$pkgname.sh
	runhaskell Setup copy --destdir="$pkgdir"
	install -D -m644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
	rm -f "$pkgdir"/usr/share/doc/$pkgname/LICENSE
}
