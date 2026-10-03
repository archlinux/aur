# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=faac-git
pkgver=2.2.r2.g01df1d8
pkgrel=1
pkgdesc="An MPEG-4 and MPEG-2 AAC encoder"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/faac/"
license=('LGPL-2.0-or-later')
depends=('glibc')
makedepends=('git' 'meson')
provides=("faac=$pkgver" 'libfaac.so')
conflicts=('faac')
source=("git+https://github.com/knik0/faac.git")
sha256sums=('SKIP')


pkgver() {
  cd "faac"

  _tag=$(git tag -l --sort -v:refname | grep -E '^faac-[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count "$_tag"..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^faac-//'
}

build() {
  cd "faac"

  meson setup \
    --buildtype=plain \
    --prefix="/usr" \
    --sbindir="bin" \
    "_build"
  meson compile -C "_build"
}

check() {
  cd "faac"

  #meson test -C "_build"
}

package() {
  cd "faac"

  meson install -C "_build" --destdir "$pkgdir"
  install -Dm644 "COPYING" -t "$pkgdir/usr/share/licenses/faac"
}
