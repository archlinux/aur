# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
# Contributor: Emanuel Duss <emanuel.duss@gmail.com>
# Contributor: Nicolas Martyanoff <khaelin@gmail.com>
pkgname=dumpasn1
# UPDATE_STRING in dumpasn1.c [dot] last update date in dumpasn1.cfg
pkgver=20210422.20220207
pkgrel=2
epoch=1
pkgdesc="ASN.1 object dump/syntax check program"
arch=('i686' 'x86_64')
url="https://www.cs.auckland.ac.nz/~pgut001"
license=('LicenseRef-dumpasn1-custom')
depends=('glibc')
source=("dumpasn1-$pkgver.c::$url/dumpasn1.c"
        "dumpasn1-$pkgver.cfg::$url/dumpasn1.cfg")
sha256sums=('8ce8fdbf2e9b11d410b0ab4e44a6b3f89c27080113f051ec1054d230e050a0b8'
            '7f74c3915a3a712c104b6d65c6204d005384813086260d8516f7b6e969fba9cf')

prepare() {
  cd "$srcdir"

  # Create a license file from the header in the C source
  awk '
    $0 ~ /^$/ {paragraph++}
    paragraph == 0 || paragraph == 5 || paragraph == 6 {print substr($0, 4)}
    paragraph == 1 && !ellipsis {ellipsis=1; print "\n[...]"}
  ' dumpasn1-$pkgver.c > LICENSE.txt
}

build() {
  cd "$srcdir"
  gcc $CPPFLAGS $CFLAGS $LDFLAGS -o dumpasn1 dumpasn1-$pkgver.c
}

package(){
  cd "$srcdir"
  install -Dm755 dumpasn1 "$pkgdir/usr/bin/dumpasn1"
  install -Dm644 "dumpasn1-$pkgver.cfg" "$pkgdir/etc/dumpasn1/dumpasn1.cfg"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
