# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

_hkgname=config-schema
pkgname=haskell-$_hkgname
pkgver=1.3.0.0
pkgrel=1
pkgdesc='Schema definitions for the config-value package'
url="https://hackage.haskell.org/package/$_hkgname"
arch=('x86_64' 'aarch64' 'armv6h' 'armv7h')
license=('custom:ISC')
depends=('ghc-libs' 'haskell-config-value' 'haskell-free' 'haskell-kan-extensions' 'haskell-semigroupoids')
makedepends=('ghc' 'uusi')
source=("https://hackage.haskell.org/packages/archive/$_hkgname/$pkgver/$_hkgname-$pkgver.tar.gz")
cksums=('2833052830')
sha256sums=('3c89c55bcf5128f62462eafa0c7bc6c441ccfd8a8d2af27c972a144d7ccaabc8')
b2sums=('60a41d39da8eb6ab030225f4ed66ca7a81c41b0a70f2bda8e849ab6c6a1af0a6387f2942bc6a659550f5c782c58c0262b633e575a9b92d7649090b8393175134')

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
