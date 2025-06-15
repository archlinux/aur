# Maintainer: Max <ulidtko@gmail.com>

pkgname=(haskell-trial haskell-trial-tomland haskell-trial-optparse-applicative)
pkgver=0.0.0.0
pkgrel=5
pkgdesc="Trial Data Structure"
url="https://github.com/kowainik/trial"
license=("MPL-2.0")
arch=('x86_64')
depends=(haskell-base haskell-colourista haskell-dlist)
makedepends=(cabal-install ghc
             haskell-doctest haskell-hedgehog haskell-hspec haskell-hspec-hedgehog haskell-splitmix
             haskell-tomland haskell-optparse-applicative
             uusi)
# NOTE: source monorepo taken from GH instead of hackage so that all 3 subpackages get built in one go
_commit=e86477e60649a99b8b9fed72dbe3cd566fde30ff
source=("https://github.com/kowainik/trial/archive/${_commit}.tar.gz")
sha256sums=('2c7f9a4f72dcbfc6b90abc3bad33698c67573b60d2074562598c087ecf27cc1a')

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
  depends=(ghc-libs haskell-trial haskell-tomland)
  pkgdesc="Trial helper functions for tomland"

  cd trial-${_commit}/trial-tomland
  install -D -m744 register.sh "$pkgdir"/usr/share/haskell/register/$pkgname.sh
  install -D -m744 unregister.sh "$pkgdir"/usr/share/haskell/unregister/$pkgname.sh
  runhaskell Setup copy --destdir="$pkgdir"
  install -D -m644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
  rm -f "$pkgdir"/usr/share/doc/$pkgname/LICENSE
}

package_haskell-trial-optparse-applicative() {
  depends=(ghc-libs haskell-trial haskell-optparse-applicative)
  pkgdesc="Trial helper functions for optparse-applicative"

  cd trial-${_commit}/trial-optparse-applicative
  install -D -m744 register.sh "$pkgdir"/usr/share/haskell/register/$pkgname.sh
  install -D -m744 unregister.sh "$pkgdir"/usr/share/haskell/unregister/$pkgname.sh
  runhaskell Setup copy --destdir="$pkgdir"
  install -D -m644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
  rm -f "$pkgdir"/usr/share/doc/$pkgname/LICENSE
}

