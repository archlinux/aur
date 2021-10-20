# Maintainer: Samuel "scrufulufugus" Monson <smonson at irbash dot net>
# Original PKGBUILD Contributor: "PedroHLC"
pkgname="gamescope"
pkgver=3.9.5
pkgrel=1
pkgdesc="The micro-compositor formerly known as steamcompmgr"
arch=(x86_64)
url="https://github.com/Plagman/gamescope"
license=('BSD' 'custom:BSD 2-Clause "Simplified" License')

depends=(wayland opengl-driver xorg-server-xwayland libdrm libinput libxkbcommon xcb-util-wm xcb-util-errors libxcomposite libcap libxcb libpng glslang libxrender libxtst libxres vulkan-icd-loader sdl2 wlroots)
makedepends=('meson' 'ninja' 'cmake' 'pixman' 'pkgconf' 'vulkan-headers' 'wayland-protocols>=1.17' 'git') # makepkg -si

provides=('steamcompmgr' 'libliftoff=0.0.0')
conflicts=('gamescope-git' 'libliftoff')
replaces=('steamcompmgr')

_libliftver=b7a6958bcacdedf6e451d8821c807299943ef150 # libliftoff commit version
_wlrootsver=9579d62a160821a107763325a515d3aee0a1e158 # wlroots commit version

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz"
        "libliftoff-${_libliftver:0:7}.tar.gz::https://github.com/emersion/libliftoff/archive/${_libliftver}.tar.gz"
        "wlroots-${_wlrootsver:0:7}.tar.gz::https://github.com/swaywm/wlroots/archive/${_wlrootsver}.tar.gz")
sha256sums=('b49c407f6db1bde0765fdab5b8aaa424cc962b8608f2fbd98873de6e3e820eab'
            'f9b7969e2f33270b8d7df1f15741cffaf8022fe80548975f823b1ce3e5df495c'
            '878970564de649c81365cd3e34384309b35a848c117821837102f1ac9094c5d6')

prepare() {
  mkdir -p '_build'
  cp -r libliftoff-${_libliftver}/* "${pkgname}-${pkgver}/subprojects/libliftoff/"
  cp -r wlroots-${_wlrootsver}/* "${pkgname}-${pkgver}/subprojects/wlroots/"
}

build() {
  cd "${pkgname}-${pkgver}"
  meson \
  --buildtype debug \
  --prefix /usr \
  ${srcdir}/_build
}

package() {
  DESTDIR="$pkgdir" ninja install -C _build

  msg2 "Removing unnecessary wlroots files"
  # wlroots is statically linked
  rm -rfv "${pkgdir}"/usr/include
  rm -rfv "${pkgdir}"/usr/lib/libwlroots*
  rm -fv  "${pkgdir}"/usr/lib/pkgconfig/wlroots.pc
  
  install -Dm644 "$srcdir/${pkgname}-${pkgver}/LICENSE" \
	  "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
