# Maintainer: Samuel "scrufulufugus" Monson <smonson at irbash dot net>
# Original PKGBUILD Contributor: "PedroHLC"
pkgname="gamescope"
pkgver=3.9
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
        'https://github.com/emersion/libliftoff/archive/516cf9404df801b069065d14315cf6322f64a209.tar.gz'
        'https://github.com/swaywm/wlroots/archive/69c71dbc8afecc5da5c800cdc1475185064b4ac4.tar.gz'
        'https://github.com/nothings/stb/archive/c0c982601f40183e74d84a61237e968dca08380e.tar.gz')
sha256sums=('f84caba2cf6b65d382f41716c0dee5cfeba22e1c06b2539ad0cdae59fa8fcac1'
            '94b67dec23b03a5218884a3507d29623f52766c26e5e4942880e79db557e9280'
            'd2feb19cd2dcf1ea1ef3559a22ec49d916e6fc266bd80a5e32ab1564a5c93589'
            'daeab82422dfdb1642278d74a24c3594b7a8ca782c53a6df0783d884a0f05c47')

prepare() {
  mkdir -p '_build'
  cp -r libliftoff-516cf9404df801b069065d14315cf6322f64a209/* "${pkgname}-${pkgver}/subprojects/libliftoff/"
  cp -r wlroots-69c71dbc8afecc5da5c800cdc1475185064b4ac4/* "${pkgname}-${pkgver}/subprojects/wlroots/"
  cp -r stb-c0c982601f40183e74d84a61237e968dca08380e/* "${pkgname}-${pkgver}/subprojects/stb/"
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
