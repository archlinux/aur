# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libsrtp-git
pkgver=2.6.0.r59.ge53e106
pkgrel=1
pkgdesc="Library for SRTP (Secure Realtime Transport Protocol)"
arch=('i686' 'x86_64')
url="https://github.com/cisco/libsrtp"
license=('BSD-3-Clause')
depends=('glibc' 'nss')
makedepends=('git' 'libpcap' 'meson')
provides=("libsrtp=$pkgver")
conflicts=('libsrtp')
options=('staticlibs')
source=("git+https://github.com/cisco/libsrtp.git")
sha256sums=('SKIP')


pkgver() {
  cd "libsrtp"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "libsrtp"

  meson setup \
    --buildtype=plain \
    --prefix="/usr" \
    --sbindir="bin" \
    -Ddefault_library="both" \
    -Dcrypto-library="nss" \
    "_build"
  meson compile -C "_build"
}

check() {
  cd "libsrtp"

  #meson test -C "_build"
}

package() {
  cd "libsrtp"

  meson install -C "_build" --destdir "$pkgdir"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/libsrtp"
}
