# Maintainer: Max <ulidtko@gmail.com>

_hkgname=directory
pkgname=haskell-directory
pkgver=1.3.10.1
pkgrel=1
pkgdesc="Platform-agnostic library for filesystem operations (backport)"
url="https://github.com/haskell/directory"
license=("BSD-3-Clause")
arch=('x86_64')
depends=(haskell-base
         'haskell-filepath>=1.4.100' 'haskell-filepath<1.5'
         'haskell-unix>=2.8'
         haskell-time)
makedepends=('ghc')

source=("https://hackage.haskell.org/packages/archive/$_hkgname/$pkgver/$_hkgname-$pkgver.tar.gz"
        0001-extend-flag-os-string-handling-to-test-suites.patch
       )
sha256sums=('d8f718851aa25a357ca4a6d0204eb357a69383b9b69528d18e2bca463e94c259'
            'ac294cd4f402402c4d365633814a1e7657af9031410b311188b9fd7c6578ee8c')

#-- Packager NOTE: this is a backport.
#--
#-- (A version of) The haskell library `directory` is shipped within ghc-libs.
#-- However, some packages require newer versions of `directory`.

prepare() {
  cd $_hkgname-$pkgver
  patch -p1 < ../0001-extend-flag-os-string-handling-to-test-suites.patch
}

build() {
  cd $_hkgname-$pkgver

  #-- allow file-io 0.2
  sed -i 's/file-io .*,/file-io,/' directory.cabal

  runhaskell Setup configure -O --enable-shared --enable-executable-dynamic --disable-library-vanilla \
    --prefix=/usr --docdir=/usr/share/doc/$pkgname --datasubdir=$pkgname --enable-tests \
    --dynlibdir=/usr/lib --libsubdir=\$compiler/site-local/\$pkgid \
    --ghc-option=-optl-Wl\,-z\,relro\,-z\,now \
    --ghc-option='-pie' \
    -f-cpphs \
    -f-os-string

  runhaskell Setup build
  runhaskell Setup register --gen-script
  runhaskell Setup unregister --gen-script
  sed -i -r -e "s|ghc-pkg.*update[^ ]* |&'--force' |" register.sh
  sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
}

check() {
  cd $_hkgname-$pkgver
  runhaskell Setup test
}

package() {
  cd $_hkgname-$pkgver

  install -D -m744 register.sh "$pkgdir"/usr/share/haskell/register/$pkgname.sh
  install -D -m744 unregister.sh "$pkgdir"/usr/share/haskell/unregister/$pkgname.sh
  runhaskell Setup copy --destdir="$pkgdir"
  install -D -m644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
  rm -f "$pkgdir"/usr/share/doc/$pkgname/LICENSE
}
