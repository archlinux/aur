# Maintainer: Lukas Werling <lukas.werling@gmail.com>
pkgname=elm-platform
pkgver=0.19.0
pkgrel=1
pkgdesc="Bundle of all core development tools for the Elm language."
arch=('i686' 'x86_64')
url="http://elm-lang.org"
license=('BSD3')
depends=('gmp' 'zlib')
optdepends=('nodejs: for elm-repl')
makedepends=('stack-static' 'patchelf')
conflicts=('nodejs-elm' 'elm-platform-bin')
source=(
  elm-compiler-${pkgver}.zip::https://github.com/elm/compiler/archive/${pkgver}.zip
  stack.yaml
)
sha256sums=('e6756bc7a8fb63120b0bb187f1d9c9dcc927ad68672f2ae0ae2ed2cb2c3cc278'
            'SKIP')

prepare() {
  cd "$srcdir"

  ln -sf compiler-${pkgver} elm-compiler
}

build() {
  cd "$srcdir"
  mkdir -p .stack

  stack setup --stack-root "$PWD/.stack"
  stack build --stack-root "$PWD/.stack"

  binpath="$(stack path --local-install-root)/bin"
  patchelf --shrink-rpath "$binpath/elm"
}

package() {
  cd "$srcdir"
  binpath="$(stack path --local-install-root)/bin"

  install -Dm755 "$binpath/elm"         "$pkgdir/usr/bin/elm"
  install -Dm644 "elm-compiler/LICENSE" "$pkgdir/usr/share/licenses/elm-platform/LICENSE"
}

# vim:set ts=2 sw=2 et:
