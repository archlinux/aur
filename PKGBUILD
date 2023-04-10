# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=gnurl-git
pkgver=7.72.0.r415.g66cec2eb6
pkgrel=1
pkgdesc="gnurl is a fork of curl"
arch=('i686' 'x86_64')
url="https://www.gnunet.org/en/gnurl.html"
license=('MIT')
depends=('glibc' 'gnutls' 'krb5' 'libnghttp2' 'libpsl')
makedepends=('git')
provides=("gnurl=$pkgver")
conflicts=('gnurl')
options=('staticlibs')
source=("git+https://git.taler.net/gnurl.git")
sha256sums=('SKIP')


pkgver() {
  cd "gnurl"

  _tag=$(git tag -l --sort -v:refname | grep -E '^gnurl-[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^gnurl-//'
}

build() {
  cd "gnurl"

  ./buildconf
  ./configure \
    --prefix="/usr" \
    --mandir="/usr/share/man" \
    --with-gssapi \
    --with-gnutls \
    --with-ca-bundle="/etc/ssl/certs/ca-certificates.crt" \
    --with-nghttp2
  make
}

check() {
  cd "gnurl"

  #make check
}

package() {
  cd "gnurl"

  make DESTDIR="$pkgdir" install
  install -Dm644 "COPYING" -t "$pkgdir/usr/share/licenses/gnurl"
}
