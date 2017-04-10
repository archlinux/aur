# Maintainer: Jordan Day < jordanday444 at gmail dot com >
# Contributor: Kevin MacMartin <prurigro@gmail.com>

pkgname=exomizer
pkgver=2.0.9
pkgrel=2
pkgdesc='Compresses files in a way that tries to be as efficient as possible but still allows them to be decompressed in environments where CPU speed and RAM are limited'
url='https://bitbucket.org/magli143/exomizer/wiki/Home'
license=('CUSTOM')
arch=('i686' 'x86_64')
depends=('glibc')

source=(
  "https://bitbucket.org/magli143/exomizer/wiki/downloads/$pkgname${pkgver//\.}.zip"
  'LICENSE'
)

sha512sums=(
  'cdbff2043fbe3026d46a5b5a9246638fbd3927eb0d7431c2908f4cae13622ad1ff44b9d8b8cb99f7e8f9cf8ea2b7daa72fe8dfe5e7f14492c74f48af474746e9'
  '89fc74104df3b5dba39d0e31add3486e2c2b2177b4362e822092f5acec70b5bc59ea3713faca1cfeab426748f8ae0e75c2a3c7387a4f6be136014783f7db3a46'
)

prepare() {
  if [[ "$CARCH" = 'x86_64' ]]; then
    sed -i 's|mtune=i686|mtune=x86-64|' src/Makefile
  fi
}

build() {
  cd src
  make clean
  make
}

package() {
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  for txt in exo20info.txt exobasic10b2.txt; do
    install -Dm644 "$txt" "$pkgdir/usr/share/$pkgname/$txt"
  done

  cd src

  for bin in b2membuf exobasic exomizer exoraw; do
    install -Dm755 "$bin" "$pkgdir/usr/bin/$bin"
  done
}
