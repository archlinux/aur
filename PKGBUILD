# Maintainer: Samuel "scrufulufugus" Monson <smonson at irbash dot net>
# Original PKGBUILD Contributor: "PedroHLC"
pkgname="gamescope"
pkgver=3.10.7
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
_wlrootsver=9f41627aa10a94d9427bc315fa3d363a61b94d7c # wlroots commit version

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz"
        "libliftoff-${_libliftver:0:7}.tar.gz::https://gitlab.freedesktop.org/emersion/libliftoff/-/archive/${_libliftver}/libliftoff.tar.gz"
        "wlroots-${_wlrootsver:0:7}.tar.gz::https://gitlab.freedesktop.org/wlroots/wlroots/-/archive/${_wlrootsver}/wlroots.tar.gz")
sha256sums=('f49c34969786603854caace7119e838b97a06e7a0e7eb2cf6a1bb49855d047be'
            '487a09a299b178797d93fd1938a4513f02f7d562cdc534dd44561d4751300daf'
            '31381f649538bb52c5fa0b3c0d2a2d9a1fc3f0dd22367c39a12abbe53b53bb04')

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
