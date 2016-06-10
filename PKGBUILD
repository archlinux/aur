# Maintainer: Lukas Werling <lukas.werling@gmail.com>
pkgname=elm-platform
pkgver=0.17
pkgrel=2
pkgdesc="Bundle of all core development tools for the Elm language."
arch=('i686' 'x86_64')
url="http://elm-lang.org"
license=('BSD3')
depends=('ncurses' 'gmp' 'libffi' 'zlib')
makedepends=('ghc' 'cabal-install')
conflicts=('nodejs-elm')
source=(
  elm-compiler-${pkgver}.zip::https://github.com/elm-lang/elm-compiler/archive/${pkgver}.zip
  elm-package-${pkgver}.zip::https://github.com/elm-lang/elm-package/archive/${pkgver}.zip
  elm-make-${pkgver}.zip::https://github.com/elm-lang/elm-make/archive/${pkgver}.zip
  elm-reactor-${pkgver}.zip::https://github.com/elm-lang/elm-reactor/archive/${pkgver}.zip
  elm-repl-${pkgver}.zip::https://github.com/elm-lang/elm-repl/archive/${pkgver}.zip
)
sha256sums=('1dc1a5fa5cd09936dee8fbba1f0197527bb988b2cc045919ce6bbb9a6706e122'
            'dc474d7192ecb440db279e142d0d1605bf8fc76ff0328088f8d931780b4c4f5c'
            '041c37f908272ac1e17c8aeaf09aac1e08404e8511ea7edb69c7899bd1291731'
            'f03b07018eb3c3c4cc4c8f311b8f33572371e20ae51f4eb4fb5247d98e5f51dc'
            'e4c7fa471cfc1b7fc37e38a4cdaffe90b3f06c5f52fc20e6e8167eb1ef8defe6')

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

  cabal install -j ${repos1[@]}
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

  install -Dm644 "elm-compiler-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/elm-platform/LICENSE"
}

# vim:set ts=2 sw=2 et:
