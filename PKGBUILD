# Maintainer: Andrew O'Neil <andy@andyofniall.net>
#
# Based on Arch gamescope package, with the following maintainers/contributors:
#   - Maxime Gauduin <alucryd@archlinux.org>
#   - Giancarlo Razzolini <grazzolini@archlinux.org>
#   - Samuel "scrufulufugus" Monson <smonson@irbash.net>
#   - PedroHLC <root@pedrohlc.com>

pkgname=gamescope-amd-color
pkgver=3.14.2
pkgrel=2
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
  openvr_2_only.patch
)
b2sums=(
  'SKIP'
  'a2df86c41ba2186df5a93a689f3af8af3e5bd2c5d99712a75e893d3d9ef99a553e8503c78cee3acb496f34785728f024cf8c6fe57f88ba12a3d3a6913deddcf0'
  'e8f886757d1e4fe690de583de007bfec812a19e87c91a7349e84eb94b0ef6f4bb9a9d71c81045164efdb680e23cf4d47e24f6f706dd9c1ee2f0385a9d12f3432'
)


prepare() {
  cd gamescope
  git submodule update --init
  meson subprojects download stb

  patch --forward --strip=1 --input="${srcdir}/amd_color_management.patch"
  patch --forward --strip=1 --input="${srcdir}/openvr_2_only.patch"
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
