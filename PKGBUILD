# Maintainer: artist for XLibre

_pkgname=xorgxrdp
pkgname=xlibre-xorgxrdp-glamor
pkgver=0.10.4
pkgrel=1
pkgdesc="XLibre drivers for xrdp, with glamor enabled. Only works on Intel and AMD GPUs."
arch=('i686' 'x86_64' 'armv6h' 'armv7l' 'aarch64')
url="https://github.com/neutrinolabs/xorgxrdp"
license=('X11')
provides=("$_pkgname" "$_pkgname-glamor")
conflicts=("$_pkgname" "$_pkgname-glamor")
depends=('xlibre-xserver')
makedepends=('nasm' 'xorg-server-devel' 'xrdp')
checkdepends=('check' 'xorg-xdpyinfo')
options=('staticlibs')
source=(
  "$url/archive/refs/tags/v$pkgver.tar.gz"
  'glamor.patch'
)
sha256sums=('b4168992159f8f0148d10d7207ff8de51924cc40671cc28942a82e7bf07ef41e'
            '0aa0b27b66122217bd6ca2466496fe3be8738c4debe247f9af7fdaa08487622e')

prepare() {
  cd "$srcdir/$_pkgname-$pkgver"

  # https://github.com/neutrinolabs/xrdp/issues/1029#issuecomment-724105386
  patch -p1 -i"$srcdir/glamor.patch"
}

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  ./bootstrap

  sed -i 's|moduledir=`pkg-config xorg-server --variable=moduledir`|moduledir="/usr/lib/xorg/modules/xlibre-25.0"|' configure
  LDFLAGS+=" -L/usr/lib/xorg/modules/xlibre-25.0"
  CFLAGS="$CFLAGS -ffat-lto-objects $(pkgconf --cflags-only-I libdrm)"
  ./configure --prefix=/usr \
    --enable-glamor

  make
}

check() {
  cd "$srcdir/$_pkgname-$pkgver"

  # https://github.com/neutrinolabs/xorgxrdp/pull/308
  #XORG=/usr/lib/Xorg make check
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
  install -Dm644 'COPYING' -t "$pkgdir/usr/share/licenses/$_pkgname"
}

