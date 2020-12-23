# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlonux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgname=libva-minimal-git
pkgver=2.10.0
pkgrel=1
pkgdesc='Video Acceleration (VA) API for Linux'
arch=(x86_64)
url=https://01.org/linuxmedia/vaapi
license=(MIT)
depends=(
  libdrm
  libgl
  libx11
  libxext
  libxfixes
  wayland
)
makedepends=(
  git
  libglvnd
  mesa
  meson
)
optdepends=(
  'intel-media-driver: backend for Intel GPUs (>= Broadwell)'
  'libva-vdpau-driver: backend for Nvidia and AMD GPUs'
  'libva-intel-driver: backend for Intel GPUs (<= Haswell)'
)
provides=(
  libva-drm.so
  libva-glx.so
  libva-wayland.so
  libva-x11.so
  libva.so
  libva
)
conflicts=(libva)
backup=(etc/libva.conf)
source=(git+https://github.com/intel/libva.git)
sha256sums=(SKIP)

pkgver() {
    cd libva
    git describe --tags | sed 's/-/+/g'
}

build() {
  arch-meson libva build -D enable_docs=false -D enable_va_messaging=false
  ninja $NINJAFLAGS -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
  install -Dm 644 libva/COPYING -t "${pkgdir}"/usr/share/licenses/libva

  install -Dm 644 /dev/stdin "${pkgdir}"/etc/libva.conf <<END
LIBVA_MESSAGING_LEVEL=1
END
}

# vim: ts=2 sw=2 et:
