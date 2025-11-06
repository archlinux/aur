# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=xorgxrdp-devel-git
pkgver=0.10.4.r98.g8ed4c45
pkgrel=1
pkgdesc="Xorg drivers for xrdp"
arch=('aarch64' 'i686' 'riscv64' 'x86_64')
url="https://github.com/neutrinolabs/xorgxrdp"
license=('X11')
depends=('glibc' 'xorg-server')
makedepends=('git' 'libxfont2' 'nasm' 'xorg-server-devel' 'xrdp')
provides=("xorgxrdp=$pkgver")
conflicts=('xorgxrdp')
options=('staticlibs')
source=("git+https://github.com/neutrinolabs/xorgxrdp.git#branch=devel")
sha256sums=('SKIP')


pkgver() {
  cd "xorgxrdp"

  _tag=$(git tag -l --sort -v:refname | sed '/rc[0-9]*/d' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "xorgxrdp"

  ./bootstrap
  CFLAGS="$CFLAGS -ffat-lto-objects" \
  ./configure \
    --prefix="/usr" \
    --enable-glamor
  make
}

check() {
  cd "xorgxrdp"

  #make check
}

package() {
  cd "xorgxrdp"

  make DESTDIR="$pkgdir" install
  install -Dm644 "COPYING" -t "$pkgdir/usr/share/licenses/xorgxrdp"
}
