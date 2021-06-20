# Maintainer: Martins Mozeiko <martins.mozeiko@gmail.com>

pkgname=libva-headless
pkgver=2.12.0
pkgrel=1
pkgdesc='Video Acceleration (VA) API for Linux headless systems'
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url='https://github.com/intel/libva'
license=('MIT')
conflicts=('libva')
provides=('libva')
depends=('libdrm')
makedepends=('meson')
optdepends=(
  'intel-media-driver: backend for Intel GPUs (>= Broadwell)'
  'libva-vdpau-driver: backend for Nvidia and AMD GPUs'
  'libva-intel-driver: backend for Intel GPUs (<= Haswell)'
)
backup=(etc/libva.conf)
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('7bca8c8a854653e15e602f243e2452e84e4b454b26549bf80a932ab29d7d6b21')

build() {
  CFLAGS+=" -DENABLE_VA_MESSAGING"  # Option missing
  arch-meson "libva-${pkgver}" "libva-${pkgver}.build" -Dwith_x11=no -Dwith_glx=no -Dwith_wayland=no
  ninja -C "libva-${pkgver}.build"
}

package() {
  DESTDIR="${pkgdir}" meson install -C "libva-${pkgver}.build"

  install -Dm644 "libva-${pkgver}"/COPYING "${pkgdir}"/usr/share/licenses/libva/COPYING
  install -Dm 644 /dev/stdin "${pkgdir}"/etc/libva.conf <<END
LIBVA_MESSAGING_LEVEL=1
END
}
