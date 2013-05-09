_hkgname=mbox-tools
pkgname=$_hkgname
pkgver=0.2.0.4
pkgrel=5
pkgdesc="A collection of tools to process mbox files"
arch=('i686' 'x86_64')
url="http://hackage.haskell.org/package/$_hkgname"
license=('BSD3')
makedepends=("ghc")
depends=("ghc" "haskell-codec-mbox" "haskell-fclabels>=1.0" "haskell-hsemail" "haskell-mtl" "haskell-parsec" "haskell-puremd5" "haskell-random")
options=('strip')
install=install
source=("http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")
sha256sums=("7053c190f5bf46365530df916f780ddb8bd6f497868fc69ec07dbda94fa20dc8")

build() {
	cd "$srcdir/$_hkgname-$pkgver"

	runhaskell Setup configure -O ${PKGBUILD_HASKELL_ENABLE_PROFILING:+-p } --enable-split-objs --enable-shared \
		--prefix=/usr --docdir="/usr/share/doc/$pkgname" \
		--libsubdir=\$compiler/site-local/\$pkgid
	runhaskell Setup build
	runhaskell Setup haddock
	runhaskell Setup register   --gen-script
	runhaskell Setup unregister --gen-script
	sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
}

package() {
	cd "$srcdir/$_hkgname-$pkgver"

	install -D -m744 register.sh   "$pkgdir/usr/share/haskell/$pkgname/register.sh"
	install	   -m744 unregister.sh "$pkgdir/usr/share/haskell/$pkgname/unregister.sh"
	install -d -m755 "$pkgdir/usr/share/doc/ghc/html/libraries"
	ln -s "/usr/share/doc/$pkgname/html" "$pkgdir/usr/share/doc/ghc/html/libraries/$_hkgname"
	runhaskell Setup copy --destdir="$pkgdir"
}
