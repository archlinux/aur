# Maintainer: Jat <chat@jat.email>

_pkgname=xorgxrdp
pkgname=xorgxrdp-glamor
pkgver=0.10.3
pkgrel=1
pkgdesc="Xorg drivers for xrdp, with glamor enabled. Only works on Intel and AMD GPUs."
arch=('i686' 'x86_64' 'armv6h' 'armv7l' 'aarch64')
url="https://github.com/neutrinolabs/xorgxrdp"
license=('X11')
provides=("$_pkgname")
conflicts=("$_pkgname")
depends=('xorg-server')
makedepends=('nasm' 'xorg-server-devel' 'xrdp')
checkdepends=('check' 'xorg-xdpyinfo')
options=('staticlibs')
source=(
  "$url/archive/refs/tags/v$pkgver.tar.gz"
  'glamor.patch'
)
sha256sums=(
  'd7349ab98116d367ba43d94b991bf2d47e85f063e9a32421df435be910743d2a'
  '10d289d1a11c9a5a8b4c6af534c2f9e7900ae2b4351860a063ba572010d95912'
)

prepare() {
  cd "$srcdir/$_pkgname-$pkgver"

  # https://github.com/neutrinolabs/xrdp/issues/1029#issuecomment-724105386
  patch -p1 -i"$srcdir/glamor.patch"
}

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  ./bootstrap

  CFLAGS="$CFLAGS -ffat-lto-objects" \
    ./configure --prefix=/usr \
    --enable-glamor

  make
}

check() {
  cd "$srcdir/$_pkgname-$pkgver"

  # https://github.com/neutrinolabs/xorgxrdp/pull/308
  XORG=/usr/lib/Xorg make check
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
  install -Dm644 'COPYING' -t "$pkgdir/usr/share/licenses/$_pkgname"
}
