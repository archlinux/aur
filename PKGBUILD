# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>
# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Bartłomiej Piotrowski <nospam@bpiotrowski.pl>

pkgname=nodejs-git
pkgver=14.14.0.r1864.g6f34498148
pkgrel=1
pkgdesc="JavaScript runtime built on Chrome's V8 JavaScript engine"
arch=('i686' 'x86_64')
url="https://nodejs.org/"
license=('MIT')
depends=('glibc' 'brotli' 'icu' 'libnghttp2' 'libuv' 'openssl' 'zlib')  # c-ares http-parser
makedepends=('git' 'procps-ng' 'python')
optdepends=('npm: nodejs package manager')
provides=('nodejs')
conflicts=('nodejs')
source=("git+https://github.com/nodejs/node.git")
sha256sums=('SKIP')


pkgver() {
  cd "node"

  _tag=$(git tag -l --sort -v:refname | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//;s/-/./g'
}

build() {
  cd "node"

  ./configure \
    --prefix="/usr" \
    --with-intl=system-icu \
    --without-npm \
    --shared-brotli \
    --shared-libuv \
    --shared-nghttp2 \
    --shared-openssl \
    --shared-zlib
  make
}

check() {
  cd "node"

  #make test
}

package() {
  cd "node"

  make DESTDIR="$pkgdir" install

  install -d "$pkgdir/usr/share/doc/nodejs"
  cp -r "doc/api" "$pkgdir/usr/share/doc/nodejs"

  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/nodejs"
}
