# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: Giancarlo Razzolini <grazzolini@archlinux.org>
# Contributor: Samuel "scrufulufugus" Monson <smonson@irbash.net>
# Contributor: PedroHLC <root@pedrohlc.com>

pkgname=gamescope
pkgver=3.11.47
pkgrel=1
pkgdesc='SteamOS session compositing window manager'
arch=(x86_64)
url=https://github.com/Plagman/gamescope
license=(BSD)
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
_tag=b87660561fd3b48e55a26febac4aa5cd6b459172
source=(git+https://github.com/Plagman/gamescope.git#tag=${_tag})
b2sums=('SKIP')

prepare() {
  cd gamescope
  meson subprojects download
}

pkgver() {
  cd gamescope
  git describe --tags | sed 's/-//'
}

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
