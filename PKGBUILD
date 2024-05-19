# Maintainer: detiam <dehe_tian@outlook.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Giancarlo Razzolini <grazzolini@archlinux.org>
# Contributor: Samuel "scrufulufugus" Monson <smonson@irbash.net>
# Contributor: PedroHLC <root@pedrohlc.com>

pkgname=gamescope-nvidia
_pkgname=gamescope
pkgver=3.14.16
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
  'openvr'
  'vulkan-icd-loader'
  'xorg-xwayland')
makedepends=(
  'git'
  'glm=1.0.0'
  'glslang'
  'meson'
  'cmake'
  'ninja'
  'spirv-headers'
  'vulkan-headers'
  'wayland-protocols')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(
  "$_pkgname::git+https://github.com/ValveSoftware/gamescope.git#tag=$pkgver"
  "reshade::git+https://github.com/Joshua-Ashton/reshade.git#commit=9fdbea6892f9959fdc18095d035976c574b268b7"
  "vkroots::git+https://github.com/Joshua-Ashton/vkroots.git#commit=5106d8a0df95de66cc58dc1ea37e69c99afc9540"
  "wlroots::git+https://github.com/Joshua-Ashton/wlroots.git#commit=a5c9826e6d7d8b504b07d1c02425e6f62b020791"
  "stb::git+https://github.com/nothings/stb.git#commit=5736b15f7ea0ffb08dd38af21067c314d6a3aae9"
  "reverts-bd722f7.patch")
sha1sums=('30904f8ef824cc32e8d57d369ce986d3b0d05313'
          '5860b457b6bb00d1fdfd6dd068516604e87a6466'
          'fc042f50602b41be8a7c6be0a85c14cc70da761b'
          '0e6ccd1ec72dc3471594568097c922bec551fc3c'
          'e89ef3e6ee66abf807ce78bb269809eb0a0ff63a'
          '6573136d575068266dcb67459545ab06db58758a')

prepare() {
  # apply nvidia-fix patchs from
  # https://github.com/sharkautarch/gamescope/tree/nvidia-fix
  for patch in "${source[@]}"; do
    patch="${patch%%::*}"
    patch="${patch##*/}"
    if [[ $patch == *.patch ]]; then
      msg2 "Applying $patch"
      patch --no-backup-if-mismatch -d "$_pkgname" -Np1 -i "$srcdir/$patch"
    fi
  done

  cd $_pkgname

  # use system spirv-headers
  sed -i "s|'.*spirv/unified1|'/usr/include/spirv/unified1|" src/meson.build

  msg2 'Retrieving git build dependencies...'
  # configure build deps
  git -c submodule.src/reshade.url="$srcdir/reshade" \
      -c submodule.subprojects/vkroots.url="$srcdir/vkroots" \
      -c submodule.subprojects/wlroots.url="$srcdir/wlroots" \
      -c submodule.thirdparty/SPIRV-Headers.update=none \
      -c submodule.subprojects/openvr.update=none \
      -c submodule.subprojects/libdisplay-info.update=none \
      -c submodule.subprojects/libliftoff.update=none \
      -c protocol.file.allow=always submodule update --init --progress

  msg2 'Retrieving meson build dependencies...'
  # meson wrap deps that can't be replaced with system one
  sed -i "s|^url =.*|url = file://$srcdir/stb|" subprojects/stb.wrap
  meson subprojects download stb
}

pkgver() {
  git -C "$_pkgname" describe --tags | sed 's/-//'
}

build() {
  arch-meson "$_pkgname" build \
    -Dforce_fallback_for=stb,vkroots \
    -Dbenchmark=disabled \
    -Dpipewire=enabled
  meson compile -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build --skip-subprojects
  install -Dm 644 "$_pkgname/LICENSE" -t "$pkgdir/usr/share/licenses/$_pkgname/"
}

# vim: ts=2 sw=2 et:
