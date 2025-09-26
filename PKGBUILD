# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=bsdutils-git
pkgver=13.2.r1.g7e38401
pkgrel=2
pkgdesc="Alternative to GNU coreutils using software from FreeBSD"
arch=('i686' 'x86_64')
url="https://codeberg.org/dcantrell/bsdutils"
license=('BSD-3-Clause')
depends=('gcc-libs' 'glibc' 'libedit' 'libxo' 'ncurses' 'openssl')
makedepends=('git' 'byacc' 'meson')
provides=("bsdutils=$pkgver")
conflicts=('bsdutils')
source=("git+https://codeberg.org/dcantrell/bsdutils.git")
sha256sums=('SKIP')


pkgver() {
  cd "bsdutils"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "bsdutils"

  meson setup \
    --buildtype=plain \
    --prefix="/usr" \
    --sbindir="bin" \
    -Ddefault_library="both" \
    "_build"
  meson compile -C "_build"
}

check() {
  cd "bsdutils"

  #meson test -C "_build"
}

package() {
  cd "bsdutils"

  meson install -C "_build" --destdir "$pkgdir"

  install -dm755 "$pkgdir/opt/bsdutils"
  mv "$pkgdir/usr/"{bin,share/{man,misc}} "$pkgdir/opt/bsdutils"

  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/bsdutils"
}
