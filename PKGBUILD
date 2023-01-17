# Maintainer: Shohei Maruyama <cheat.sc.linux@outlook.com>

pkgname='elm-git'
pkgver=0.18.0.r1814.g047d5026
pkgrel=2
pkgdesc='Compiler for Elm, a functional language for reliable webapps'
arch=('x86_64' 'aarch64')
url='https://github.com/elm/compiler'
license=('BSD')
source=("git+https://github.com/elm/compiler.git")
depends=(
	'ghc-libs'
	'haskell-file-embed'
	'haskell-filelock'
	'haskell-sha'
	'haskell-snap-server'
	'haskell-zip-archive'
	'haskell-raw-strings-qq'
	'haskell-language-glsl'
	'haskell-http'
	'haskell-ansi-wl-pprint'
	'haskell-http-client-tls'
	'haskell-edit-distance'
	'haskell-utf8-string'
)
makedepends=(
	'ghc'
	'uusi'
)
sha256sums=('SKIP')

pkgver() {
	cd compiler

	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd compiler

	gen-setup
	uusi -u HTTP -u ansi-terminal -u containers -u http-client -u network elm.cabal
}

build() {
	cd compiler

	runhaskell Setup configure -O --enable-shared --enable-executable-dynamic --disable-library-vanilla \
			--prefix=/usr --docdir=/usr/share/doc/$pkgname --datasubdir=$pkgname --disable-tests \
			--dynlibdir=/usr/lib --libsubdir=\$compiler/site-local/\$pkgid --ghc-option=-fllvm \
			--ghc-option=-optl-Wl\,-z\,relro\,-z\,now \
			--ghc-option='-pie'

	runhaskell Setup build ${MAKEFLAGS}
}

package() {
	cd compiler

	runhaskell Setup copy --destdir="${pkgdir}"
	install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
	rm -f "${pkgdir}/usr/share/doc/${pkgname}/LICENSE"
	rm -rf "${pkgdir}/usr/share/doc"
}
