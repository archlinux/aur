# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: Giancarlo Razzolini <grazzolini@archlinux.org>
# Contributor: Samuel "scrufulufugus" Monson <smonson@irbash.net>
# Contributor: PedroHLC <root@pedrohlc.com>

pkgname=gamescope
pkgver=3.12.0
pkgrel=1
pkgdesc='SteamOS session compositing window manager'
arch=(x86_64)
url=https://github.com/Plagman/gamescope
license=(BSD)
depends=(
  gcc-libs
  glibc
  glm
  libcap.so
  libdisplay-info.so
  libdrm
  libliftoff.so
  libpipewire-0.3.so
  libvulkan.so
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
_tag=318fd75952302fb8f121c0fc9a788f38c96a9dba
source=(git+https://github.com/Plagman/gamescope.git#tag=${_tag})
b2sums=(SKIP)

prepare() {
  cd gamescope
  meson subprojects download
  sed 's/glslangValidator/glslang/g' -i src/meson.build
}

pkgver() {
  cd gamescope
  git describe --tags | sed 's/-//'
}

build() {
  export PKG_CONFIG_PATH='/usr/lib/wlroots0.15/pkgconfig'
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
