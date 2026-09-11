# Maintainer: Jamie Magee <jamie dot magee at gmail dot com>

pkgname=nixfmt
pkgver=1.5.0 # renovate: datasource=github-tags depName=NixOS/nixfmt
pkgrel=1
pkgdesc="Official formatter for Nix code"
url="https://github.com/NixOS/nixfmt"
license=("MPL-2.0")
arch=('x86_64')
depends=('ghc-libs' 'haskell-cmdargs' 'haskell-megaparsec' 'haskell-parser-combinators' 'haskell-safe-exceptions' 'haskell-scientific' 'haskell-file-embed' 'haskell-pretty-simple')
makedepends=('ghc' 'uusi')
source=("https://github.com/NixOS/$pkgname/archive/v$pkgver.tar.gz")
b2sums=('524b10c7ba2ec9d6701370100d123e917d68f27a05e8d802030cfb5d5a205ba9aa3a070aaed863a76d4af0342a4d1d74c0aa4bbdf4f6e09bd3ea4128bd08ecbc')

prepare() {
  cd $pkgname-$pkgver

  # GHC 9.6 supports GHC2024's extensions, but not the edition alias.
  sed -Ei 's/(default-language:[[:space:]]*)GHC2024/\1GHC2021/' $pkgname.cabal
  sed -i '/common warnings/a\  default-extensions: DataKinds DerivingStrategies DisambiguateRecordFields ExplicitNamespaces GADTs LambdaCase MonoLocalBinds RoleAnnotations' $pkgname.cabal

  uusi $pkgname.cabal
}

build() {
  cd $pkgname-$pkgver

  gen-setup
  runhaskell Setup configure -O --enable-shared --enable-executable-dynamic --disable-library-vanilla \
    --prefix=/usr --docdir=/usr/share/doc/$pkgname --datasubdir=$pkgname --enable-tests \
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
  cd $pkgname-$pkgver
  runhaskell Setup test
}

package() {
  cd $pkgname-$pkgver

  install -D -m744 register.sh "$pkgdir"/usr/share/haskell/register/$pkgname.sh
  install -D -m744 unregister.sh "$pkgdir"/usr/share/haskell/unregister/$pkgname.sh
  runhaskell Setup copy --destdir="$pkgdir"
  install -D -m644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
  rm -f "$pkgdir"/usr/share/doc/$pkgname/LICENSE
}
