# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=http-parser-git
pkgver=2.7.1.r13.g5c2d339
pkgrel=1
pkgdesc="Parser for HTTP Request/Response written in C"
arch=('i686' 'x86_64' 'armv7h')
url="https://github.com/nodejs/http-parser"
license=('MIT')
depends=('glibc')
makedepends=('git')
conflicts=('http-parser')
provides=('http-parser')
source=("$pkgname::git+https://github.com/nodejs/http-parser.git")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags --long | sed -r 's/^[a-z]*-?//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd $pkgname
  make library
}

check() {
  cd $pkgname
  local CPPFLAGS="${CPPFLAGS/-D_FORTIFY_SOURCE=2/}"
  make test
}

package() {
  cd $pkgname
  install -Dm644 LICENSE-MIT \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
  install -Dm644 AUTHORS \
        "${pkgdir}/usr/share/doc/${pkgname}/AUTHORS"
  install -Dm644 README.md \
        "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  make DESTDIR="$pkgdir/" PREFIX="/usr" install
}
