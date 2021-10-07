# Maintainer: Samuel "scrufulufugus" Monson <smonson at irbash dot net>
# Original PKGBUILD Contributor: "PedroHLC"
pkgname="gamescope"
pkgver=3.9.3
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

source=("${url}/archive/${pkgver}.tar.gz"
        'https://github.com/emersion/libliftoff/archive/aa30b8fb97ff2c4bf37ffcdf187bd16528fcb85f.tar.gz'
        'https://github.com/swaywm/wlroots/archive/9579d62a160821a107763325a515d3aee0a1e158.tar.gz')
sha256sums=('8f330e0b9707c2830895141cabad04aeef62c8bf94bb1e32fbd8680c719dce75'
            '63db8b5953fd2b1489b2fe4e5bf24294500619c31d4b10f3759bf9d03bdbb583'
            '878970564de649c81365cd3e34384309b35a848c117821837102f1ac9094c5d6')

prepare() {
  mkdir -p '_build'
  cp -r libliftoff-aa30b8fb97ff2c4bf37ffcdf187bd16528fcb85f/* "${pkgname}-${pkgver}/subprojects/libliftoff/"
  cp -r wlroots-9579d62a160821a107763325a515d3aee0a1e158/* "${pkgname}-${pkgver}/subprojects/wlroots/"
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
