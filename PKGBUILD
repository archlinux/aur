# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

_hkgname=formatting
pkgname=haskell-$_hkgname
pkgver=7.1.3
pkgrel=1
pkgdesc='Combinator-based type-safe formatting'
url="https://hackage.haskell.org/package/$_hkgname"
arch=('x86_64' 'aarch64' 'armv6h' 'armv7h')
license=('custom:BSD-3-Clause')
depends=('ghc-libs' 'haskell-clock' 'haskell-double-conversion' 'haskell-old-locale')
makedepends=('ghc' 'haskell-hspec' 'haskell-scientific')
source=("https://hackage.haskell.org/packages/archive/$_hkgname/$pkgver/$_hkgname-$pkgver.tar.gz")
cksums=('1020702325')
sha256sums=('8061bbe29278e6b7bb2268b00e1717385643dfa04e7b58b012bd53b342142cef')
b2sums=('9f3b964096a30a7d9bd5ef01ad5ee994ab3c5435560a7a74398314537b525a58a0b6238bb1c3cbfa43dbfd5405ceaba65d6ced301166a860e26dfc7b440869fc')

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
