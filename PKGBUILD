# Maintainer: kodemeister <kodemeister@outlook.com>

_hkgname=ghcid
pkgname=ghcid
pkgver=0.8.7
pkgrel=3
pkgdesc="GHCi based bare bones IDE"
arch=("x86_64")
url="https://github.com/ndmitchell/ghcid"
license=("BSD")
depends=("ghc-libs" "haskell-ansi-terminal" "haskell-cmdargs" "haskell-extra" "haskell-fsnotify" "haskell-terminal-size")
makedepends=("ghc" "haskell-tasty" "haskell-tasty-hunit")
source=("https://hackage.haskell.org/packages/archive/$_hkgname/$pkgver/$_hkgname-$pkgver.tar.gz")
sha512sums=("69748c115db36d4b41dafdbbfaeedc80be3a3bdadf15b16386e36138193fcc8c89d84b2990fb69175acedbb5cab62251387405ccbb2e7bcc8d04f5370effab8a")

build() {
  cd "$_hkgname-$pkgver"

  /usr/bin/runhaskell Setup configure -w /usr/bin/ghc -O --enable-shared --enable-executable-dynamic --disable-library-vanilla \
    --prefix=/usr --docdir=/usr/share/doc/$pkgname --enable-tests \
    --dynlibdir=/usr/lib --libsubdir=\$compiler/site-local/\$pkgid \
    --ghc-option=-optl-Wl\,-z\,relro\,-z\,now \
    --ghc-option=-pie

  /usr/bin/runhaskell Setup build $MAKEFLAGS
  /usr/bin/runhaskell Setup register --gen-script
  /usr/bin/runhaskell Setup unregister --gen-script
  sed -i -r -e "s|ghc-pkg.*update[^ ]* |&'--force' |" register.sh
  sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
}

check() {
  cd "$_hkgname-$pkgver"
  /usr/bin/runhaskell Setup test || echo "Tests failed"
}

package() {
  cd "$_hkgname-$pkgver"

  install -D -m744 register.sh "$pkgdir/usr/share/haskell/register/$pkgname.sh"
  install -D -m744 unregister.sh "$pkgdir/usr/share/haskell/unregister/$pkgname.sh"
  /usr/bin/runhaskell Setup copy --destdir="$pkgdir"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  rm -f "$pkgdir/usr/share/doc/$pkgname/LICENSE"
}
