# Maintainer: Samuel "scrufulufugus" Monson <smonson at irbash dot net>
# Original PKGBUILD Contributor: "PedroHLC"
pkgname="gamescope"
pkgver=3.10.3
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

_libliftver=2e1dd93b60224e77f6a49ad8fb36d184e3a9a3bc # libliftoff commit version
_wlrootsver=3e801d68f2c6c64567b1f24c6d03893f32c81197 # wlroots commit version

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz"
        "libliftoff-${_libliftver:0:7}.tar.gz::https://gitlab.freedesktop.org/emersion/libliftoff/-/archive/${_libliftver}/libliftoff.tar.gz"
        "wlroots-${_wlrootsver:0:7}.tar.gz::https://gitlab.freedesktop.org/wlroots/wlroots/-/archive/${_wlrootsver}/wlroots.tar.gz")
sha256sums=('41ee8f27e6ad84079ec5d9a1b5f7e9bef4e2150ffd159044dfbd9703cb536d27'
            '487a09a299b178797d93fd1938a4513f02f7d562cdc534dd44561d4751300daf'
            '97365d66f40fd79d565ad4ab06fb6da7edf5728a202fbb154866b84ddc7fd55f')

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
