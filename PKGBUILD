# Maintainer: Jat <chat@jat.email>

_pkgname=xorgxrdp
pkgname=xorgxrdp-nvidia-git
pkgver=0.2.15.r12.g37d8ae7
pkgrel=1
pkgdesc="Xorg drivers for xrdp, with NVIDIA GPU support."
arch=('i686' 'x86_64')
url="https://github.com/neutrinolabs/xorgxrdp"
license=('MIT')
provides=('xorgxrdp')
conflicts=('xorgxrdp')
depends=('nvidia')
makedepends=('git' 'nasm' 'xorg-server-devel' 'xrdp-git')
options=('staticlibs')
source=('git+https://github.com/Nexarian/xorgxrdp.git#branch=resize_wyhash_egfx_nvidia_features')
sha256sums=('SKIP')
install="$pkgname.install"

pkgver() {
    cd "$_pkgname"

    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"

  busid=$(nvidia-xconfig --query-gpu-info | grep -im1 busid | awk '{print $NF}')
  sed -i 's/Identifier "layout"/Identifier "X11 Server"/
  /Section "ServerFlags"/a \ \ Option "DefaultServerLayout" "X11 Server"
  s/BusID "PCI:2:0:0"/BusID "'"$busid"'/' xrdpdev/xorg_nvidia.conf
}

build() {
  cd "$_pkgname"

  ./bootstrap
  ./configure --prefix="/usr"
  make
}

package() {
  cd "$_pkgname"

  make DESTDIR="$pkgdir" install
  install -Dm644 "COPYING" -t "$pkgdir/usr/share/licenses/$_pkgname"
}
