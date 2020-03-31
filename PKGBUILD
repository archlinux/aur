# Maintainer: Daniel Mouritzen <dmrtzn at gmail dot com>

_hkgname=vector-space
pkgname=haskell-vector-space
pkgver=0.16
pkgrel=1
pkgdesc="Vector & affine spaces, linear maps, and derivatives"
url="https://github.com/conal/vector-space"
license=("BSD")
arch=('x86_64')
depends=('ghc-libs' 'haskell-boolean' 'haskell-memotrie' 'haskell-numinstances')
makedepends=('ghc')
source=("https://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")
sha256sums=('0c0b2f1209f95045865b968c7aa0a25e155410b3e08cf98a6c8544e48436c79c')

build() {
  cd "$_hkgname-$pkgver"

  runhaskell Setup configure -O --enable-shared --enable-executable-dynamic --disable-library-vanilla \
    --prefix=/usr --docdir=/usr/share/doc/$pkgname --datasubdir="$pkgname" --enable-tests \
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
  cd "$_hkgname-$pkgver"
  runhaskell Setup test
}

package() {
  cd "$_hkgname-$pkgver"

  install -D -m744 register.sh "$pkgdir"/usr/share/haskell/register/$pkgname.sh
  install -D -m744 unregister.sh "$pkgdir"/usr/share/haskell/unregister/$pkgname.sh
  runhaskell Setup copy --destdir="$pkgdir"
  install -D -m644 "COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  rm -f "${pkgdir}/usr/share/doc/${pkgname}/LICENSE"
}
