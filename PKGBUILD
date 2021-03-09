# Maintainer: berberman <hatsue@typed.icu>

pkgname=haskell-lsp-test-git
pkgver=1.1.1.0.r417.gcd5708b
pkgrel=1
pkgdesc="Functional test framework for LSP servers."
url="https://github.com/haskell/lsp"
license=("MIT")
arch=('x86_64')
depends=('ghc-libs' 'haskell-diff' 'haskell-glob' 'haskell-aeson' 'haskell-aeson-pretty'
       'haskell-ansi-terminal' 'haskell-async' 'haskell-conduit' 'haskell-conduit-parse'
        'haskell-data-default' 'haskell-lens' 'haskell-lsp-types-git' 'haskell-parser-combinators'
        'haskell-some' 'haskell-unordered-containers')
makedepends=('ghc' 'uusi' 'haskell-hspec')
source=("git+https://github.com/haskell/lsp.git")
sha256sums=('SKIP')
provides=('haskell-lsp-test')
conflicts=('haskell-lsp-test')

pkgver() {
  cd lsp
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd lsp/lsp-test
  gen-setup
}


build() {
  cd lsp/lsp-test

  runhaskell Setup configure -O --enable-shared --enable-executable-dynamic --disable-library-vanilla \
    --prefix=/usr --docdir=/usr/share/doc/$pkgname --enable-tests \
    --dynlibdir=/usr/lib --libsubdir=\$compiler/site-local/\$pkgid \
    --ghc-option=-optl-Wl\,-z\,relro\,-z\,now \
    --ghc-option='-pie'

  runhaskell Setup build $MAKEFLAGS
  runhaskell Setup register --gen-script
  runhaskell Setup unregister --gen-script
  sed -i -r -e "s|ghc-pkg.*update[^ ]* |&'--force' |" register.sh
  sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
}


check() {
  cd lsp/lsp-test
  runhaskell Setup test
}

package() {
  cd lsp/lsp-test

  install -D -m744 register.sh "$pkgdir"/usr/share/haskell/register/$pkgname.sh
  install -D -m744 unregister.sh "$pkgdir"/usr/share/haskell/unregister/$pkgname.sh
  runhaskell Setup copy --destdir="$pkgdir"
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  rm -f "$pkgdir"/usr/share/doc/$pkgname/LICENSE
}
