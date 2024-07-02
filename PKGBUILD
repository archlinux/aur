# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
pkgname=dconf2nix
_hkgname=$pkgname
pkgver=0.1.1
pkgrel=4
pkgdesc="Convert dconf files (e.g. GNOME Shell) to Nix, as expected by Home Manager"
url="https://github.com/nix-community/dconf2nix"
license=('Apache-2.0')
arch=('i686' 'x86_64')
depends=(glibc libffi haskell-transformers-compat haskell-ansi-terminal haskell-optparse-applicative
haskell-colour numactl haskell-ansi-wl-pprint haskell-emojis bash gmp)
makedepends=('ghc' 'haskell-hedgehog')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/gvolpe/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('4e6f54adfd6d8ace8dc58ddd42f8faab2179fb66e20c41094236a553de7f22ed3d9168ef0549596f42c741fcccbcb02a09aeae04045ebf80899f6adede0e56c5')

build() {
  cd "$_hkgname-$pkgver"

  runhaskell Setup configure -O --enable-shared --enable-executable-dynamic --disable-library-vanilla \
    --prefix=/usr --docdir="/usr/share/doc/$pkgname" --datasubdir=$pkgname --enable-tests \
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
