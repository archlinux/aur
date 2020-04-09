pkgname="gamescope"
pkgver=3.6
pkgrel=1
pkgdesc="The micro-compositor formerly known as steamcompmgr"
arch=(x86_64)
url="https://github.com/Plagman/gamescope"
license=('BSD' 'custom:BSD 2-Clause "Simplified" License')

depends=(wayland opengl-driver xorg-server-xwayland libdrm libinput libxkbcommon libxcomposite libcap libxcb libpng glslang libxrender libxtst vulkan-icd-loader sdl2)
makedepends=('git' 'meson' 'ninja' 'cmake' 'pixman' 'pkgconf' 'vulkan-headers' 'wayland-protocols>=1.17') # makepkg -si

provides=('steamcompmgr' 'wlroots=3.6.1' 'libliftoff=0.0.0')
conflicts=('gamescope-git' 'wlroots' 'libliftoff')
replaces=('steamcompmgr')

source=("${url}/archive/${pkgver}.tar.gz"
	'git+https://github.com/Plagman/wlroots.git#commit=49e33be5bf15fab9530013a7b862eaa0ecfb5161'
	'git+https://github.com/emersion/libliftoff.git#commit=cfeee41ec1aa03578bfbe4cd513a25e84c407dec')
md5sums=("95d0dcd88fd6423eee0743d478bbcb5b"
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

	install -Dm644 "$srcdir/${pkgname}-${pkgver}/LICENSE" \
		 "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}