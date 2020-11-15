# Maintainer: Samuel "scrufulufugus" Monson <smonson at irbash dot net>
# Original PKGBUILD Contributor: "PedroHLC"
pkgname="gamescope"
pkgver=3.7.1
pkgrel=0
pkgdesc="The micro-compositor formerly known as steamcompmgr"
arch=(x86_64)
url="https://github.com/Plagman/gamescope"
license=('BSD' 'custom:BSD 2-Clause "Simplified" License')

depends=(wayland opengl-driver xorg-server-xwayland libdrm libinput libxkbcommon libxcomposite libcap libxcb libpng glslang libxrender libxtst vulkan-icd-loader sdl2)
makedepends=('meson' 'ninja' 'cmake' 'pixman' 'pkgconf' 'vulkan-headers' 'wayland-protocols>=1.17') # makepkg -si

provides=('steamcompmgr' 'libliftoff=0.0.0')
conflicts=('gamescope-git' 'libliftoff')
replaces=('steamcompmgr')

source=("${url}/archive/${pkgver}.tar.gz"
        'https://github.com/emersion/libliftoff/archive/24abeb923f52176808461e664776b56d52960d3e.tar.gz'
        'https://github.com/swaywm/wlroots/archive/238d1c078fb03338e9f271d98f7bf6b1fc399285.tar.gz')
sha256sums=('044f7969b796e678415ca7762fb21c04ecb331660b442b4fdcc389410ef36c6f'
            'eccaafc0a007e61189e6cc5c0f2b6455aadc80a0dd81a79b73be4ba8f5149ab8'
            'fa2282ccf49bea061b11927bbe908b2c80806d9318f6f5e4eb3e3008e7f6410a')

prepare() {
    mkdir -p '_build'
    cp -r wlroots-238d1c078fb03338e9f271d98f7bf6b1fc399285/* "${pkgname}-${pkgver}/subprojects/wlroots/"
	cp -r libliftoff-24abeb923f52176808461e664776b56d52960d3e/* "${pkgname}-${pkgver}/subprojects/libliftoff/"
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
