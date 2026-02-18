# Maintainer: Max <ulidtko@gmail.com>

_hkgname=file-io
pkgname=haskell-file-io
pkgver=0.2.0
pkgrel=1
pkgdesc="Basic file IO operations via 'OsPath'"
url="https://github.com/hasufell/file-io"
license=("BSD-3-Clause")
arch=('x86_64')
depends=(ghc-libs)
makedepends=(ghc haskell-tasty-hunit haskell-temporary)

source=("https://hackage.haskell.org/packages/archive/$_hkgname/$pkgver/$_hkgname-$pkgver.tar.gz"
        Setup.hs
        0001-extend-flag-os-string-handling-to-test-suites.patch
        )
sha256sums=('8e75f8905d7c9f114e6164779e7a19ff0e2968015ecf686934e38250575dabe7'
            '5066653559d4d6134b022d66a634a17fdcf8db35d28b447e581fec284afa4689'
            'a245db54a12bc7bcb5d44a787a68b2a2a50b2982807eeaba8a5910fbf7eb8b02')

prepare() {
  cd "$_hkgname-$pkgver"

  #-- Upstream tarball doesn't come with Setup.hs, use the trivial one
  mv -v ../Setup.hs ./

  #-- Prevent test-suites from linking with filepath version different from main lib
  patch -p1 < ../0001-extend-flag-os-string-handling-to-test-suites.patch
}

build() {
  cd $_hkgname-$pkgver

  runhaskell Setup configure -O --enable-shared --enable-executable-dynamic --disable-library-vanilla \
    --prefix=/usr --docdir=/usr/share/doc/$pkgname --datasubdir=$pkgname --enable-tests \
    --dynlibdir=/usr/lib --libsubdir=\$compiler/site-local/\$pkgid \
    --ghc-option=-optl-Wl\,-z\,relro\,-z\,now \
    --ghc-option='-pie' \
    -f-os-string
  #-- FIXME: enable flag os-string, once filepath in ghc-libs becomes >=1.5

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
