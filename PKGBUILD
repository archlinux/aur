# Maintainer algar
# Contributor Mr.Smith1974

pkgname=openspace-git
_pkgname=OpenSpace
_vcpkg_commit='04a9d8e5212d01ee1dd9478eadd9caade4f8b0d4'
pkgver=v0.20.0.1089.g924e0fb1f6
pkgrel=1
pkgdesc="OpenSpace is an open source, non-commercial, and freely available interactive data visualization software designed to visualize the entire known universe and portray our ongoing efforts to investigate the cosmos"
arch=('x86_64')
url="https://github.com/OpenSpace/OpenSpace"
license=('MIT')
makedepends=('cmake' 'git' 'sed' 'glm' 'websocketpp' 'vcpkg' 'autoconf' 'autoconf-archive' 'automake' 'libtool')
depends=('gdal' 'mpv' 'vulkan-headers' 'libxinerama' 'libxi' 'qt6-base' 'nss' 'at-spi2-core' 'libxcomposite' 'libxdamage' 'python-pandas' 'alsa-lib')
conflicts=('openspace')
source=("git+https://github.com/OpenSpace/OpenSpace.git#branch=master"
	"vcpkg-${_vcpkg_commit}.tar.gz::https://github.com/microsoft/vcpkg/archive/${_vcpkg_commit}.tar.gz"
	"open-space"
	"update-cfg.patch"
	"globebrowsingmodule.patch"
	"fix-soloud-system-alsa.patch"
	)
sha256sums=('SKIP'
			'SKIP' # vcpkg archive pinned to _vcpkg_commit
			48f9ad3ab1ffc9ef6172cdba1b7bf1d0c36127723d3e73bb7beb273f1d0a54af
		    776d986d6592fbedddaaa79385d3e42b39e1bd1ae9480404559410bcc930c963
		    608d02fe1828d5bdc9f5cf20b02d1294b216212ccf0402b4922eacdade1e1088
		    81a96d64d2ba2eb5f50d184af23d64ac389418912320265e6f3f593625c5ca6e
		    )

options=(!debug '!lto')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git describe --always | sed 's/-/./g' | sed 's/\///g' | sed 's/releases//g'
}

prepare() {
	cd "${srcdir}/${_pkgname}"

	# Upstream no longer uses git submodules.

	# Patch main configuration file to enable local user execution.
	patch < "${srcdir}/update-cfg.patch"

	# Patch globebrowsingmodule.cpp to compile against current GDAL versions.
	patch -Np1 -i "${srcdir}/globebrowsingmodule.patch"

	# Other existing patches...
    patch -Np1 -i "${srcdir}/fix-soloud-system-alsa.patch"

	# The vcpkg snapshot is only used for its build scripts.  Resolve the
	# curated ports through Microsoft's Git registry instead of requiring
	# the snapshot itself to be a Git checkout.

	sed -i \
    '/"kind": "builtin"/c\      "kind": "git",\n      "repository": "https://github.com/microsoft/vcpkg",' \
    vcpkg.json

	# Arch's vcpkg package provides /usr/bin/vcpkg, while OpenSpace's
	# CMake integration expects the executable at $VCPKG_ROOT/vcpkg.
	ln -sf /usr/bin/vcpkg "${srcdir}/vcpkg-${_vcpkg_commit}/vcpkg"
}

build() {
	local _build_dir="${srcdir}/${_pkgname}/build"

	export VCPKG_ROOT="${srcdir}/vcpkg-${_vcpkg_commit}"
	export VCPKG_DISABLE_METRICS=1
	# Limit memory pressure during vcpkg dependency builds
    export VCPKG_MAX_CONCURRENCY=4

	cmake \
		-S "${srcdir}/${_pkgname}" \
		-B "${_build_dir}" \
		-DCMAKE_BUILD_TYPE:STRING=Release \
		-DCMAKE_CXX_COMPILER:FILEPATH=/usr/bin/g++ \
		-DCMAKE_C_COMPILER:FILEPATH=/usr/bin/gcc \
		-DCMAKE_TOOLCHAIN_FILE:FILEPATH="${VCPKG_ROOT}/scripts/buildsystems/vcpkg.cmake" \
		-DVCPKG_TARGET_TRIPLET:STRING=x64-linux \
		-DASSIMP_BUILD_MINIZIP=1

	cmake --build "${_build_dir}" --parallel 16
}

