# Maintainer: Jordan Day < jordanday444 at gmail dot com >
# Contributor: Kevin MacMartin <prurigro@gmail.com>

pkgname=exomizer
pkgver=3.1.0
pkgrel=1
pkgdesc='Compresses files in a way that tries to be as efficient as possible but still allows them to be decompressed in environments where CPU speed and RAM are limited'
url='https://bitbucket.org/magli143/exomizer/wiki/Home'
license=('CUSTOM')
arch=('i686' 'x86_64')
depends=('glibc')

source=(
  "https://bitbucket.org/magli143/exomizer/wiki/downloads/$pkgname-$pkgver.zip"
  'LICENSE'
)

sha512sums=('d1411d82006deeeaf7f5423c171c85f81e968991469c16549c535e87563d75fb321d1db92addf60087120fd31bf25469b20efbdd36d23f707843d97112b5cfe4'
    '03d1bf3687622be3c305f9dd7ebe7b2b9930cadc4ed74696ac585f66e005df39ec07a7b083dd412ba8d230926d636b0562512ee6da0d2b608489a552d5471b2c'
)

prepare() {
  if [[ "$CARCH" = 'x86_64' ]]; then
    sed -i 's|mtune=i686|mtune=generic|' src/Makefile
  fi
}

build() {
  cd src
  make clean
  make
}

package() {
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  for txt in exo20info.txt exobasic10b2.txt exo31info.txt; do
    install -Dm644 "$txt" "$pkgdir/usr/share/$pkgname/$txt"
  done

  cd src

  for bin in exobasic exomizer; do
    install -Dm755 "$bin" "$pkgdir/usr/bin/$bin"
  done
}
