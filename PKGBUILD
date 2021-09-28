# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=picolibc-git
pkgver=r23682.g60c127bee
pkgrel=1
pkgdesc="A C library designed for embedded 32 and 64 bit systems"
arch=('i686' 'x86_64')
url="https://keithp.com/picolibc/"
license=('GPL')
makedepends=('git' 'glibc' 'meson')
provides=('picolibc')
conflicts=('picolibc')
options=('staticlibs')
source=("git+https://github.com/picolibc/picolibc.git")
sha256sums=('SKIP')


pkgver() {
  cd "picolibc"

  _rev=$(git rev-list --count --all)
  _hash=$(git rev-parse --short HEAD)
  printf "r%s.g%s" "$_rev" "$_hash"
}

build() {
  cd "picolibc"

  # ref: scripts/do-amd64-configure
  meson \
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

  DESTDIR="$pkgdir" meson install -C "_build"
}
