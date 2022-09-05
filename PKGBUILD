# Maintainer: Joaquín Aramendía <samsagax at gmail dot com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Giancarlo Razzolini <grazzolini@archlinux.org>
# Contributor: Samuel "scrufulufugus" Monson <smonson@irbash.net>
# Contributor: PedroHLC <root@pedrohlc.com>

_pkgname=gamescope
pkgname=gamescope-plus
pkgver=3.11.43
pkgrel=1
pkgdesc='SteamOS session compositing window manager with added patches'
arch=(x86_64)
url=https://github.com/Plagman/gamescope
license=(BSD)
conflicts=(gamescope)
provides=(gamescope)
depends=(
  gcc-libs
  glibc
  libcap.so
  libdrm
  libliftoff.so
  libpipewire-0.3.so
  libvulkan.so
  libwlroots.so
  libx11
  libxcomposite
  libxdamage
  libxext
  libxfixes
  libxkbcommon.so
  libxrender
  libxres
  libxtst
  libxxf86vm
  sdl2
  vulkan-icd-loader
  wayland
  wayland-protocols
  wlroots
  xorg-server-xwayland
)
makedepends=(
  git
  glslang
  meson
  ninja
  vulkan-headers
)
_tag=c5269642a293ce5e91d3d644ee15a3f3bcc3c5f3
source=("git+https://github.com/Plagman/gamescope.git#tag=${_tag}"
    "0001-Add-force-orientation-option.patch")
b2sums=('SKIP'
        'fccaadc42d8ea34cb0319da3d57049a7ad7d516071006700360aa3a155d91dfb28aced3b02a9e2919dc9030c789b3bb17211b574fa248cfe785e4979aa86fdfb')

prepare() {
  cd "$srcdir/$_pkgname"

  for src in "${source[@]}"; do
      src="${src%%::*}"
      src="${src##*/}"
      [[ $src = *.patch ]] || continue
      echo "Applying patch $src..."
      git apply "../$src"
  done

  meson subprojects download
}

#pkgver() {
#  cd gamescope
#  git describe --tags | sed 's/-//'
#}

build() {
  export LDFLAGS="$LDFLAGS -lrt"
  arch-meson gamescope build \
    -Dforce_fallback_for=stb \
    -Dpipewire=enabled
  meson compile -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
  install -Dm 644 gamescope/LICENSE -t "${pkgdir}"/usr/share/licenses/gamescope/
}

# vim: ts=2 sw=2 et:
