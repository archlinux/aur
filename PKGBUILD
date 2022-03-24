# Maintainer: Philipp Joram <mail [at] phijor [dot] me>

_hkgname=agda-language-server
_agdaver=2.6.2
pkgname=haskell-agda-language-server
pkgver=0.2.1
pkgrel=20
pkgdesc="An implementation of language server protocal (LSP) for Agda 2."
url="https://github.com/banacorn/agda-language-server#readme"
license=("custom: MIT")
arch=('x86_64')
depends=('ghc-libs' "agda=$_agdaver" 'haskell-aeson' 'haskell-lsp' 'haskell-network' 'haskell-network-simple' 'haskell-strict')
makedepends=('ghc' 'haskell-tasty' 'haskell-tasty-golden' 'haskell-tasty-hunit' 'haskell-tasty-quickcheck')
source=("https://hackage.haskell.org/packages/archive/$_hkgname/$pkgver/$_hkgname-$pkgver.tar.gz")
sha256sums=('20ec24dfd7d7f6f74942615bd5edbbc6641648dc5a41820bc9fdef24cb87fda7')

build() {
  cd $_hkgname-$pkgver

  runhaskell Setup configure -O --enable-shared --enable-executable-dynamic --disable-library-vanilla \
    --prefix=/usr --docdir=/usr/share/doc/$pkgname --enable-tests \
    --dynlibdir=/usr/lib --libsubdir=\$compiler/site-local/\$pkgid \
    --ghc-option=-optl-Wl\,-z\,relro\,-z\,now \
    --ghc-option='-pie'

  runhaskell Setup build
  runhaskell Setup register --gen-script
  runhaskell Setup unregister --gen-script
  sed -i -r -e "s|ghc-pkg.*update[^ ]* |&'--force' |" register.sh
  sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
}

check() {
  cd $_hkgname-$pkgver
  runhaskell Setup test
}

package() {
  cd $_hkgname-$pkgver

  install -D -m744 register.sh "$pkgdir"/usr/share/haskell/register/$pkgname.sh
  install -D -m744 unregister.sh "$pkgdir"/usr/share/haskell/unregister/$pkgname.sh
  runhaskell Setup copy --destdir="$pkgdir"
  install -D -m644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
  rm -f "$pkgdir"/usr/share/doc/$pkgname/LICENSE
}
