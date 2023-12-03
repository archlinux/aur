# Maintainer: Manuel Hüsers <aur@huesers.de>
# Contributor: Laurent Carlier <lordheavym@gmail.com>
# Contributor: lod <aur@cyber-anlage.de>

pkgname=amdvlk-2023q3.3
_pkgname=amdvlk
pkgver=2023.Q3.3
pkgrel=1
pkgdesc="AMD's standalone Vulkan driver for Pre-GFX10 GPUs (Vega, Polaris)"
arch=('x86_64')
url="https://github.com/GPUOpen-Drivers"
license=('MIT')
provides=("${_pkgname}" 'vulkan-driver')
conflicts=("${_pkgname}")
makedepends=('perl-xml-xpath' 'python' 'wayland' 'libxrandr' 'xorg-server-devel' 'directx-shader-compiler' 'glslang' 'cmake' 'ninja' 'git')
options=('!lto')
source=("https://github.com/GPUOpen-Drivers/AMDVLK/archive/v-${pkgver}.tar.gz")
sha512sums=('19e799030daee33d516f1276e08cd598a8ea7f8341b3955bda31b8576459486dbd3401d33670bfabb1872341025716e9610a8e9c4072a07a206eac90bd0f6ace')

prepare() {
	local nrepos path name revision

	nrepos=$(xpath -q -e //project AMDVLK-v-${pkgver}/default.xml | wc -l)

	while (($nrepos>0))
	do
		path=$(xpath -q -e //project[$nrepos]/@path AMDVLK-v-${pkgver}/default.xml | sed 's/ path="drivers\/\(.*\)"/\1/g')
		name=$(xpath -q -e //project[$nrepos]/@name AMDVLK-v-${pkgver}/default.xml | sed 's/ name="\(.*\)"/\1/g')
		revision=$(xpath -q -e //project[$nrepos]/@revision AMDVLK-v-${pkgver}/default.xml | sed 's/ revision="\(.*\)"/\1/g')
		git clone --recurse-submodules https://github.com/GPUOpen-Drivers/$name $path
			pushd $path
				git checkout $revision
				git submodule update
			popd
		(( nrepos-- ))
	done
}

build() {
	cd ${srcdir}/xgl
	cmake -H. -Bbuilds/Release64 \
		-DCMAKE_BUILD_TYPE=Release \
		-DBUILD_WAYLAND_SUPPORT=On \
		-G Ninja

	ninja -C builds/Release64
}

package() {
	depends=('glibc' 'gcc-libs' 'zlib' 'zstd')

	install -m755 -d "${pkgdir}"/usr/lib
	install -m755 -d "${pkgdir}"/usr/share/vulkan/icd.d
	install -m755 -d "${pkgdir}"/usr/share/vulkan/implicit_layer.d
	install -m755 -d "${pkgdir}"/usr/share/licenses/${pkgname}

	install xgl/builds/Release64/icd/amdvlk64.so "${pkgdir}"/usr/lib/
	install xgl/builds/Release64/icd/amd_icd64.json "${pkgdir}"/usr/share/vulkan/icd.d/
	install xgl/builds/Release64/icd/amd_icd64.json "${pkgdir}"/usr/share/vulkan/implicit_layer.d/
	install AMDVLK-v-${pkgver}/LICENSE.txt "${pkgdir}"/usr/share/licenses/${pkgname}/

	sed -i "s#/lib64#/lib#g" "${pkgdir}"/usr/share/vulkan/icd.d/amd_icd64.json
	sed -i "s#/lib64#/lib#g" "${pkgdir}"/usr/share/vulkan/implicit_layer.d/amd_icd64.json
}
