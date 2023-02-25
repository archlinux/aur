# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=libva-git
pkgver=2.17.0.r24.g97cbc87c
pkgrel=1
pkgdesc='Video Acceleration (VA) API for Linux (git version)'
arch=('x86_64')
url='https://01.org/linuxmedia/vaapi/'
license=('MIT')
depends=('libdrm' 'libgl' 'libx11' 'libxext' 'libxfixes' 'wayland')
makedepends=('git' 'libglvnd' 'mesa' 'meson')
optdepends=('intel-media-driver: backend for Intel GPUs (Broadwell and later)'
            'libva-intel-driver: backend for Intel GPUs (up until Haswell)'
            'libva-mesa-driver: backend for NVIDIA and AMD GPUs')
provides=('libva' 'libva-drm.so' 'libva-glx.so' 'libva-wayland.so'
          'libva-x11.so' 'libva.so')
conflicts=('libva')
backup=('etc/libva.conf')
source=('git+https://github.com/intel/libva.git')
sha256sums=('SKIP')

pkgver() {
    local _version
    _version="$(git -C libva tag --list --sort='-v:refname' | grep -E '^[0-9]+\.[0-9]+(\.[0-9]+)*$' | sort -rV | head -n1)"
    printf '%s.r%s.g%s' "$_version" \
                        "$(git -C libva rev-list --count "${_version}..HEAD")" \
                        "$(git -C libva rev-parse --short HEAD)"
}

build() {
    export CFLAGS+=' -DENABLE_VA_MESSAGING'
    arch-meson libva build
    meson compile -C build
}

package() {
    meson install -C build --destdir "$pkgdir"
    install -D -m644 libva/COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -D -m644 /dev/stdin "${pkgdir}/etc/libva.conf" <<__EOF__
LIBVA_MESSAGING_LEVEL=1
__EOF__
}
