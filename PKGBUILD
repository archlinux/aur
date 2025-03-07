# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>
# Previous maintainer:  Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Chiu-Hsiang Hsu <wdv4758h@gmail.com>

pkgname=musl-git
pkgver=1.2.5.r75.gc47ad25e
pkgrel=1
pkgdesc="An implementation of the standard library for Linux-based systems"
arch=('i686' 'x86_64')
url="https://musl.libc.org/"
license=('MIT')
makedepends=('git')
provides=("musl=$pkgver")
conflicts=('musl')
options=('staticlibs' '!buildflags')
source=("git+https://git.musl-libc.org/git/musl")
sha256sums=('SKIP')


pkgver() {
  cd "musl"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "musl"

  ./configure \
    --prefix="/usr/lib/musl" \
    --exec-prefix="/usr" \
    --enable-wrapper=all \
    CFLAGS="-ffat-lto-objects"
  make
}

package() {
  cd "musl"

  make DESTDIR="$pkgdir" install

  # configure syslibdir with /lib for PT_INTERP compat, but install to /usr/lib
  mv "$pkgdir/lib"/ld-musl*.so* "$pkgdir/usr/lib"
  rmdir "$pkgdir/lib"

  install -Dm644 "README" -t "$pkgdir/usr/share/doc/musl"
  install -Dm644 "COPYRIGHT" -t "$pkgdir/usr/share/licenses/musl"
}
