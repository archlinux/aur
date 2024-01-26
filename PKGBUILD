# Maintainer: detiam <dehe_tian@outlook.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Giancarlo Razzolini <grazzolini@archlinux.org>
# Contributor: Samuel "scrufulufugus" Monson <smonson@irbash.net>
# Contributor: PedroHLC <root@pedrohlc.com>

pkgname=gamescope-nvidia
_pkgname=gamescope
pkgver=3.14.0
pkgrel=1
pkgdesc='SteamOS session compositing window manager (NVIDIA patch)'
arch=(x86_64)
url=https://github.com/sharkautarch/gamescope/tree/nvidia-fix
license=(BSD)
install="$_pkgname.install"
depends=(
  libpipewire
  libcap
  libliftoff
  libxcomposite
  libxdamage
  libxkbcommon
  libxmu
  libxres
  libxxf86vm
  sdl2
  vulkan-icd-loader
  xorg-xwayland
  wlroots)
makedepends=(
  git
  glslang
  meson
  ninja
  vkroots
  vulkan-headers
  wayland-protocols)
optdepends=(
  'openvr: require openvr 2.0 for vr')
provides=(
  "$_pkgname")
conflicts=(
  "$_pkgname")
source=(
  "git+https://github.com/ValveSoftware/gamescope.git#tag=$pkgver"
  "git+https://github.com/Joshua-Ashton/reshade.git"
  "git+https://github.com/KhronosGroup/SPIRV-Headers.git"
  "0001-reverts-bd722f7.patch")
b2sums=('SKIP'
        'SKIP'
        'SKIP'
        'a8ee82c988cfcbaca755421020443034d07c3417546d5a41c39c8709cb1abbef5c0c0ad273ddd3e3d44a650f0bdaf7bf81fad02436937ef7389051efc96d19d5')

prepare() {
  # apply nvidia-fix patchs from
  # https://github.com/sharkautarch/gamescope/tree/nvidia-fix
  for patch in "${source[@]}"; do
    if [[ $patch == *.patch ]]; then
      echo "applying $patch"
      patch -d "$_pkgname" -Np1 < "$patch"
    fi
  done

  # download build deps
  cd gamescope
  git -c submodule.src/reshade.url="$srcdir/reshade" \
      -c submodule.thirdparty/SPIRV-Headers.url="$srcdir/SPIRV-Headers" \
      -c submodule.subprojects/wlroots.update=none \
      -c submodule.subprojects/libdisplay-info.update=none \
      -c submodule.subprojects/libliftoff.update=none \
      -c submodule.subprojects/vkroots.update=none \
      -c protocol.file.allow=always submodule update --init --progress
  meson subprojects download stb glm
}

pkgver() {
  git -C "$_pkgname" describe --tags | sed 's/-//'
}

build() {
  arch-meson gamescope build \
    -Dforce_fallback_for=stb,glm \
    -Dbenchmark=disabled \
    -Dpipewire=enabled
  meson compile -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build --skip-subprojects
  install -Dm 644 gamescope/LICENSE -t "${pkgdir}"/usr/share/licenses/gamescope/
}

# vim: ts=2 sw=2 et:
