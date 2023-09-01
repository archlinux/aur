# Maintainer: Marcin Serwin <marcin.serwin0@protonmail.com>

pkgname=diohsc
pkgver=0.1.14.5
pkgrel=1
pkgdesc="Line-based command-oriented interactive client for the gemini protocol"
url="https://mbays.sdf.org/diohsc"
license=("GPL3")
arch=('x86_64')
depends=('ghc-libs' 'haskell-asn1-encoding' 'haskell-asn1-types' 'haskell-crypton' 'haskell-data-default-class' 'haskell-data-hash' 'haskell-drunken-bishop' 'haskell-hourglass' 'haskell-iconv' 'haskell-memory' 'haskell-mime' 'haskell-network' 'haskell-network-simple' 'haskell-network-uri' 'haskell-pem' 'haskell-regex-compat' 'haskell-rset' 'haskell-safe' 'haskell-temporary' 'haskell-terminal-size' 'haskell-tls' 'haskell-crypton-x509' 'haskell-crypton-x509-store' 'haskell-crypton-x509-validation')
makedepends=('ghc' 'pandoc-cli' 'ed')
source=("https://hackage.haskell.org/packages/archive/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz" "update-tls.patch")
sha256sums=('d8036ea7a38d1ec410e11c0a46a553fbd61c32da38df77aec849f75f8515d6f5'
            'ef2316d0a403afa78559caf529716561656b31788b86b54564bac599b37d81fe')

prepare() {
  cd $pkgname-$pkgver
  patch --forward --strip=1 --input="${srcdir}/update-tls.patch"
}

build() {
  cd $pkgname-$pkgver

  runhaskell Setup configure -O --enable-shared --enable-executable-dynamic --disable-library-vanilla \
    --prefix=/usr --docdir=/usr/share/doc/$pkgname --datasubdir=$pkgname --enable-tests \
    --dynlibdir=/usr/lib --libsubdir=\$compiler/site-local/\$pkgid \
    --ghc-option=-optl-Wl\,-z\,relro\,-z\,now \
    --ghc-option='-pie' \
    -f-irilinks -f-libiconv -f-magic

  runhaskell Setup build

  make diohsc.1
}

package() {
  cd $pkgname-$pkgver

  runhaskell Setup copy --destdir="$pkgdir"
  install -D -m644 diohsc.1 -t "$pkgdir"/usr/share/man/man1
  install -D -m644 diohscrc.sample -t "$pkgdir"/usr/share/doc/$pkgname
}
