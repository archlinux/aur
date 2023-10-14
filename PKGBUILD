# Maintainer: Maxim Llorephie <aur at llorephie dot org>
pkgname=mfterm-git
pkgdesc="Terminal for working with Mifare Classic 1-4k tags"
pkgver=r148.e13d373
pkgrel=1
url="https://github.com/4ZM/mfterm"
arch=('x86_64' 'i686')
license=('GPL')
depends=('libnfc' 'readline' 'bison' 'openssl' 'flex')
makedepends=('automake')
source=("$pkgname::git+https://github.com/4ZM/mfterm.git")
md5sums=('SKIP')
provides=('mfterm')
conflicts=('mfterm')

pkgver() {
  cd "$pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  export CFLAGS="$CFLAGS -Wno-error=deprecated-declarations -Wno-error=lto-type-mismatch -Wno-error=stringop-overread -Wno-error=stringop-overflow -Wno-error=stringop-truncation"
  cd "${srcdir}/${pkgname}"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:

