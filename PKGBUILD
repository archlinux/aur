# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: kodemeister <kodemeister@outlook.com>

pkgname=ghcid
pkgver=0.8.9
pkgrel=2
pkgdesc='GHCi based bare bones IDE'
arch=(x86_64)
url="https://github.com/ndmitchell/$pkgname"
license=(BSD-3-Clause)
depends=(ghc-libs
         haskell-ansi-terminal
         haskell-cmdargs
         haskell-extra
         haskell-fsnotify
         haskell-terminal-size)
makedepends=(ghc
             haskell-tasty
             haskell-tasty-hunit)
_archive="$pkgname-$pkgver"
source=("https://hackage.haskell.org/packages/archive/$pkgname/$pkgver/$_archive.tar.gz")
sha512sums=('25082de985f29430dc7d4577a7a9e0c5ff2dc78ae229f5c6728d19f573dc05b3d88400de7afaa7588cf11e11b341453a23fbeccf7f3c75130741b0078621d1eb')

build() {
	cd "$_archive"
	/usr/bin/runhaskell Setup configure -w /usr/bin/ghc -O --enable-shared --enable-executable-dynamic --disable-library-vanilla \
		--prefix=/usr --docdir=/usr/share/doc/$pkgname --enable-tests \
		--dynlibdir=/usr/lib --libsubdir=\$compiler/site-local/\$pkgid \
		--ghc-option=-optl-Wl\,-z\,relro\,-z\,now \
		--ghc-option=-pie
	/usr/bin/runhaskell Setup build $MAKEFLAGS
	/usr/bin/runhaskell Setup register --gen-script
	/usr/bin/runhaskell Setup unregister --gen-script
	sed -i -r -e "s|ghc-pkg.*update[^ ]* |&'--force' |" register.sh
	sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
}

check() {
	cd "$_archive"
	/usr/bin/runhaskell Setup test
}

package() {
	cd "$_archive"
	install -Dm0744 register.sh "$pkgdir/usr/share/haskell/register/$pkgname.sh"
	install -Dm0744 unregister.sh "$pkgdir/usr/share/haskell/unregister/$pkgname.sh"
	/usr/bin/runhaskell Setup copy --destdir="$pkgdir"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
	rm -f "$pkgdir/usr/share/doc/$pkgname/LICENSE"
}
