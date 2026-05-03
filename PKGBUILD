# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=checkasm-git
pkgver=1.1.0.r98.g3f3c74c
pkgrel=1
pkgdesc="A tool for verifying the correctness of assembly code, as well as performance benchmarking"
arch=('i686' 'x86_64')
url="https://checkasm.videolan.me/"
license=('BSD-2-Clause')
depends=('glibc')
makedepends=('git' 'meson' 'nasm')
provides=("checkasm=$pkgver" 'libcheckasm.so')
conflicts=('checkasm')
options=('staticlibs')
source=("git+https://code.videolan.org/videolan/checkasm.git")
sha256sums=('SKIP')


pkgver() {
  cd "checkasm"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count "$_tag"..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "checkasm"

  meson setup \
    --buildtype=plain \
    --prefix="/usr" \
    --sbindir="bin" \
    -Ddefault_library="both" \
    "_build"
  meson compile -C "_build"
}

check() {
  cd "checkasm"

  #meson test -C "_build"
}

package() {
  cd "checkasm"

  meson install -C "_build" --destdir "$pkgdir"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/checkasm"
}
