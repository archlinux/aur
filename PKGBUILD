# Maintainer: Lukas Werling <lukas.werling@gmail.com>
pkgname=elm-platform
pkgver=0.16
pkgrel=1
pkgdesc="Bundle of all core development tools for the Elm language."
arch=('i686' 'x86_64')
url="http://elm-lang.org"
license=('BSD3')
depends=('ncurses' 'gmp' 'libffi' 'zlib')
makedepends=('ghc' 'cabal-install')
conflicts=('nodejs-elm')
source=(
  elm-compiler.zip::https://github.com/elm-lang/elm-compiler/archive/${pkgver}.zip
  elm-package.zip::https://github.com/elm-lang/elm-package/archive/${pkgver}.zip
  elm-make.zip::https://github.com/elm-lang/elm-make/archive/${pkgver}.zip
  elm-reactor.zip::https://github.com/elm-lang/elm-reactor/archive/${pkgver}.zip
  elm-repl.zip::https://github.com/elm-lang/elm-repl/archive/${pkgver}.zip
)
sha256sums=('debc956f37b6d886eecda78d4145a2033c96a27cc3e704cae4dbce7769422768'
            '9a55965c8cdfbecb62c71f2474a49f0f40b7f356cf5400aaee841fc88c161962'
            '78b2a31eb158b930fbce9a7723fb0f7cdc0bdff7d42f4a0db47fed2ebcc291f1'
            '0fd2e8357eb8757e9b889023b84223d0b1059ae5493c44f3a6597c132d1db41f'
            '930fc39b361675909f755ec1badfed451552c106ca0cc6a8778155569f1a5d4d')

prepare() {
  # Don't use cabal's path system for finding data files in elm-reactor as the
  # paths during build will differ from those during execution.
  cd "$srcdir/elm-reactor-$pkgver"
  sed -i 's#Reactor\.getDataFileName#(\\n -> return $ "/usr/share/elm-reactor/" ++ n)#' "backend/Utils.hs"
}

# This does not actually use the build script in the elm-lang/elm-platform
# repository, but the commands below are taken from there.
build() {
	cd "$srcdir"

  cabal update
  cabal sandbox init

  # Split because elm-reactor depends on elm-make to be built.
  repos1=(elm-compiler-$pkgver elm-make-$pkgver elm-package-$pkgver elm-repl-$pkgver)
  repos2=(elm-reactor-$pkgver)
  repos=("${repos1[@]}" "${repos2[@]}")

  cabal sandbox add-source ${repos[@]}
  cabal install -j --only-dependencies --ghc-options='-w' ${repos[@]}

  cabal install -j --ghc-options='-XFlexibleContexts' ${repos1[@]}
  PATH="$(pwd)/.cabal-sandbox/bin:$PATH" cabal install -j ${repos2[@]}
}

package() {
  cd "$srcdir"
	binpath=".cabal-sandbox/bin"

	install -Dm755 "$binpath/elm"         "$pkgdir/usr/bin/elm"
	install -Dm755 "$binpath/elm-make"    "$pkgdir/usr/bin/elm-make"
	install -Dm755 "$binpath/elm-package" "$pkgdir/usr/bin/elm-package"
	install -Dm755 "$binpath/elm-reactor" "$pkgdir/usr/bin/elm-reactor"
	install -Dm755 "$binpath/elm-repl"    "$pkgdir/usr/bin/elm-repl"

	install -d -m755 "$pkgdir/usr/share/elm-reactor"
  cp -r -t "$pkgdir/usr/share/elm-reactor" elm-reactor-$pkgver/assets/*

  install -Dm644 "elm-compiler-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/elm-platform/LICENSE"
}

# vim:set ts=2 sw=2 et:
