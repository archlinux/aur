# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

_hkgname=config-schema
pkgname=haskell-$_hkgname
pkgver=1.2.2.0
pkgrel=1
pkgdesc='Schema definitions for the config-value package'
url="https://hackage.haskell.org/package/$_hkgname"
arch=('x86_64' 'aarch64' 'armv6h' 'armv7h')
license=('custom:ISC')
depends=('ghc-libs' 'haskell-config-value' 'haskell-free' 'haskell-kan-extensions' 'haskell-semigroupoids')
makedepends=('ghc' 'uusi')
source=("https://hackage.haskell.org/packages/archive/$_hkgname/$pkgver/$_hkgname-$pkgver.tar.gz")
cksums=('3713348347')
sha256sums=('dd8f979736389cefcd826f66c5dd6156b069876366d16250288bf527a439b782')
b2sums=('464713a368537def66fcbbf764aa82438fba7b9baa6c35fcbb00c0824d8be96f0f3ec016493d1e4c942f4dbefacda8b99fbeaa13261b1cd46460d05e62cb70a3')

prepare() {
  cd "$_hkgname-$pkgver"

  uusi -u base $_hkgname.cabal
}

build() {
  cd "$_hkgname-$pkgver"

  runhaskell Setup configure -O --enable-shared --enable-executable-dynamic --disable-library-vanilla \
    --prefix=/usr --docdir="/usr/share/doc/$pkgname" --enable-tests \
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
  cd "$_hkgname-$pkgver"

  runhaskell Setup test
}

package() {
  cd "$_hkgname-$pkgver"

  install -D -m744 register.sh "$pkgdir/usr/share/haskell/register/$pkgname.sh"
  install -D -m744 unregister.sh "$pkgdir/usr/share/haskell/unregister/$pkgname.sh"
  runhaskell Setup copy --destdir="$pkgdir"
  install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  rm -f "${pkgdir}/usr/share/doc/${pkgname}/LICENSE"
}
