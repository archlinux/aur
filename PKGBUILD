# Maintainer: Samuel "scrufulufugus" Monson <smonson at irbash dot net>
# Original PKGBUILD Contributor: "PedroHLC"
pkgname="gamescope"
pkgver=3.8.4
pkgrel=1
pkgdesc="The micro-compositor formerly known as steamcompmgr"
arch=(x86_64)
url="https://github.com/Plagman/gamescope"
license=('BSD' 'custom:BSD 2-Clause "Simplified" License')

depends=(wayland opengl-driver xorg-server-xwayland libdrm libinput libxkbcommon xcb-util-wm xcb-util-errors libxcomposite libcap libxcb libpng glslang libxrender libxtst libxres vulkan-icd-loader sdl2)
makedepends=('meson' 'ninja' 'cmake' 'pixman' 'pkgconf' 'vulkan-headers' 'wayland-protocols>=1.17') # makepkg -si

provides=('steamcompmgr' 'libliftoff=0.0.0')
conflicts=('gamescope-git' 'libliftoff')
replaces=('steamcompmgr')

source=("${url}/archive/${pkgver}.tar.gz"
        'https://github.com/emersion/libliftoff/archive/b08bbaa5e6331ed273c4bbd867143bf776c18207.tar.gz'
        'https://github.com/swaywm/wlroots/archive/69c71dbc8afecc5da5c800cdc1475185064b4ac4.tar.gz')
sha256sums=('761d0baa20b683cb3f3bb0126229a05b2912e016970a24c3beba12468d7df6ae'
            '46415b8470913e3fe746867f396c45e59628cfd5918c0467aef27c86b9f5ecd6'
            'd2feb19cd2dcf1ea1ef3559a22ec49d916e6fc266bd80a5e32ab1564a5c93589')

prepare() {
  mkdir -p '_build'
  cp -r libliftoff-b08bbaa5e6331ed273c4bbd867143bf776c18207/* "${pkgname}-${pkgver}/subprojects/libliftoff/"
  cp -r wlroots-69c71dbc8afecc5da5c800cdc1475185064b4ac4/* "${pkgname}-${pkgver}/subprojects/wlroots/"
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
