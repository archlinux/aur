# Maintainer: Marcin Serwin <marcin.serwin0@protonmail.com>

pkgname=diohsc
pkgver=0.1.12
pkgrel=3
pkgdesc="Line-based command-oriented interactive client for the gemini protocol"
url="https://mbays.sdf.org/diohsc"
license=("GPL3")
arch=('x86_64')
depends=('ghc-libs' 'haskell-asn1-encoding' 'haskell-asn1-types' 'haskell-cryptonite' 'haskell-data-default-class' 'haskell-data-hash' 'haskell-drunken-bishop' 'haskell-hourglass' 'haskell-iconv' 'haskell-memory' 'haskell-mime' 'haskell-network' 'haskell-network-simple' 'haskell-network-uri' 'haskell-pem' 'haskell-regex-compat' 'haskell-rset' 'haskell-safe' 'haskell-temporary' 'haskell-terminal-size' 'haskell-tls' 'haskell-x509' 'haskell-x509-store' 'haskell-x509-validation')
makedepends=('ghc' 'pandoc-cli')
source=("https://hackage.haskell.org/packages/archive/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('5203e5e20ff0e687667173737db2a1b53d96feddf0a3f7ac708b255eeaf0ce7d')

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
  rm -f "$pkgdir"/usr/share/doc/$pkgname/COPYING
}