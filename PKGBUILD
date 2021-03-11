# Maintainer: George Stelle <stelleg@gmail.com>
# Contributor: George Stelle <stelleg@gmail.com>

_hkgname=llvm-hs-pure
pkgname=haskell-${_hkgname}
pkgver=9.0.0
pkgrel=1
pkgdesc="Pure Haskell LLVM functionality (no FFI)"
url="https://hackage.haskell.org/package/${_hkgname}"
license=("BSD")
arch=('x86_64')
depends=('ghc-libs' 'haskell-attoparsec' 
         'haskell-transformers-base' 'haskell-unordered-containers') 
makedepends=('ghc')
source=("https://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz" "fail.patch")
sha512sums=('0b573a6ac591fea5ae4f9259e1f1ece5f01b5f962641c41d7b30042326a93fc624906d7dcd7689cf72171437b5575697d26d0cd0f51e239b8383ec15b3bad4b7'
            '3e54f1c39bd31b03263db83bcb5b3960f95fb09a14f6cf8dda51a90c145fc6b9df7374068632fbc99665d736bb4dfedad6177b6099ca6edc3b3b081729094768')

prepare() {
  cd $srcdir

  patch --strip=1 --input="${srcdir}/fail.patch"
}

build() {
    cd $_hkgname-$pkgver
    
    runhaskell Setup configure -O --enable-shared --enable-executable-dynamic --disable-library-vanilla \
        --prefix=/usr --docdir=/usr/share/doc/$pkgname \
        --dynlibdir=/usr/lib --libsubdir=\$compiler/site-local/\$pkgid
    runhaskell Setup build $MAKEFLAGS
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
    install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    rm -f "$pkgdir"/usr/share/doc/$pkgname/LICENSE
}
