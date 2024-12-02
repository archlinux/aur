_plug=rife-ncnn-vulkan
pkgname=vapoursynth-plugin-${_plug}
pkgver=9_mod_v31
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (Real-Time Intermediate Flow Estimation for Video Frame Interpolation)"
arch=('x86_64')
url='https://github.com/HomeOfVapourSynthEvolution/VapourSynth-RIFE-ncnn-Vulkan'
license=('MIT')
depends=(
	'ncnn'
	'vapoursynth'
)
optdepends=(
	'vapoursynth-plugin-vmaf: Skip interpolating static frames'
)
makedepends=(
	'git'
	'meson'
	'cmake'
	'vulkan-headers'
)
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/styler00dollar/VapourSynth-RIFE-ncnn-Vulkan.git")
sha256sums=('SKIP')

pkgver() {
	cd "${_plug}"
	git describe --tags | sed 's/^r//; s/-/+/g'
}

prepare() {
	mkdir -p build

	cd "${_plug}"
	sed "/modelPath/ s|/models|/${_plug}-models|g" -i RIFE/plugin.cpp
}

build() {
	cd build
	arch-meson "../${_plug}" --libdir /usr/lib/vapoursynth -Duse_system_ncnn=true

	ninja
}

package(){
	DESTDIR="${pkgdir}" ninja -C build install

	mv "${pkgdir}/usr/lib/vapoursynth/models" "${pkgdir}/usr/lib/vapoursynth/${_plug}-models"

	install -Dm644 "${_plug}/README.md" "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
	install -Dm644 "${_plug}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
