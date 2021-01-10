# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Maxime Gauduin <alucryd@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=lib32-libvdpau-git
pkgver=1.4
pkgrel=1
pkgdesc='Nvidia VDPAU library'
arch=(x86_64)
url=https://gitlab.freedesktop.org/vdpau/libvdpau
license=(custom)
depends=(
  lib32-libxext
  libvdpau
)
makedepends=(
  xorgproto
  git
  meson
)
source=(git+https://gitlab.freedesktop.org/vdpau/libvdpau.git)
provides=(lib32-libvdpau)
conflicts=(lib32-libvdpau)
sha256sums=(SKIP)

pkgver() {
  cd libvdpau

  git describe --tags | sed 's/-/+/g'
}

build() {
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH=/usr/lib32/pkgconfig

  arch-meson libvdpau build \
    --libdir=/usr/lib32
  ninja $NINJAFLAGS -C build
}

package() {
  DESTDIR="${pkgdir}" ninja $NINJAFLAGS -C build install
  rm -rf "${pkgdir}"/{etc,usr/include}

  install -dm 755 "${pkgdir}"/usr/share/licenses
  ln -s libvdpau "${pkgdir}"/usr/share/licenses/lib32-libvdpau
}

# vim: ts=2 sw=2 et:
