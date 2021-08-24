# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

_hkgname=data-flags
pkgname=haskell-$_hkgname
pkgver=0.0.3.4
pkgrel=1
pkgdesc='A package for working with bit masks and flags in general'
url="https://hackage.haskell.org/package/$_hkgname"
arch=('x86_64' 'aarch64' 'armv6h' 'armv7h')
license=('custom:BSD-3-Clause')
depends=('ghc-libs')
makedepends=('ghc')
source=("https://hackage.haskell.org/packages/archive/$_hkgname/$pkgver/$_hkgname-$pkgver.tar.gz")
cksums=('312574024')
sha256sums=('48c2a1e2cc06e9f037eaecf0d74188ef168e219551a7f234a13cdd8c7f1370a0')
b2sums=('3d871cd240c25cfe7b4121c0222f801640c73ab9d9f9b86d3d94975df24ed3c272ee6f31e4b058d560e593db2c5fa4534317a6551bf6c93c3e00da7cf7d0492c')

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
