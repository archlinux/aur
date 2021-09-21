# Maintainer: Samuel "scrufulufugus" Monson <smonson at irbash dot net>
# Original PKGBUILD Contributor: "PedroHLC"
pkgname="gamescope"
pkgver=3.9.2
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
        'https://github.com/emersion/libliftoff/archive/516cf9404df801b069065d14315cf6322f64a209.tar.gz'
        'https://github.com/swaywm/wlroots/archive/9579d62a160821a107763325a515d3aee0a1e158.tar.gz')
sha256sums=('1ea332cd57fe1cde6b76e21e3e568f73b4d6b7b85db24d76b5ca9fbd3107ece6'
            '94b67dec23b03a5218884a3507d29623f52766c26e5e4942880e79db557e9280'
            '878970564de649c81365cd3e34384309b35a848c117821837102f1ac9094c5d6')

prepare() {
  mkdir -p '_build'
  cp -r libliftoff-516cf9404df801b069065d14315cf6322f64a209/* "${pkgname}-${pkgver}/subprojects/libliftoff/"
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
