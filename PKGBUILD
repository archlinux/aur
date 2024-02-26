# Maintainer: Andrew O'Neil <andy@andyofniall.net>
#
# Based on Arch gamescope package, with the following maintainers/contributors:
#   - Maxime Gauduin <alucryd@archlinux.org>
#   - Giancarlo Razzolini <grazzolini@archlinux.org>
#   - Samuel "scrufulufugus" Monson <smonson@irbash.net>
#   - PedroHLC <root@pedrohlc.com>

pkgname=gamescope-amd-color
pkgver=3.14.2
pkgrel=1
pkgdesc='SteamOS session compositing window manager, patched for experimental AMD color management'
arch=(x86_64)
url=https://github.com/ValveSoftware/gamescope
license=(BSD)

depends=(
  gcc-libs
  glibc
  glm
  libavif
  libcap.so
  libdisplay-info.so
  libdrm
  libliftoff.so
  libpipewire-0.3.so
  libwlroots.so
  libx11
  libxcb
  libxcomposite
  libxdamage
  libxext
  libxfixes
  libxkbcommon.so
  libxmu
  libxrender
  libxres
  libxtst
  libxxf86vm
  openvr
  sdl2
  vulkan-icd-loader
  wayland
  xorg-server-xwayland
)
makedepends=(
  benchmark
  git
  glslang
  meson
  ninja
  vulkan-headers
  wayland-protocols
)
optdepends=(
  'linux-amd-color: Linux kernel with experimental AMD color management enabled'
)
provides=(gamescope)
conflicts=(gamescope)

source=(
  git+https://github.com/ValveSoftware/gamescope.git#tag=${pkgver}
  amd_color_management.patch
)
b2sums=(
  'SKIP'
  'a2df86c41ba2186df5a93a689f3af8af3e5bd2c5d99712a75e893d3d9ef99a553e8503c78cee3acb496f34785728f024cf8c6fe57f88ba12a3d3a6913deddcf0'
)

prepare() {
  cd gamescope
  git submodule update --init
  meson subprojects download stb

  patch --forward --strip=1 --input="${srcdir}/amd_color_management.patch"
}

build() {
  arch-meson gamescope build \
    --wrap-mode=nofallback \
    --force-fallback-for=stb,vkroots \
    -Dpipewire=enabled
  meson compile -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build \
    --skip-subprojects
  install -Dm 644 gamescope/LICENSE -t "${pkgdir}"/usr/share/licenses/gamescope/
}
