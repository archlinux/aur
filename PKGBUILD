_plug=rife-ncnn-vulkan
pkgname=vapoursynth-plugin-${_plug}

_fragment=tag=r9_mod_v33

pkgver=9_mod_v33
pkgrel=1
pkgdesc="Plugin for Vapoursynth: Real-Time Intermediate Flow Estimation for Video Frame Interpolation"
arch=('x86_64')
url='https://github.com/styler00dollar/VapourSynth-RIFE-ncnn-Vulkan'
license=('MIT')
depends=(
	ncnn
	vapoursynth
)
optdepends=(
	'vapoursynth-plugin-vmaf: Skip interpolating static frames'
)
makedepends=(
	cmake
	git
	meson
	vulkan-headers
)
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+${url}.git#${_fragment}")
sha256sums=('SKIP')

prepare() {
	mkdir -p build
}

pkgver() {
	git -C "${_plug}" describe --first-parent --tags | sed 's/^r//; s/-/+/g'
}

build() {
	cd build
	arch-meson "../${_plug}" --libdir /usr/lib/vapoursynth -Duse_system_ncnn=true
	ninja
}

package() {
	DESTDIR="${pkgdir}" ninja -C build install

	install -Dm644 -t "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}" "${_plug}/README.md"
	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${_plug}/LICENSE"
}
