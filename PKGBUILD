# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>
# Previous maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Laurent Carlier <lordheavym@gmail.com>

pkgname=glu-git
pkgver=9.0.3.r0.ga2b96c7
pkgrel=1
pkgdesc="Mesa OpenGL utility library"
arch=('i686' 'x86_64')
url="https://gitlab.freedesktop.org/mesa/glu"
license=('LGPL')
depends=('gcc-libs' 'libgl')
makedepends=('git' 'meson')
provides=("glu=$pkgver")
conflicts=('glu')
options=('staticlibs')
source=("git+https://gitlab.freedesktop.org/mesa/glu.git")
sha256sums=('SKIP')


pkgver() {
  cd "glu"

  _tag=$(git tag -l --sort -v:refname | grep -E '^glu-[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^glu-//'
}

build() {
  cd "glu"

  meson setup \
    --buildtype=plain \
    --prefix="/usr" \
    -Ddefault_library="both" \
    "_build"
  meson compile -C "_build"
}

check() {
  cd "glu"

  meson test -C "_build"
}

package() {
  cd "glu"

  meson install -C "_build" --destdir "$pkgdir"
}
