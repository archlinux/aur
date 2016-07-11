# Maintainer: Lukas Werling <lukas.werling@gmail.com>
pkgname=elm-platform
pkgver=0.17.1
pkgrel=1
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
sha256sums=('3daed1d5099e539945ed2c92cc37c46efed48b32e0adeb37e81788bf400dbd98'
            'fbf34165dc22c1cc8b39750900d6c8644e7d7916377fffb6ddc2ea2eef263637'
            'b948c211e893003e5d55f9ecb2fee8bb44b8d3e04bf778764952d8fd908766b3'
            'b82e9e3220c5edc85321c0d9e524c237e4f2bed61b746e6bfb95af1fb1a53daa'
            '4f32cd19ae6e85a56703723eb5ba23012109c1571e59c37465eddcfe92d8734b')

prepare() {
  cd "$srcdir"

  # This is currently necessary to build with GHC 8, see https://github.com/elm-lang/elm-compiler/issues/1397
  echo 'allow-newer: aeson,base,HTTP,time,transformers' > cabal.config
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
