# Maintainer: katt <magunasu.b97@gmail.com>
# Contributor: Martins Mozeiko <martins.mozeiko@gmail.com>

pkgname=libva-headless
pkgver=2.23.0
pkgrel=1
pkgdesc='Video Acceleration (VA) API for Linux headless systems'
arch=(i686 x86_64 armv7h aarch64)
url=https://01.org/linuxmedia/vaapi
license=(MIT)
depends=(libdrm)
makedepends=(meson git)
conflicts=("${pkgname%-headless}")
provides=("${pkgname%-headless}" libva.so libva-drm.so)
optdepends=(
    'intel-media-driver: backend for Intel GPUs (>= Broadwell)'
    'libva-intel-driver: backend for Intel GPUs (<= Haswell)'
    'libva-mesa-driver: backend for AMD and Nvidia GPUs'
)
backup=(etc/libva.conf)
source=(git+https://github.com/intel/libva.git#tag="$pkgver")
sha256sums=('1819b31a1ae54957db182ed1d1ea119965f02d262b70e9dc81ca1ee133b6f9d4')

build() {
    CFLAGS+=" -DENABLE_VA_MESSAGING" # Option missing
    arch-meson libva build -Dwith_x11=no -Dwith_glx=no -Dwith_wayland=no
    meson compile -C build
}

package() {
    meson install -C build --destdir "${pkgdir}"
    install -Dm 644 libva/COPYING -t "${pkgdir}"/usr/share/licenses/"${pkgname}"
    install -Dm 644 /dev/stdin "${pkgdir}"/etc/libva.conf <<END
LIBVA_MESSAGING_LEVEL=1
END
}
