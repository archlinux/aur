# Maintainer: Lukas Werling <lukas.werling@gmail.com>
pkgname=elm-platform
pkgver=0.18.0
pkgrel=3
pkgdesc="Bundle of all core development tools for the Elm language."
arch=('i686' 'x86_64')
url="http://elm-lang.org"
license=('BSD3')
depends=('gmp' 'zlib')
makedepends=('stack-static' 'patchelf')
conflicts=('nodejs-elm')
source=(
  elm-compiler-${pkgver}.zip::https://github.com/elm-lang/elm-compiler/archive/${pkgver}.zip
  elm-package-${pkgver}.zip::https://github.com/elm-lang/elm-package/archive/${pkgver}.zip
  elm-make-${pkgver}.zip::https://github.com/elm-lang/elm-make/archive/${pkgver}.zip
  elm-reactor-${pkgver}.zip::https://github.com/elm-lang/elm-reactor/archive/${pkgver}.zip
  elm-repl-${pkgver}.zip::https://github.com/elm-lang/elm-repl/archive/${pkgver}.zip
  stack.yaml
)
sha256sums=('911109bbedf13c5a5c154ff8b60087b43cfd8be5e165df09b4e8f532a9f22fcd'
            'a93a2777ee4488510c6e5f82fc7bd7299cbeed7e04004e833d5a8d6f43db44c8'
            'dcd254ba3c30848bc3527fcab197f8608bc913ae0bee17f67cf97ebf7977dfa6'
            '6c5525b2dd35ab6ccf6c5f7e6568bd0164711b8932e80f0caa4a8b9358509902'
            '8eba195029a3824fdf690b634f70e925d167f6b3bb7e632dfb1f90900244c87b'
            'SKIP')

prepare() {
  cd "$srcdir"

  ln -sf elm-compiler-${pkgver} elm-compiler
  ln -sf elm-package-${pkgver} elm-package
  ln -sf elm-make-${pkgver} elm-make
  ln -sf elm-reactor-${pkgver} elm-reactor
  ln -sf elm-repl-${pkgver} elm-repl
}

build() {
  cd "$srcdir"

  stack build --install-ghc

  binpath="$(stack path --local-install-root)/bin"
  for bin in elm elm-make elm-package elm-reactor elm-repl; do
    patchelf --shrink-rpath "$binpath/$bin"
  done
}

package() {
  cd "$srcdir"
  binpath="$(stack path --local-install-root)/bin"

  install -Dm755 "$binpath/elm"         "$pkgdir/usr/bin/elm"
  install -Dm755 "$binpath/elm-make"    "$pkgdir/usr/bin/elm-make"
  install -Dm755 "$binpath/elm-package" "$pkgdir/usr/bin/elm-package"
  install -Dm755 "$binpath/elm-reactor" "$pkgdir/usr/bin/elm-reactor"
  install -Dm755 "$binpath/elm-repl"    "$pkgdir/usr/bin/elm-repl"

  install -Dm644 "elm-compiler/LICENSE" "$pkgdir/usr/share/licenses/elm-platform/LICENSE"
}

# vim:set ts=2 sw=2 et:
