# Maintainer: GreenRaccoon23 <GreenRaccoon a t gmail d o t com>

pkgname=snappy-git
pkgver=r92.efb39e8
pkgrel=1
pkgdesc='A fast compressor/decompressor library'
arch=('any')
url="http://code.google.com/p/snappy/"
license=('BSD')
depends=('glibc' 'gcc-libs')
replaces=("${pkgname%-*}")
conflicts=("${pkgname%-*}" "${pkgname}")
checkdepends=('zlib')
makedepends=('git')
source=("git+https://github.com/google/${pkgname%-*}.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-*}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "${pkgname%-*}"

  ./autogen.sh

  # compile without assertions
  CXXFLAGS+=\ -DNDEBUG

  ./configure --prefix=/usr
  make
}

check() {
  # compile without assertions
  CXXFLAGS+=\ -DNDEBUG

  make -C "${pkgname%-*}" check
}

package() {
  cd "${pkgname%-*}"

  make DESTDIR="$pkgdir" install
  install -m644 -D COPYING "$pkgdir/usr/share/licenses/snappy/LICENSE"
}

# vim:set ts=2 sw=2 et: