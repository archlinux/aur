# Maintainer: MithicSpirit <rpc01234 at gmail dot com>

pkgname=greenclip
pkgver=4.3.0
pkgrel=1
pkgdesc='[Unofficial Package] Simple clipboard manager to be integrated with rofi'
url='https://github.com/erebe/greenclip'
license=('BSD')
arch=('x86_64')
depends=('ghc-libs' 'haskell-x11' 'haskell-hashable' 'haskell-microlens' 'haskell-microlens-mtl' 'haskell-protolude' 'haskell-tomland' 'haskell-vector' 'haskell-wordexp' 'haskell-base16-bytestring' 'haskell-cryptohash-md5')
conflicts=('rofi-greenclip')
provides=('rofi-greenclip')
makedepends=('ghc')
source=("$pkgname-$pkgver.tar.gz::https://hackage.haskell.org/packages/archive/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('8de8b390b2e6401fd0253115d6c6193866f42125832943ec0a12acd2a5b6e1d4c11343b3139b18bda8227097adc296347513a166f7d9cc76fa6b56e609b837f9')

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
