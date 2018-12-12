# Maintainer: Leif Warner <abimelech@gmail.com>

_hkgname=cereal-conduit
pkgname=haskell-$_hkgname
pkgver=0.8.0
pkgrel=1
pkgdesc="Turn Data.Serialize Gets and Puts into Sources, Sinks, and Conduits."
url="https://hackage.haskell.org/package/$_hkgname"
license=("BSD")
arch=('x86_64')
depends=('haskell-bytestring' 'haskell-cereal' 'haskell-conduit' 'haskell-resourcet' 'haskell-transformers')
makedepends=('ghc')
source=("https://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")
sha512sums=('7065af2c5fcc004411e4886efcc7f32b55ce2674b264db9ed1fdea1d38ef17dd097ed9285f75d954c8bf9a1dcc1694c1661ea984f5eb1fef6b6988f1300285a6')

build() {
  cd "$srcdir"/${_hkgname}-${pkgver}
  runhaskell Setup configure -O --enable-shared --enable-executable-dynamic --disable-library-vanilla \
      --prefix=/usr --docdir=/usr/share/doc/$pkgname \
      --dynlibdir=/usr/lib --libsubdir=\$compiler/site-local/\$pkgid
  runhaskell Setup build
  runhaskell Setup register --gen-script
  runhaskell Setup unregister --gen-script
  sed -i -r -e "s|ghc-pkg.*update[^ ]* |&'--force' |" register.sh
  sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
}

package() {
  cd "$srcdir"/${_hkgname}-${pkgver}
  install -D -m744 register.sh "$pkgdir"/usr/share/haskell/register/$pkgname.sh
  install -D -m744 unregister.sh "$pkgdir"/usr/share/haskell/unregister/$pkgname.sh
  runhaskell Setup copy --destdir="$pkgdir"
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE
  rm -f "$pkgdir"/usr/share/doc/${pkgname}/LICENSE
}
