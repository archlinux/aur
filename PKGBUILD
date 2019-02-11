# Maintainer: Jaron Kent-Dobias <jaron@kent-dobias.com>
# Contributor: Emanuel Couto <unit73e at gmail dot com>
# Contributor: André van Delden <andre.van.delden at uni-bremen dot de>

_hkgname=linear
pkgname=haskell-linear
pkgver=1.20.8
pkgrel=1
pkgdesc="Types and combinators for linear algebra on free vector spaces."
url="https://hackage.haskell.org/package/linear"
license=('custom:BSD3')
arch=('i686' 'x86_64')
depends=('ghc-libs'
         'haskell-adjunctions'
         'haskell-base-orphans'
         'haskell-bytes'
         'haskell-cereal'
         'haskell-distributive'
         'haskell-hashable'
         'haskell-lens'
         'haskell-reflection'
         'haskell-semigroupoids'
         'haskell-tagged'
         'haskell-transformers-compat'
         'haskell-unordered-containers'
         'haskell-vector'
         'haskell-void')
makedepends=('ghc')
source=("https://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz"
        "haskell-linear-semigroups.patch")
sha512sums=('7ddb8f394e202d1225864a2bbf5d6b81abb70accb59a634deddc672470418896e3df00e1f7e120bae9e249bf7571ca530be1f511224f818e1ba76e077f99cc77'
            '4a4d8451982c97cdff35598bea5d0cd892b23382e59a6bc16fdc346ef71ca2471b34fe8e0ace74ca5f0c385e26ba2b7763bb76e7e89732d09e43e190f2af7453')

prepare() {
  cd ${_hkgname}-${pkgver}
  patch -Np1 -i "${srcdir}/haskell-linear-semigroups.patch"
}

build() {
  cd "${srcdir}/${_hkgname}-${pkgver}"
    
  runhaskell Setup configure -O --enable-shared --enable-executable-dynamic --disable-library-vanilla \
      --prefix=/usr --docdir="/usr/share/doc/${pkgname}" \
      --dynlibdir=/usr/lib --libsubdir=\$compiler/site-local/\$pkgid
  runhaskell Setup build
  runhaskell Setup register --gen-script
  runhaskell Setup unregister --gen-script
  sed -i -r -e "s|ghc-pkg.*update[^ ]* |&'--force' |" register.sh
  sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
}

package() {
  cd "${srcdir}/${_hkgname}-${pkgver}"
    
  install -D -m744 register.sh   "${pkgdir}/usr/share/haskell/register/${pkgname}.sh"
  install -D -m744 unregister.sh "${pkgdir}/usr/share/haskell/unregister/${pkgname}.sh"
  runhaskell Setup copy --destdir="${pkgdir}"
  install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 CHANGELOG.markdown README.markdown -t "${pkgdir}/usr/share/doc/${pkgname}"
  rm -f "${pkgdir}/usr/share/doc/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
