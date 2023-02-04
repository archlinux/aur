# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

_hkgname=formatting
pkgname=haskell-$_hkgname
pkgver=7.2.0
pkgrel=1
pkgdesc='Combinator-based type-safe formatting'
url="https://hackage.haskell.org/package/$_hkgname"
arch=('x86_64' 'aarch64' 'armv6h' 'armv7h')
license=('custom:BSD-3-Clause')
depends=('ghc-libs' 'haskell-clock' 'haskell-double-conversion' 'haskell-old-locale')
makedepends=('ghc' 'haskell-hspec' 'haskell-scientific')
source=("https://hackage.haskell.org/packages/archive/$_hkgname/$pkgver/$_hkgname-$pkgver.tar.gz")
cksums=('460280359')
sha256sums=('c07b18177af614e7e5f32e6fd924f7b35c1b1c219b3491608ee8e7276e706a6d')
b2sums=('231621d12d6aaa1551a795ba193ac75d4eb04bc4c600ddbd9adcaa4a10a4db96379d1574ab782b5508b252a5d0c3c755797cf27d9fa0ec2f6abdf018ceb8202a')

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
