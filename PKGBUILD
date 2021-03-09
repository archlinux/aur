# Maintainer: berberman <hatsue@typed.icu>

pkgname=haskell-lsp-git
pkgver=1.1.1.0.r417.gcd5708b
pkgrel=1
pkgdesc="Haskell library for the Microsoft Language Server Protocol"
url="https://github.com/haskell/lsp"
license=("MIT")
arch=('x86_64')
depends=('ghc-libs' 'haskell-aeson' 'haskell-async' 'haskell-attoparsec' 'haskell-data-default'
       'haskell-dependent-map' 'haskell-hashable' 'haskell-hslogger' 'haskell-lens' 'haskell-lsp-types-git'
       'haskell-network-uri' 'haskell-random' 'haskell-scientific' 'haskell-sorted-list'
       'haskell-unliftio-core' 'haskell-unordered-containers' 'haskell-uuid')
makedepends=('ghc' 'haskell-quickcheck' 'haskell-hspec' 'haskell-hspec-discover'
           'haskell-quickcheck-instances' 'haskell-rope-utf16-splay')
source=("git+https://github.com/haskell/lsp.git")
sha256sums=('SKIP')
provides=('haskell-lsp')
conflicts=('haskell-lsp')

pkgver() {
  cd lsp
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}


build() {
  cd lsp

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
  cd lsp
  runhaskell Setup test
}

package() {
  cd lsp 

  install -D -m744 register.sh "$pkgdir"/usr/share/haskell/register/$pkgname.sh
  install -D -m744 unregister.sh "$pkgdir"/usr/share/haskell/unregister/$pkgname.sh
  runhaskell Setup copy --destdir="$pkgdir"
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  rm -f "$pkgdir"/usr/share/doc/$pkgname/LICENSE
}
