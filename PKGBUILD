# Maintainer: Martins Mozeiko <martins.mozeiko@gmail.com>

pkgname=libva-headless
pkgver=2.7.1
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
sha256sums=('9a3167c9af8c0ce10c4a46791557f934457b78fcc625111dcefaa7f30b7eb289')

build() {
  CFLAGS+=" -DENABLE_VA_MESSAGING"  # Option missing
  arch-meson "libva-${pkgver}" build -Dwith_x11=no -Dwith_glx=no -Dwith_wayland=no
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build

  install -Dm644 "libva-${pkgver}"/COPYING "${pkgdir}"/usr/share/licenses/libva/COPYING
 install -Dm 644 /dev/stdin "${pkgdir}"/etc/libva.conf <<END
LIBVA_MESSAGING_LEVEL=1
END
}
