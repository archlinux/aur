# Maintainer: Joaquín Aramendía <samsagax at gmail dot com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Giancarlo Razzolini <grazzolini@archlinux.org>
# Contributor: Samuel "scrufulufugus" Monson <smonson@irbash.net>
# Contributor: PedroHLC <root@pedrohlc.com>

_pkgname=gamescope
pkgname=gamescope-plus
pkgver=3.11.45
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
_tag=215a19b0e80cfeb6219c752fcfcf719d5c913432
source=("git+https://github.com/Plagman/gamescope.git#tag=${_tag}"
        "0001-Add-force-orientation-option.patch"
        "0002-Force-orientation-only-to-internal-display.patch")
b2sums=('SKIP'
        '53ccad968f46ed022ea847d2bc60513b797a054ab105c7e67e384f1ed53cffc814be64d3a699ba0a567076c4205e4c03a07576607b82a2f4f92c0018b2482f53'
        'f0a9071917387b9025cecf8c4a818b6773947b2996240898439eb3d845a8ffc0f93404b28133a78e96ef5a43ddf00a71e39459e6e0281d5b884efdd3d339720f')

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
