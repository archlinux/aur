# Maintainer: Max <ulidtko@gmail.com>

pkgname=(haskell-trial haskell-trial-tomland haskell-trial-optparse-applicative)
pkgver=0.0.0.0
pkgrel=1
pkgdesc="Trial Data Structure"
url="https://github.com/kowainik/trial"
license=("MPL2")
arch=('x86_64')
depends=(ghc-libs haskell-colourista haskell-dlist)
makedepends=(cabal-install ghc
             haskell-doctest haskell-hedgehog haskell-hspec haskell-hspec-hedgehog haskell-splitmix
             uusi)
# NOTE: source taken from GH so that all 3 subpackages get built in one go
_commit=5f67d4ad805ec4efb4e53805ff728dc73cb503e8
source=("https://github.com/kowainik/trial/archive/${_commit}.tar.gz")
sha256sums=(1d8760b4cbef4e29fd9895bfdbf1a6a4cf5a31a5fe3e46ee50119ef4912b7d07)

build() {
  cd trial-${_commit}
  build_haskell-trial
  build_haskell-trial-tomland
  build_haskell-trial-optparse-applicative
}

build_haskell-trial() {
  _subpkg=trial
  pushd ${_subpkg}
  gen-setup && uusi --all $_subpkg.cabal

  runhaskell Setup configure -O \
    --enable-shared --enable-executable-dynamic --disable-library-vanilla \
    --prefix=/usr --docdir=/usr/share/doc/haskell-$_subpkg --enable-tests \
    --dynlibdir=/usr/lib --libsubdir=\$compiler/site-local/\$pkgid \
    --ghc-option=-optl-Wl\,-z\,relro\,-z\,now \
    --ghc-option='-pie' \
    ; # --verbose=1

  runhaskell Setup build
  runhaskell Setup register --gen-script
  runhaskell Setup unregister --gen-script
  sed -i -r -e "s|ghc-pkg.*update[^ ]* |&'--force' |" register.sh
  sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
  popd
}

build_haskell-trial-tomland() {
  _subpkg=trial-tomland
  pushd ${_subpkg}
  gen-setup && uusi --all $_subpkg.cabal

  runhaskell Setup configure -O \
    --enable-shared --enable-executable-dynamic --disable-library-vanilla \
    --prefix=/usr --docdir=/usr/share/doc/haskell-$_subpkg --enable-tests \
    --dynlibdir=/usr/lib --libsubdir=\$compiler/site-local/\$pkgid \
    --ghc-option=-optl-Wl\,-z\,relro\,-z\,now \
    --ghc-option='-pie' \
    --package-db="../trial/dist/package.conf.inplace" \
    ; # --verbose=3

  runhaskell Setup build
  runhaskell Setup register --gen-script
  runhaskell Setup unregister --gen-script
  sed -i -r -e "s|ghc-pkg.*update[^ ]* |&'--force' |" register.sh
  sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
  popd
}
build_haskell-trial-optparse-applicative() {
  _subpkg=trial-optparse-applicative
  pushd ${_subpkg}
  gen-setup && uusi --all $_subpkg.cabal

  runhaskell Setup configure -O \
    --enable-shared --enable-executable-dynamic --disable-library-vanilla \
    --prefix=/usr --docdir=/usr/share/doc/haskell-$_subpkg --enable-tests \
    --dynlibdir=/usr/lib --libsubdir=\$compiler/site-local/\$pkgid \
    --ghc-option=-optl-Wl\,-z\,relro\,-z\,now \
    --ghc-option='-pie' \
    --package-db="../trial/dist/package.conf.inplace" \
    ; # --verbose=1

  runhaskell Setup build
  runhaskell Setup register --gen-script
  runhaskell Setup unregister --gen-script
  sed -i -r -e "s|ghc-pkg.*update[^ ]* |&'--force' |" register.sh
  sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
  popd
}

check() {
  #-- tests only exist at the main library subpackage
  cd trial-${_commit}/trial
  runhaskell Setup test
}

package_haskell-trial() {
  cd trial-${_commit}/trial

  install -D -m744 register.sh "$pkgdir"/usr/share/haskell/register/$pkgname.sh
  install -D -m744 unregister.sh "$pkgdir"/usr/share/haskell/unregister/$pkgname.sh
  runhaskell Setup copy --destdir="$pkgdir"
  install -D -m644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
  rm -f "$pkgdir"/usr/share/doc/$pkgname/LICENSE
}

package_haskell-trial-tomland() {
  depends=(ghc-libs haskell-tomland haskell-trial)
  pkgdesc="Trial helper functions for tomland"

  cd trial-${_commit}/trial-tomland
  install -D -m744 register.sh "$pkgdir"/usr/share/haskell/register/$pkgname.sh
  install -D -m744 unregister.sh "$pkgdir"/usr/share/haskell/unregister/$pkgname.sh
  runhaskell Setup copy --destdir="$pkgdir"
  install -D -m644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
  rm -f "$pkgdir"/usr/share/doc/$pkgname/LICENSE
}

package_haskell-trial-optparse-applicative() {
  depends=(ghc-libs haskell-optparse-applicative haskell-trial)
  pkgdesc="Trial helper functions for optparse-applicative"

  cd trial-${_commit}/trial-optparse-applicative
  install -D -m744 register.sh "$pkgdir"/usr/share/haskell/register/$pkgname.sh
  install -D -m744 unregister.sh "$pkgdir"/usr/share/haskell/unregister/$pkgname.sh
  runhaskell Setup copy --destdir="$pkgdir"
  install -D -m644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
  rm -f "$pkgdir"/usr/share/doc/$pkgname/LICENSE
}

