# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>
# Previous maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=libvdpau-git
pkgver=1.5.r1.g2afa3f9
pkgrel=1
pkgdesc="Video Decode and Presentation API for UNIX"
arch=('i686' 'x86_64')
url="https://www.freedesktop.org/wiki/Software/VDPAU/"
license=('MIT')
depends=('glibc' 'libx11' 'libxext')
makedepends=('git' 'meson' 'xorgproto')
optdepends=(
  'libvdpau-va-gl: driver using VAAPI'
  'nvidia-utils: driver for NVIDIA'
)
provides=("libvdpau=$pkgver" 'libvdpau.so')
conflicts=('libvdpau')
backup=('etc/vdpau_wrapper.cfg')
source=("git+https://gitlab.freedesktop.org/vdpau/libvdpau.git")
sha256sums=('SKIP')


pkgver() {
  cd "libvdpau"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count "$_tag"..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "libvdpau"

  meson setup \
    --buildtype=plain \
    --prefix="/usr" \
    --sbindir="bin" \
    "_build"
  meson compile -C "_build"
}

check() {
  cd "libvdpau"

  #meson test -C "_build"
}

package() {
  cd "libvdpau"

  meson install -C "_build" --destdir "$pkgdir"
  install -Dm644 "COPYING" -t "$pkgdir/usr/share/licenses/libvdpau"
}
