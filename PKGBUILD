# Maintainer: MithicSpirit <rpc01234 at gmail dot com>

pkgname=greenclip
pkgver=4.1.0
pkgrel=2
pkgdesc='[Unofficial Package] Simple clipboard manager to be integrated with rofi'
url='https://github.com/erebe/greenclip#readme'
license=('BSD')
arch=('x86_64')
depends=('ghc-libs' 'haskell-x11' 'haskell-hashable' 'haskell-microlens' 'haskell-microlens-mtl' 'haskell-protolude' 'haskell-tomland' 'haskell-vector' 'haskell-wordexp')
conflicts=('rofi-greenclip')
provides=('rofi-greenclip')
makedepends=('ghc')
source=("$pkgname-$pkgver.tar.gz::https://hackage.haskell.org/packages/archive/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('c41a4b6f17d250ec9bfe811d233701490d4efefd9cca3534a52e02379673a2fc')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
	printf "import Distribution.Simple\nmain = defaultMain" >>Setup.hs
}

build() {
	cd "$srcdir/$pkgname-$pkgver"

	runhaskell Setup configure -O --enable-shared --enable-executable-dynamic --disable-library-vanilla \
		--prefix=/usr --docdir=/usr/share/doc/$pkgname --datasubdir=$pkgname --enable-tests \
		--dynlibdir=/usr/lib --libsubdir=\$compiler/site-local/\$pkgid \
		--ghc-option=-optl-Wl\,-z\,relro\,-z\,now \
		--ghc-option='-pie'

	runhaskell Setup build
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	runhaskell Setup copy --destdir="$pkgdir"
	install -D -m644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
	rm -f "$pkgdir"/usr/share/doc/$pkgname/LICENSE
}
