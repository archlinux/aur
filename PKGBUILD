# Maintainer: detiam <dehe_tian@outlook.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Giancarlo Razzolini <grazzolini@archlinux.org>
# Contributor: Samuel "scrufulufugus" Monson <smonson@irbash.net>
# Contributor: PedroHLC <root@pedrohlc.com>

pkgname=gamescope-nvidia
_pkgname=gamescope
pkgver=3.14.2
pkgrel=1
pkgdesc='SteamOS session compositing window manager (NVIDIA patch)'
arch=(x86_64)
url=https://github.com/sharkautarch/gamescope/tree/nvidia-fix
license=('BSD-2-Clause' 'BSD-3-Clause')
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
  openvr
  vulkan-icd-loader
  xorg-xwayland
  wlroots)
makedepends=(
  git
  glm
  vkroots
  glslang
  meson
  ninja
  spirv-headers
  vulkan-headers
  wayland-protocols)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(
  "git+https://github.com/ValveSoftware/gamescope.git#tag=$pkgver"
  "git+https://github.com/Joshua-Ashton/reshade.git"
  "0001-reverts-bd722f7.patch")
sha1sums=('SKIP'
          'SKIP'
          '6573136d575068266dcb67459545ab06db58758a')

prepare() {
  # apply nvidia-fix patchs from
  # https://github.com/sharkautarch/gamescope/tree/nvidia-fix
  for patch in "${source[@]}"; do
    if [[ $patch == *.patch ]]; then
      msg2 "Applying $patch"
      patch --no-backup-if-mismatch -d "$_pkgname" -Np1 < "$patch"
    fi
  done

  msg2 'Retrieving build dependencies...'
  cd gamescope

  # configure build deps
  git -c submodule.src/reshade.url="$srcdir/reshade" \
      -c submodule.thirdparty/SPIRV-Headers.update=none \
      -c submodule.subprojects/vkroots.update=none \
      -c submodule.subprojects/openvr.update=none \
      -c submodule.subprojects/wlroots.update=none \
      -c submodule.subprojects/libdisplay-info.update=none \
      -c submodule.subprojects/libliftoff.update=none \
      -c protocol.file.allow=always submodule update --init --progress

  # download meson wrap deps that can't be replaced with system one
  meson subprojects download stb

  # use system spirv-headers
  sed -i "s|'.*spirv/unified1|'/usr/include/spirv/unified1|" src/meson.build
}

pkgver() {
  git -C "$_pkgname" describe --tags | sed 's/-//'
}

build() {
  arch-meson "$_pkgname" build \
    -Dforce_fallback_for=stb \
    -Dbenchmark=disabled \
    -Dpipewire=enabled
  meson compile -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build --skip-subprojects
  install -Dm 644 "$_pkgname/LICENSE" -t "$pkgdir/usr/share/licenses/$_pkgname/"
}

# vim: ts=2 sw=2 et:
