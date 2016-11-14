# Maintainer: Lukas Werling <lukas.werling@gmail.com>
pkgname=elm-platform
pkgver=0.18.0
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
sha256sums=('879a030cc750964bdfc821b6927edba94e8ade650b63c95478270287c040a372'
            'a93a2777ee4488510c6e5f82fc7bd7299cbeed7e04004e833d5a8d6f43db44c8'
            'dcd254ba3c30848bc3527fcab197f8608bc913ae0bee17f67cf97ebf7977dfa6'
            '6c5525b2dd35ab6ccf6c5f7e6568bd0164711b8932e80f0caa4a8b9358509902'
            '8eba195029a3824fdf690b634f70e925d167f6b3bb7e632dfb1f90900244c87b')

prepare() {
  cd "$srcdir"

  # Remove version from source directories. Cabal reads the version on the
  # directory and fails if it does not exactly match the version given in the
  # dependencies (e.g. 0.18.0 vs. 0.18). Without a version on the directory,
  # Cabal will read the version given in the .cabal files instead.
  mv elm-compiler-${pkgver} elm-compiler
  mv elm-package-${pkgver} elm-package
  mv elm-make-${pkgver} elm-make
  mv elm-reactor-${pkgver} elm-reactor
  mv elm-repl-${pkgver} elm-repl

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
  repos1=(elm-compiler elm-make elm-package elm-repl)
  repos2=(elm-reactor)
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

  install -Dm644 "elm-compiler/LICENSE" "$pkgdir/usr/share/licenses/elm-platform/LICENSE"
}

# vim:set ts=2 sw=2 et:
