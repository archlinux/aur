# Maintainer: Jat <chat@jat.email>

_pkgname='xorgxrdp'
pkgname="$_pkgname-git"
pkgver=0.10.3.r65.gb812e4c
pkgrel=1
pkgdesc='Xorg drivers for xrdp. Git version, devel branch.'
arch=('i686' 'x86_64' 'armv6h' 'armv7l' 'aarch64')
url='https://github.com/neutrinolabs/xorgxrdp'
license=('X11')
provides=("$_pkgname")
conflicts=("$_pkgname")
depends=('xorg-server')
makedepends=('nasm' 'xorg-server-devel' 'xrdp-git')
checkdepends=('check' 'xorg-xdpyinfo')
options=('staticlibs')
source=("git+$url#branch=devel")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"

  _tag=$(git tag -l --sort -v:refname | sed '/rc[0-9]*/d' | head -n1)
  _rev=$(git rev-list --count "$_tag"..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//; s/-/_/'
}

build() {
  cd "$srcdir/$_pkgname"

  ./bootstrap

  CFLAGS="$CFLAGS -ffat-lto-objects" \
    ./configure --prefix=/usr \
    --enable-glamor

  make
}

check() {
  cd "$srcdir/$_pkgname"

  make check
}

package() {
  cd "$srcdir/$_pkgname"

  make DESTDIR="$pkgdir" install
  install -Dm644 'COPYING' -t "$pkgdir/usr/share/licenses/$_pkgname"
}
