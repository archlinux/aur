# Contributor: Barry <brrtsm at gmail dot com>
# Contributor: Joerg Schuck <joerg_schuck at web dot de>
# Contributor: Tyler <tjb0607 at gmail dot com>
# Contributor: Austin <doorknob60 at gmail dot com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=gif2apng
pkgver=1.9
pkgrel=2
pkgdesc="Tool for disassembling apng files"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/$pkgname/"
license=('zlib')
depends=(
  'libpng'
  'zlib'
  'gcc-libs'
  'glibc'
)
makedepends=('dos2unix')
source=(
  "http://sourceforge.net/projects/$pkgname/files/${pkgver}/$pkgname-${pkgver}-src.zip"
  '10-7z.patch'
  'CVE-2021-45909.patch'
  'CVE-2021-45910.patch'
  'CVE-2021-45911.patch'
)
sha512sums=('6f161699aad949466c60e0fb6abb2f38e7ec8353dd15e65ccb9944a66dabc5a4acf32523cb64073c73290e54cc2b753db68123c14f3f7789343491a4f65dcd2c'
            '515f5d1edd226095c9d22b739fe5b853df178f172ca96a88c166a76e7bcbd44120da26d74cda4aed024a20e5204fedacee34e0d628f6f6a191488be85f63acd7'
            '999f019b5dafc200447499e8f2dac51e658b2cc144674c4dea6edc007a91c65b7c09594ed0296222c48eee68ca61944c4d6548b9f4e11cae3965cef6b1426482'
            '55320de53df26b5e1a154639364d09b8468dd7962dc62f5f093dfbbed6f59e07f0b74946f616fc046d4afdb045d92e5258346f4a30517af2e7c4b383e89630ec'
            'bf9334d4ffa613ff1a6b957d5fb2ffdd50b093874678ffaf3a4db76452d536fad65bb800fd70892324654400bce02411f19b55dd64a210b68d3afb365b41971e')

prepare() {
  cd "$srcdir"
  echo "Fixing line endings in source file"
  dos2unix "${pkgname}.cpp"
  echo "Applying patches from debian"
  patch --no-backup-if-mismatch -p1 < "CVE-2021-45911.patch"
  patch --no-backup-if-mismatch -p1 < "CVE-2021-45910.patch"
  patch --no-backup-if-mismatch -p1 < "CVE-2021-45909.patch"
  patch --no-backup-if-mismatch -p1 < "10-7z.patch"
}

build() {
  cd "$srcdir"
  make LDFLAGS+=" -Wall -pedantic -g -Wl,-z,relro,-z,now"
}

package() {
  cd "$srcdir"
  install -Dm755 "$pkgname" -t "$pkgdir"/usr/bin/
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  head -29  $pkgname.cpp > "$pkgdir"/usr/share/licenses/$pkgname/zlib.license
}
