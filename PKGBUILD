# Maintainer: detiam <dehe_tian@outlook.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Giancarlo Razzolini <grazzolini@archlinux.org>
# Contributor: Samuel "scrufulufugus" Monson <smonson@irbash.net>
# Contributor: PedroHLC <root@pedrohlc.com>

pkgname=gamescope-nvidia-git
_pkgname=gamescope
pkgver=3.14.3.r8.gf88723f
pkgrel=1
pkgdesc='SteamOS session compositing window manager (NVIDIA patch)'
arch=(x86_64)
url=https://github.com/sharkautarch/gamescope/tree/nvidia-fix
license=('BSD-2-Clause')
install="$_pkgname.install"
depends=(
  'libpipewire'
  'libcap'
  'libliftoff'
  'libxcomposite'
  'libxdamage'
  'libxkbcommon'
  'libxmu'
  'libxres'
  'libxxf86vm'
  'seatd' # wlroots deps
  'xcb-util-errors' # wlroots deps
  'libdisplay-info' # wlroots deps
  'sdl2'
  'vulkan-icd-loader'
  'xorg-xwayland')
makedepends=(
  'git'
  'glm'
  'glslang'
  'meson'
  'ninja'
  'vulkan-headers'
  'wayland-protocols')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(
  "git+https://github.com/ValveSoftware/gamescope.git"
  "git+https://github.com/ValveSoftware/openvr.git"
  "git+https://github.com/Joshua-Ashton/reshade.git"
  "git+https://github.com/KhronosGroup/SPIRV-Headers.git"
  "git+https://github.com/Joshua-Ashton/vkroots.git"
  "git+https://github.com/Joshua-Ashton/wlroots.git"
  "git+https://github.com/nothings/stb.git"
  "reverts-bd722f7.patch")
sha1sums=('SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          '6573136d575068266dcb67459545ab06db58758a')

prepare() {
  # apply nvidia-fix patchs from
  # https://github.com/sharkautarch/gamescope/tree/nvidia-fix
  for patch in "${source[@]}"; do
    if [[ $patch == *.patch ]]; then
      msg2 "Applying $patch"
      patch --no-backup-if-mismatch -d gamescope -Np1 -i "$srcdir/$patch"
    fi
  done

  cd gamescope

  msg2 'Retrieving git build dependencies...'
  # configure build deps
  git -c submodule.src/reshade.url="$srcdir/reshade" \
      -c submodule.subprojects/vkroots.url="$srcdir/vkroots" \
      -c submodule.subprojects/wlroots.url="$srcdir/wlroots" \
      -c submodule.thirdparty/SPIRV-Headers.url="$srcdir/SPIRV-Headers" \
      -c submodule.subprojects/openvr.url="$srcdir/openvr" \
      -c submodule.subprojects/libdisplay-info.update=none \
      -c submodule.subprojects/libliftoff.update=none \
      -c protocol.file.allow=always submodule update --init --progress

  msg2 'Retrieving meson build dependencies...'
  # meson wrap deps that can't be replaced with system one
  sed -i "s|^url =.*|url = file://$srcdir/stb|" subprojects/stb.wrap
  meson subprojects download stb
}

pkgver() {
  git -C "${_pkgname}" describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson gamescope build \
    -Dforce_fallback_for=stb,vkroots \
    -Dbenchmark=disabled \
    -Dpipewire=enabled
  meson compile -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build --skip-subprojects
  install -Dm 644 gamescope/LICENSE -t "${pkgdir}"/usr/share/licenses/gamescope/
}

# vim: ts=2 sw=2 et:
