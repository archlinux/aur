# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

_hkgname=HFuse
pkgname=haskell-${_hkgname,,}
pkgver=0.2.5.0
pkgrel=1
pkgdesc='Bindings for the FUSE library, compatible with Linux, OSXFUSE and FreeBSD'
url="https://hackage.haskell.org/package/$_hkgname"
arch=('x86_64' 'aarch64' 'armv6h' 'armv7h')
license=('custom:BSD-3-Clause')
depends=('ghc-libs' 'fuse2')
makedepends=('ghc')
source=("https://hackage.haskell.org/packages/archive/$_hkgname/$pkgver/$_hkgname-$pkgver.tar.gz")
cksums=('2857099400')
sha256sums=('02e0e9a8057ab6b87b3c35888f2581f0b5701faff61e8f597b4d5c6065e067eb')
b2sums=('3ec7162935f0264163fb0f851bd984ab26ed60faccb6e962e16fb9e7c8773e203774a298b4fa3e9633e210989c84f21e747d3a0c6eaf3cfa506d5d1ed20ca3d8')

build() {
  cd "$_hkgname-$pkgver"

  runhaskell Setup configure -O --enable-shared --enable-executable-dynamic --disable-library-vanilla \
    --prefix=/usr --docdir="/usr/share/doc/$pkgname" --enable-tests \
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
