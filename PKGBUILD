# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libglvnd-git
pkgver=1.7.0.r10.g908086d
pkgrel=1
pkgdesc="The GL Vendor-Neutral Dispatch library"
arch=('i686' 'x86_64')
url="https://gitlab.freedesktop.org/glvnd/libglvnd"
license=('MIT')
depends=('glibc' 'libxext' 'mesa' 'opengl-driver')
makedepends=('git' 'libx11' 'meson' 'python' 'xorgproto')
provides=("libglvnd=$pkgver" 'libegl' 'libgl' 'libgles' 'libEGL.so' 'libGL.so' 'libGLdispatch.so' 'libGLESv2.so' 'libGLX.so' 'libOpenGL.so')
conflicts=('libglvnd')
source=("git+https://gitlab.freedesktop.org/glvnd/libglvnd.git")
sha256sums=('SKIP')


pkgver() {
  cd "libglvnd"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "libglvnd"

  meson setup \
    --buildtype=plain \
    --prefix="/usr" \
    -Dgles1="false" \
    "_build"
  meson compile -C "_build"
}

check() {
  cd "libglvnd"

  meson test -C "_build"
}

package() {
  cd "libglvnd"

  meson install -C "_build" --destdir "$pkgdir"

  sed -n '/Copyright (c) 2013, NVIDIA/,/DEALINGS IN THE MATERIALS./p' "README.md" > "LICENSE"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/libglvnd"
}
