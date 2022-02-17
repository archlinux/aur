# Maintainer: katt <magunasu.b97@gmail.com>
# Contributor: Martins Mozeiko <martins.mozeiko@gmail.com>

pkgname=libva-headless
pkgver=2.14.0
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
    'libva-vdpau-driver: backend for Nvidia and AMD GPUs'
    'libva-intel-driver: backend for Intel GPUs (<= Haswell)'
)
backup=(etc/libva.conf)
_tag=eec9f7132d4677575f929fc1dd3babc349cc56da
source=(git+https://github.com/intel/libva.git#tag=${_tag})
sha256sums=(SKIP)

pkgver() {
    git -C libva describe --tags
}

build() {
    CFLAGS+=" -DENABLE_VA_MESSAGING" # Option missing
    arch-meson libva build -Dwith_x11=no -Dwith_glx=no -Dwith_wayland=no
    ninja -C build
}

package() {
    DESTDIR="${pkgdir}" meson install -C build
    install -Dm 644 libva/COPYING -t "${pkgdir}"/usr/share/licenses/libva

    install -Dm 644 /dev/stdin "${pkgdir}"/etc/libva.conf <<END
LIBVA_MESSAGING_LEVEL=1
END
}
