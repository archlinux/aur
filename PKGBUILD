# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libproxy-git
pkgver=0.5.0.r0.g52a6d29
pkgrel=1
pkgdesc="A library that provides automatic proxy configuration management"
arch=('i686' 'x86_64')
url="https://libproxy.github.io/libproxy/"
license=('LGPL')
depends=('gcc-libs' 'duktape' 'glib2')
makedepends=('git' 'gi-docgen' 'gobject-introspection' 'meson' 'python' 'vala')
provides=('libproxy=$pkgver' 'libproxy.so')
conflicts=('libproxy')
source=("git+https://github.com/libproxy/libproxy.git")
sha256sums=('SKIP')


pkgver() {
  cd "libproxy"

  _tag=$(git tag -l --sort -v:refname | grep -E 'libproxy-[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^libproxy-//'
}

build() {
  cd "libproxy"

  meson setup \
    --buildtype=plain \
    --prefix="/usr" \
    --sbindir="bin" \
    "_build"
  meson compile -C "_build"
}

check() {
  cd "libproxy"

  meson test -C "_build"
}

package() {
  cd "libproxy"

  meson install -C "_build" --destdir "$pkgdir"
}
