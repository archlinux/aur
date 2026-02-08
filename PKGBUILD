# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=gftp-git
pkgver=2.0.19.r570.g75961e6
pkgrel=1
pkgdesc="Free multithreaded file transfer client"
arch=('i686' 'x86_64')
url="https://www.gftp.org/"
license=('MIT')
depends=('glibc' 'gtk3' 'openssl' 'readline')
makedepends=('git' 'meson')
provides=("gftp=$pkgver")
conflicts=('gftp')
source=("git+https://github.com/masneyb/gftp.git")
sha256sums=('SKIP')


pkgver() {
  cd "gftp"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count "$_tag"..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "gftp"

  meson setup \
    --buildtype=plain \
    --prefix="/usr" \
    --sbindir="bin" \
    -Dgtk2="false" \
    -Dgtk3="true" \
    "_build"
  meson compile -C "_build"
}

package() {
  cd "gftp"

  meson install -C "_build" --destdir "$pkgdir"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/gftp"
}
