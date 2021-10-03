# Maintainer: Cody P Schafer <archlinux at codyps.com>
# Maintainer: Daniel Nagy <danielnagy at gmx de>
# Contributor: Martin Harvan <martinhrvn@gmail.com>

_hkgname=gio
pkgname=haskell-$_hkgname
pkgver=0.13.8.1
pkgrel=2
pkgdesc="Binding to GIO"
url="http://projects.haskell.org/gtk2hs/"
license=("LGPL2_1")
arch=('x86_64')
depends=('ghc-libs' 'haskell-glib' 'glib2')
makedepends=('ghc' 'haskell-gtk2hs-buildtools')
source=("https://hackage.haskell.org/packages/archive/$_hkgname/$pkgver/$_hkgname-$pkgver.tar.gz")
sha256sums=('26d77f1c1d5937a73b98f29b91619d9911756819cb2894ace864626bee41b801')

build() {
  cd $_hkgname-$pkgver

  runhaskell Setup configure -O --enable-shared --enable-executable-dynamic --disable-library-vanilla \
    --prefix=/usr --docdir=/usr/share/doc/$pkgname --enable-tests \
    --dynlibdir=/usr/lib --libsubdir=\$compiler/site-local/\$pkgid \
    --ghc-option=-optl-Wl\,-z\,relro\,-z\,now \
    --ghc-option='-pie'

  runhaskell Setup build
  runhaskell Setup register --gen-script
  runhaskell Setup unregister --gen-script
  sed -i -r -e "s|ghc-pkg.*update[^ ]* |&'--force' |" register.sh
  sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
}

package() {
  cd $_hkgname-$pkgver

  install -D -m744 register.sh "$pkgdir"/usr/share/haskell/register/$pkgname.sh
  install -D -m744 unregister.sh "$pkgdir"/usr/share/haskell/unregister/$pkgname.sh
  runhaskell Setup copy --destdir="$pkgdir"
  install -D -m644 COPYING -t "$pkgdir"/usr/share/licenses/$pkgname/
  rm -f "$pkgdir"/usr/share/doc/$pkgname/COPYING
}
