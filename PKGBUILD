# shellcheck disable=SC2034,SC2155,SC2154,SC2164

: "${_fragment=tag=r9_mod_v33}"

_plug=rife-ncnn-vulkan
pkgname=vapoursynth-plugin-${_plug}
pkgver=9_mod_v33
pkgrel=4
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
source=(
	"${_plug}::git+${url}.git#${_fragment}"
	drop_shader_pack8.patch
)
sha256sums=('97c37b497b14eae43f9cfbd0c20fa15fc9b96d9170798cdc8bda8c0c9e2c405e'
            'c2feb854198de070a6114af311899d11125d37be4a6ba82d6047c82a05a50b6d')

prepare() {
	cd "$_plug"

	# https://github.com/Tencent/ncnn/pull/6270
	patch -Np1 -i ../drop_shader_pack8.patch

	local plugin_dir=$(vapoursynth get-plugin-dir)
	sed "/install_dir = / s: = .*: = '${plugin_dir}':" -i meson.build
}

pkgver() {
	git -C "$_plug" describe --first-parent --tags | sed 's/^r//; s/-/+/g'
}

build() {
	local libdir=$(python -c 'import site; print(site.getsitepackages()[0])')

	arch-meson -D use_system_ncnn=true "$_plug" build
	meson compile -C build
}

package() {
	meson install -C build --destdir "$pkgdir"

	install -Dm644 -t "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}" "${_plug}/README.md"
	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${_plug}/LICENSE"
}
