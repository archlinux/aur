# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=picolibc-git
pkgver=1.8.1.r2.gfb045c07b
pkgrel=1
pkgdesc="A C library designed for embedded 32 and 64 bit systems"
arch=('i686' 'x86_64')
url="https://keithp.com/picolibc/"
license=('GPL')
makedepends=('git' 'glibc' 'meson')
provides=("picolibc=$pkgver")
conflicts=('picolibc')
options=('staticlibs')
source=("git+https://github.com/picolibc/picolibc.git")
sha256sums=('SKIP')


pkgver() {
  cd "picolibc"

  _tag=$(git tag -l --sort -creatordate | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "picolibc"

  # ref: scripts/do-amd64-configure
  meson setup \
    --buildtype=plain \
    --prefix="/usr" \
    --includedir="include/picolibc" \
    --libdir="lib/picolibc" \
    -Dmultilib="false" \
    "_build"
  meson compile -C "_build"
}

package() {
  cd "picolibc"

  meson install -C "_build" --destdir "$pkgdir"
}
