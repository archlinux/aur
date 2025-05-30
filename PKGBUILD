# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=xf86-video-vmware-git
pkgver=13.4.0.r6.g92cc453
pkgrel=2
pkgdesc="VMware guest video driver for the Xorg X server"
arch=('i686' 'x86_64')
url="https://gitlab.freedesktop.org/xorg/driver/xf86-video-vmware"
license=('LicenseRef-xf86-video-vmware')
groups=('xorg-drivers')
depends=('glibc' 'libdrm' 'libxext' 'libx11' 'mesa' 'systemd-libs')
makedepends=('git' 'xorg-server-devel' 'X-ABI-VIDEODRV_VERSION=25.2')
provides=("xf86-video-vmware=$pkgver")
conflicts=('xf86-video-vmware' 'xorg-server<21.1.1' 'X-ABI-VIDEODRV_VERSION<25' 'X-ABI-VIDEODRV_VERSION>=26')
source=("git+https://gitlab.freedesktop.org/xorg/driver/xf86-video-vmware.git")
sha256sums=('SKIP')


pkgver() {
  cd "xf86-video-vmware"

  _tag=$(git tag -l --sort -v:refname | grep -E '^xf86-video-vmware-[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^xf86-video-vmware-//'
}

build() {
  cd "xf86-video-vmware"

  NOCONFIGURE=1 ./autogen.sh
  ./configure \
    --prefix="/usr" \
    --enable-vmwarectrl-client
  make
}

check() {
  cd "xf86-video-vmware"

  #make check
}

package() {
  cd "xf86-video-vmware"

  make DESTDIR="$pkgdir" install
  install -Dm644 "COPYING" -t "$pkgdir/usr/share/licenses/xf86-video-vmware"
}
