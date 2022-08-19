# Maintainer: Joaquín Aramendía <samsagax at gmail dot com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Giancarlo Razzolini <grazzolini@archlinux.org>
# Contributor: Samuel "scrufulufugus" Monson <smonson@irbash.net>
# Contributor: PedroHLC <root@pedrohlc.com>

_pkgname=gamescope
pkgname=gamescope-plus
pkgver=3.11.36
pkgrel=4
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
_tag=cb59480be00a28bbd7462df6abd17d4c752121f0
source=("git+https://github.com/Plagman/gamescope.git#tag=${_tag}"
    "0001-Add-force-orientation-option.patch")
b2sums=('SKIP'
        '430d0ce727e2c61ea7dbc8f242f6a995e73c398416e72a81f76beb2bc3afb632ff5d92e33b10c4881b9e8d0b1e7bcce3b966d4d3102eeb6ff0054e6c1264d6b5')

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
