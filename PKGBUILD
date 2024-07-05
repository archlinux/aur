# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>
# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Bartłomiej Piotrowski <nospam@bpiotrowski.pl>

pkgname=nodejs-git
pkgver=22.4.0.r616.g88beb76e5c1
pkgrel=1
pkgdesc="JavaScript runtime built on Chrome's V8 JavaScript engine"
arch=('i686' 'x86_64')
url="https://nodejs.org/"
license=('MIT')
depends=('glibc' 'c-ares' 'brotli' 'icu' 'libnghttp2' 'libnghttp3' 'libngtcp2' 'libuv' 'openssl' 'sqlite' 'zlib')
makedepends=('git' 'procps-ng' 'python')
optdepends=('npm: nodejs package manager')
provides=("nodejs=$pkgver")
conflicts=('nodejs')
options=('!lto')
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
    --shared-cares \
    --shared-libuv \
    --shared-nghttp2 \
    --shared-nghttp3 \
    --shared-ngtcp2 \
    --shared-openssl \
    --shared-sqlite \
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
