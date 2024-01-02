# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>
# Previous maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Alexander Baldeck <alexander@archlinux.org>

pkgname=pixman-git
pkgver=0.42.2.r26.g7883ab8
pkgrel=1
pkgdesc="Library for pixel manipulation"
arch=('i686' 'x86_64')
url="https://www.pixman.org/"
license=('MIT')
depends=('glibc')
makedepends=('git' 'libpng' 'meson')
provides=("pixman=$pkgver" 'libpixman-1.so')
conflicts=('pixman')
options=('staticlibs')
source=("git+https://gitlab.freedesktop.org/pixman/pixman")
sha256sums=('SKIP')


pkgver() {
  cd "pixman"

  _tag=$(git tag -l --sort -v:refname | grep -E '^pixman-[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^pixman-//'
}

build() {
  cd "pixman"

  meson setup \
    --buildtype=plain \
    --prefix="/usr" \
    -Ddefault_library="both" \
    -Dgtk=disabled \
    "_build"
  meson compile -C "_build"
}

check() {
  cd "pixman"

  #meson test -C "_build"
}

package() {
  cd "pixman"

  meson install -C "_build" --destdir "$pkgdir"
  install -Dm644 "COPYING" -t "$pkgdir/usr/share/licenses/pixman"
}
