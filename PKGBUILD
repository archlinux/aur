# Maintainer: Joaquín Aramendía <samsagax at gmail dot com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Giancarlo Razzolini <grazzolini@archlinux.org>
# Contributor: Samuel "scrufulufugus" Monson <smonson@irbash.net>
# Contributor: PedroHLC <root@pedrohlc.com>

_pkgname=gamescope
pkgname=gamescope-plus
pkgver=3.11.51.plus.1
pkgrel=1
pkgdesc='SteamOS session compositing window manager with added patches'
arch=(x86_64)
url=https://github.com/Samsagax/gamescope
license=(BSD)
conflicts=(gamescope)
provides=(gamescope)
depends=(
  gcc-libs
  glibc
  libcap.so
  libdrm
  libinput
  libliftoff.so
  libpipewire-0.3.so
  libseat.so
  libvulkan.so
  #libwlroots.so
  libx11
  libxcb
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
  #wlroots
  xorg-server-xwayland
  xcb-util-errors
  xcb-util-renderutil
  xcb-util-wm
)
makedepends=(
  git
  glslang
  meson
  ninja
  vulkan-headers
)
_tag=719057a0513a77d99b7a70d53cf19e5d33005601
source=("git+https://github.com/Samsagax/gamescope.git#tag=${_tag}")

b2sums=('SKIP')

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

pkgver() {
  cd gamescope
  git describe --tags | sed 's/\-/\./g'
}

build() {
  export LDFLAGS="$LDFLAGS -lrt"
  arch-meson gamescope build \
    -Dforce_fallback_for=stb \
    -Dpipewire=enabled
  meson compile -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build --skip-subprojects
  install -Dm 644 gamescope/LICENSE -t "${pkgdir}"/usr/share/licenses/gamescope/
}

# vim: ts=2 sw=2 et:
