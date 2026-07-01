# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgbase=librecrypt
pkgname=($pkgbase $pkgbase-doc $pkgbase-musl)
pkgver=1.1.1
pkgrel=1
_pkgdesc="Offline-hardenable password hashing"
pkgdesc="${_pkgdesc}"
arch=(i686 x86_64 aarch64)
url="https://codeberg.org/maandree/librecrypt"
license=('custom:ISC')
depends=()
checkdepends=(glibc musl 'libar2>=1.1' 'libar2-musl>=1.1' 'libar2simplified>=1.1.4' 'libar2simplified-musl>=1.1.4')
_compiler=gcc
makedepends=(glibc musl 'libar2>=1.1' 'libar2-musl>=1.1' 'libar2simplified>=1.1' 'libar2simplified-musl>=1.1' ${_compiler})
source=($pkgbase-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(61838169a2c31c574a87a5949c4accf8aacbe2c9460a1d13e669c5e0a34009c3)

build() {
  cd -- "$srcdir"
  cp -r -- "$pkgbase" "$pkgbase-musl"
  cd -- "$pkgbase"
  make PREFIX=/usr WITH_BACKTRACE=false
  cd -- "../$pkgbase-musl"
  make PREFIX=/usr/lib/musl CC="musl-${_compiler} -std=c99" C17="musl-${_compiler} -std=c17" WITH_BACKTRACE=false
}

check() {
  cd -- "$srcdir/$pkgbase"
  make WITH_BACKTRACE=false check
  cd -- "../$pkgbase-musl"
  make CC="musl-${_compiler} -std=c99" C17="musl-${_compiler} -std=c17" WITH_BACKTRACE=false check
}

package_librecrypt() {
  pkgdesc="${_pkgdesc}"
  depends=(glibc 'libar2>=1.1' 'libar2simplified>=1.1')

  cd -- "$srcdir/$pkgbase"
  make PREFIX=/usr DESTDIR="$pkgdir" install
  rm -r -- "${pkgdir}/usr/share"
}

package_librecrypt-doc() {
  pkgdesc="${_pkgdesc} (documentation)"

  cd -- "$srcdir/$pkgbase"
  make PREFIX=/usr DESTDIR="$pkgdir" install
  rm -r -- "${pkgdir}/usr/lib"
  rm -r -- "${pkgdir}/usr/include"
}

package_librecrypt-musl() {
  pkgdesc="${_pkgdesc} (musl version)"
  depends=(musl 'libar2-musl>=1.1' 'libar2simplified-musl>=1.1')

  cd -- "$srcdir/$pkgbase-musl"
  make PREFIX=/usr/lib/musl DESTDIR="$pkgdir" install
  rm -r -- "${pkgdir}/usr/lib/musl/share"
}
