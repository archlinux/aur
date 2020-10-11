# Maintainer: Samuel "scrufulufugus" Monson <smonson at irbash dot net>
# Original PKGBUILD Contributor: "PedroHLC"
pkgname="gamescope"
pkgver=3.7
pkgrel=0
pkgdesc="The micro-compositor formerly known as steamcompmgr"
arch=(x86_64)
url="https://github.com/Plagman/gamescope"
license=('BSD' 'custom:BSD 2-Clause "Simplified" License')

depends=(wayland opengl-driver xorg-server-xwayland libdrm libinput libxkbcommon libxcomposite libcap libxcb libpng glslang libxrender libxtst vulkan-icd-loader sdl2)
makedepends=('git' 'meson' 'ninja' 'cmake' 'pixman' 'pkgconf' 'vulkan-headers' 'wayland-protocols>=1.17') # makepkg -si

provides=('steamcompmgr' 'libliftoff=0.0.0')
conflicts=('gamescope-git' 'libliftoff')
replaces=('steamcompmgr')

source=("${url}/archive/${pkgver}.tar.gz"
        'git+https://github.com/emersion/libliftoff.git#commit=95da3ee649fe42bb147789d5092e95c8f61fab77'
        'git+https://github.com/swaywm/wlroots.git#commit=751a21d94f1b4f0345d040ddfd54b723631d5991')
md5sums=('9c2d2fcb89cf772d1a93bbafdf5d11f4'
	'SKIP' 'SKIP')

prepare() {
    mkdir -p '_build'
    cp -r wlroots/* "${pkgname}-${pkgver}/subprojects/wlroots/"
	cp -r libliftoff/* "${pkgname}-${pkgver}/subprojects/libliftoff/"
}

build() {
	cd "${pkgname}-${pkgver}"
	meson \
		--buildtype debug \
		--prefix /usr \
		${srcdir}/_build
}

package() {
	DESTDIR="$pkgdir" ninja -C _build install

    msg2 "Removing unnecessary wlroots files"
    # wlroots is statically linked
    rm -rfv "${pkgdir}"/usr/include
    rm -rfv "${pkgdir}"/usr/lib/libwlroots*
    rm -fv  "${pkgdir}"/usr/lib/pkgconfig/wlroots.pc

	install -Dm644 "$srcdir/${pkgname}-${pkgver}/LICENSE" \
		 "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
