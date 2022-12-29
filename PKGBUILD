# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libinih-git
pkgver=56.r3.gd6e9d1b
pkgrel=1
pkgdesc="Simple .INI file parser in C, good for embedded systems"
arch=('i686' 'x86_64')
url="https://github.com/benhoyt/inih"
license=('BSD')
depends=('glibc')
makedepends=('git' 'meson')
provides=("libinih=$pkgver" 'libinih.so' 'libINIReader.so')
conflicts=('libinih')
options=('staticlibs')
source=("git+https://github.com/benhoyt/inih.git")
sha256sums=('SKIP')


pkgver() {
  cd "inih"

  _tag=$(git tag -l --sort -v:refname | sed '/rc[0-9]*/d' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^r//'
}

build() {
  cd "inih"

  meson setup \
    --buildtype=plain \
    --prefix="/usr" \
    --sbindir="bin" \
    -Ddefault_library=both \
    "_build"
  meson compile -C "_build"
}

check() {
  cd "inih"

  #meson test -C "_build"
}

package() {
  cd "inih"

  meson install -C "_build" --destdir "$pkgdir"
  install -Dm644 "LICENSE.txt" -t "$pkgdir/usr/share/licenses/inih"
}
