# Maintainer: Andreas Baumann <mail at andreasbaumann dot cc>

pkgname=mimetic-git
_pkgname=mimetic
pkgver=r51.2be9506
pkgrel=1
pkgdesc='A free, MIT licensed, Email library (MIME) written in C++'
arch=('i486' 'i686' 'pentium4' 'x86_64')
url="http://www.codesink.org/mimetic_mime_library.html"
license=('MIT')
provides=('mimetic')
conflicts=('mimetic')
depends=(gcc-libs)
makedepends=('git')
source=(git+https://github.com/tat/mimetic.git)
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"
  ./configure --prefix=/usr
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool # Fix overlinking
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
