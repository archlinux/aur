# Maintainer: Cody Schafer <aur at codyps.com>

_hkgname=bustle
pkgname=$_hkgname
pkgver=0.8.0
pkgrel=1
pkgdesc="Draw sequence diagrams of D-Bus traffic"
url="https://gitlab.freedesktop.org/bustle/bustle#readme"
license=("custom: LGPL_2_1_or_later")
arch=('x86_64')
depends=('ghc-libs' 'haskell-cairo' 'haskell-gio' 'haskell-glib' 'haskell-gtk' 'haskell-pango' 'glib2' 'libpcap')
makedepends=('ghc' 'haskell-hunit' 'haskell-quickcheck' 'haskell-test-framework' 'haskell-test-framework-hunit')
source=("https://hackage.haskell.org/packages/archive/$_hkgname/$pkgver/$_hkgname-$pkgver.tar.gz")
sha256sums=('2fb3e9d9a97db3cd9a3ce763e86947b642bd7733b46206177a1677f08726573c')

build() {
  cd $_hkgname-$pkgver

  runhaskell Setup configure -O --enable-shared --enable-executable-dynamic --disable-library-vanilla \
    --prefix=/usr --docdir=/usr/share/doc/$pkgname --enable-tests \
    --dynlibdir=/usr/lib --libsubdir=\$compiler/site-local/\$pkgid \
    --ghc-option=-optl-Wl\,-z\,relro\,-z\,now \
    --ghc-option='-pie'

  runhaskell Setup build
  runhaskell Setup unregister --gen-script
  sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
}

check() {
  cd $_hkgname-$pkgver
  runhaskell Setup test
}

package() {
  cd $_hkgname-$pkgver

  install -D -m744 unregister.sh "$pkgdir"/usr/share/haskell/unregister/$pkgname.sh
  runhaskell Setup copy --destdir="$pkgdir"
  install -D -m644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
  rm -f "$pkgdir"/usr/share/doc/$pkgname/LICENSE
}
