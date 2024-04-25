# Maintainer: Andrew O'Neil <andy@andyofniall.net>
#
# Based on Arch gamescope package, with the following maintainers/contributors:
#   - Maxime Gauduin <alucryd@archlinux.org>
#   - Giancarlo Razzolini <grazzolini@archlinux.org>
#   - Samuel "scrufulufugus" Monson <smonson@irbash.net>
#   - PedroHLC <root@pedrohlc.com>

pkgname=gamescope-amd-color
pkgver=3.14.6
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
  '6445b507637103bde17fbf65fb3e9043bcb6b74424038f4a4c1fc7d631ce51f52ed15e297daba3d6e76891762a7ce82598501fd4a9e075f1bf41f221e82232dd'
  'e5c24512fff1ce115eb51e254eb59c696f01d6d19467afe2f835c88aaaeee1087ae75e27d87858dab5aded7878ccecf029106e0ddd5decb538da8229b29f211b'
)

install=gamescope.install

prepare() {
  cd gamescope
  git submodule update --init
  meson subprojects download stb

  patch --forward --strip=1 --input="${srcdir}/amd_color_management.patch"
}

build() {
  arch-meson gamescope build \
    --wrap-mode=nofallback \
    --force-fallback-for=stb,vkroots,wlroots \
    -Dpipewire=enabled
  meson compile -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build \
    --skip-subprojects
  install -Dm 644 gamescope/LICENSE -t "${pkgdir}"/usr/share/licenses/gamescope/
}
