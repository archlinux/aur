# Maintainer: artist for XLibre

_pkgname=xorgxrdp
pkgname=xlibre-$_pkgname-nvidia
pkgver=0.10.4
pkgrel=1
pkgdesc="XLibre drivers for xrdp, with NVIDIA GPU support."
arch=('aarch64' 'i686' 'x86_64')
url="https://github.com/neutrinolabs/xorgxrdp"
license=('X11')
depends=('glibc' 'xlibre-xserver')
makedepends=('nvidia-utils' 'libxfont2' 'nasm' 'xorg-server-devel' 'xrdp' 'git')
conflicts=($_pkgname)
provides=($_pkgname)
options=('staticlibs')
source=("git+https://github.com/neutrinolabs/xorgxrdp#branch=gfx_mainline_merge")
sha256sums=('SKIP')
validpgpkeys=('61ECEABBF2BB40E3A35DF30A9F72CDBC01BF10EB')  # Koichiro IWAO <meta@vmeta.jp>

prepare() {
  cd "$_pkgname"

  busid=$(nvidia-xconfig --query-gpu-info | grep -im1 busid | awk '{print $NF}')
  perl -i -pe 's/(?<=BusID ").+(?=")/'"$busid"'/' xrdpdev/xorg_nvidia.conf
}

build() {
  cd "$_pkgname"

  ./bootstrap

  CFLAGS="$CFLAGS -ffat-lto-objects $(pkgconf --cflags-only-I libdrm)"
  sed -i 's|moduledir=`pkg-config xorg-server --variable=moduledir`|moduledir="/usr/lib/xorg/modules/xlibre-25.0"|' configure
  ./configure \
    --prefix="/usr"

  make
}

check() {
  cd "$_pkgname"

  #make check
}

package() {
  cd "$_pkgname"

  make DESTDIR="$pkgdir" install
  install -Dm644 "COPYING" -t "$pkgdir/usr/share/licenses/$_pkgname"
}