package() {
	mkdir -p "$pkgdir/opt/OpenSpace/config"
	cp -R "${srcdir}/${_pkgname}/config"  "$pkgdir/opt/OpenSpace"
	mkdir -p "$pkgdir/opt/OpenSpace/data"
	cp -R "${srcdir}/${_pkgname}/data"  "$pkgdir/opt/OpenSpace"
	mkdir -p "$pkgdir/opt/OpenSpace/scripts"
	cp -R "${srcdir}/${_pkgname}/scripts"  "$pkgdir/opt/OpenSpace"
	mkdir -p "$pkgdir/opt/OpenSpace/shaders"
	cp -R "${srcdir}/${_pkgname}/shaders"  "$pkgdir/opt/OpenSpace"
	mkdir -p "$pkgdir/opt/OpenSpace/documentation"
	mkdir -p "$pkgdir/opt/OpenSpace/modules/atmosphere/shaders"
	cp -R "${srcdir}/${_pkgname}/modules/atmosphere/shaders"  "$pkgdir/opt/OpenSpace/modules/atmosphere"
	mkdir -p "$pkgdir/opt/OpenSpace/modules/base/shaders"
	cp -R "${srcdir}/${_pkgname}/modules/base/shaders"  "$pkgdir/opt/OpenSpace/modules/base"
	mkdir -p "$pkgdir/opt/OpenSpace/modules/cefwebgui/shaders"
	cp -R "${srcdir}/${_pkgname}/modules/cefwebgui/shaders"  "$pkgdir/opt/OpenSpace/modules/cefwebgui"
	mkdir -p "$pkgdir/opt/OpenSpace/modules/debugging/shaders"
	cp -R "${srcdir}/${_pkgname}/modules/debugging/shaders"  "$pkgdir/opt/OpenSpace/modules/debugging"
	mkdir -p "$pkgdir/opt/OpenSpace/modules/debugging/scripts"
	cp -R "${srcdir}/${_pkgname}/modules/debugging/scripts/axes.lua"  "$pkgdir/opt/OpenSpace/modules/debugging/scripts/axes.lua"
	mkdir -p "$pkgdir/opt/OpenSpace/modules/digitaluniverse/shaders"
	cp -R "${srcdir}/${_pkgname}/modules/digitaluniverse/shaders"  "$pkgdir/opt/OpenSpace/modules/digitaluniverse"
	mkdir -p "$pkgdir/opt/OpenSpace/modules/exoplanets/shaders"
	cp -R "${srcdir}/${_pkgname}/modules/exoplanets/shaders"  "$pkgdir/opt/OpenSpace/modules/exoplanets"
	mkdir -p "$pkgdir/opt/OpenSpace/modules/exoplanets/scripts"
	cp -R "${srcdir}/${_pkgname}/modules/exoplanets/scripts"  "$pkgdir/opt/OpenSpace/modules/exoplanets"
	mkdir -p "$pkgdir/opt/OpenSpace/modules/fieldlines/shaders"
	cp -R "${srcdir}/${_pkgname}/modules/fieldlines/shaders"  "$pkgdir/opt/OpenSpace/modules/fieldlines"
	mkdir -p "$pkgdir/opt/OpenSpace/modules/fieldlinessequence/shaders"
	cp -R "${srcdir}/${_pkgname}/modules/fieldlinessequence/shaders"  "$pkgdir/opt/OpenSpace/modules/fieldlinessequence"
	mkdir -p "$pkgdir/opt/OpenSpace/modules/gaia/shaders"
	cp -R "${srcdir}/${_pkgname}/modules/gaia/shaders"  "$pkgdir/opt/OpenSpace/modules/gaia"
	mkdir -p "$pkgdir/opt/OpenSpace/modules/gaia/scripts"
	cp -R "${srcdir}/${_pkgname}/modules/gaia/scripts"  "$pkgdir/opt/OpenSpace/modules/gaia"
	mkdir -p "$pkgdir/opt/OpenSpace/modules/galaxy/shaders"
	cp -R "${srcdir}/${_pkgname}/modules/galaxy/shaders"  "$pkgdir/opt/OpenSpace/modules/galaxy"
	mkdir -p "$pkgdir/opt/OpenSpace/modules/globebrowsing/shaders"
	cp -R "${srcdir}/${_pkgname}/modules/globebrowsing/shaders"  "$pkgdir/opt/OpenSpace/modules/globebrowsing"
	mkdir -p "$pkgdir/opt/OpenSpace/modules/globebrowsing/scripts"
	cp -R "${srcdir}/${_pkgname}/modules/globebrowsing/scripts"  "$pkgdir/opt/OpenSpace/modules/globebrowsing"
	mkdir -p "$pkgdir/opt/OpenSpace/modules/globebrowsing/gdal_data"
	cp -R "${srcdir}/${_pkgname}/modules/globebrowsing/gdal_data"  "$pkgdir/opt/OpenSpace/modules/globebrowsing"
	mkdir -p "$pkgdir/opt/OpenSpace/modules/imgui/shaders"
	cp -R "${srcdir}/${_pkgname}/modules/imgui/shaders"  "$pkgdir/opt/OpenSpace/modules/imgui"
	mkdir -p "$pkgdir/opt/OpenSpace/modules/iswa/shaders"
	cp -R "${srcdir}/${_pkgname}/modules/iswa/shaders"  "$pkgdir/opt/OpenSpace/modules/iswa"
	mkdir -p "$pkgdir/opt/OpenSpace/modules/molecule/shaders"
	cp -R "${srcdir}/${_pkgname}/modules/molecule/shaders"  "$pkgdir/opt/OpenSpace/modules/molecule"
	cp -R "${srcdir}/${_pkgname}/modules/molecule/scripts"  "$pkgdir/opt/OpenSpace/modules/molecule"
	mkdir -p "$pkgdir/opt/OpenSpace/modules/multiresvolume/shaders"
	cp -R "${srcdir}/${_pkgname}/modules/multiresvolume/shaders"  "$pkgdir/opt/OpenSpace/modules/multiresvolume"
	mkdir -p "$pkgdir/opt/OpenSpace/modules/skybrowser/shaders"
	cp -R "${srcdir}/${_pkgname}/modules/skybrowser/shaders"  "$pkgdir/opt/OpenSpace/modules/skybrowser"
	mkdir -p "$pkgdir/opt/OpenSpace/modules/solarbrowsing/shaders"
	cp -R "${srcdir}/${_pkgname}/modules/solarbrowsing/shaders"  "$pkgdir/opt/OpenSpace/modules/solarbrowsing"
	mkdir -p "$pkgdir/opt/OpenSpace/modules/space/scripts"
	cp -R "${srcdir}/${_pkgname}/modules/space/scripts"  "$pkgdir/opt/OpenSpace/modules/space"
	mkdir -p "$pkgdir/opt/OpenSpace/modules/space/shaders"
	cp -R "${srcdir}/${_pkgname}/modules/space/shaders"  "$pkgdir/opt/OpenSpace/modules/space"
	mkdir -p "$pkgdir/opt/OpenSpace/modules/spacecraftinstruments/shaders"
	cp -R "${srcdir}/${_pkgname}/modules/spacecraftinstruments/shaders"  "$pkgdir/opt/OpenSpace/modules/spacecraftinstruments"
	mkdir -p "$pkgdir/opt/OpenSpace/modules/volume/shaders"
	cp -R "${srcdir}/${_pkgname}/modules/volume/shaders"  "$pkgdir/opt/OpenSpace/modules/volume"
	mkdir -p "$pkgdir/opt/OpenSpace/modules/webbrowser/ext"
	cp -R "${srcdir}/${_pkgname}/build/modules/webbrowser/ext/cef/cef_binary_127.3.5+g114ea2a+chromium-127.0.6533.120_linux64/Release"  "$pkgdir/opt/OpenSpace/modules/webbrowser/ext"
	mkdir -p "$pkgdir/opt/OpenSpace/modules/webgui/ext/nodejs"
	cp -R "${srcdir}/${_pkgname}/modules/webgui/ext/nodejs"  "$pkgdir/opt/OpenSpace/modules/webgui/ext"
	mkdir -p "$pkgdir/opt/OpenSpace/bin"
	cp -R "${srcdir}/${_pkgname}/bin"  "$pkgdir/opt/OpenSpace"
	install ${srcdir}/open-space "$pkgdir/opt/OpenSpace/bin/open-space"
	mkdir -p "$pkgdir/opt/OpenSpace/lib"
	cp "${srcdir}/${_pkgname}/openspace.cfg"  "$pkgdir/opt/OpenSpace/."
	cp "${srcdir}/${_pkgname}/ACKNOWLEDGMENTS.md" "$pkgdir/opt/OpenSpace/."
	cp "${srcdir}/${_pkgname}/CITATION.cff" "$pkgdir/opt/OpenSpace/."
	cp "${srcdir}/${_pkgname}/COMMIT.md" "$pkgdir/opt/OpenSpace/."
	cp "${srcdir}/${_pkgname}/CREDITS.md" "$pkgdir/opt/OpenSpace/."
	cp "${srcdir}/${_pkgname}/LICENSE.md" "$pkgdir/opt/OpenSpace/."
	cp "${srcdir}/${_pkgname}/README.md" "$pkgdir/opt/OpenSpace/."
	mkdir -p "$pkgdir/opt/OpenSpace/bin/cefcache"
	chmod -R 777 "$pkgdir/opt/OpenSpace/bin/cefcache/."
}
