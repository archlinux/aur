# Maintainer: Josh Holmer <jholmer.in@gmail.com>

_plug=mlrt
pkgname=vapoursynth-plugin-${_plug}-trt-runtime-git
pkgver=811.1f166ba
pkgrel=2
pkgdesc="Plugin for VapourSynth: ${_plug} (TensorRT runtime: recommended for Nvidia GPUs >=8GB VRAM)"
arch=('x86_64')
url='https://github.com/AmusementClub/vs-mlrt'
license=('LGPL')
depends=('vapoursynth' 'cuda' 'tensorrt')
makedepends=('git' 'ninja' 'cmake' 'jq' 'vapoursynth-api3-headers')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")

# Function to fetch the latest release version
get_latest_release_version() {
	curl --silent "https://api.github.com/repos/AmusementClub/vs-mlrt/releases/latest" | jq -r .tag_name
}

# Fetch the latest release version
latest_release=$(get_latest_release_version)

source=("${_plug}::git+https://github.com/AmusementClub/vs-mlrt.git"
	"models-${latest_release}.7z::https://github.com/AmusementClub/vs-mlrt/releases/download/${latest_release}/models.${latest_release}.7z")
sha256sums=('SKIP' 'SKIP')

pkgver() {
	cd "${_plug}"

	_rev=$(git rev-list --count --all)
	_hash=$(git rev-parse --short HEAD)
	printf "%s.%s" "$_rev" "$_hash"
}

build() {
	cmake -S "${_plug}/vstrt" -B build -G Ninja \
		-DCMAKE_BUILD_TYPE=Release \
		-DVAPOURSYNTH_INCLUDE_DIRECTORY="/usr/include/vapoursynth" \
		-DCMAKE_CXX_FLAGS="${CXXFLAGS} -ffast-math"

	cmake --build build
}

package() {
	site_packages="$(python -c 'import sysconfig; print(sysconfig.get_paths()["purelib"])')"
	PLUGINDIR=$(python -c "import vapoursynth; print(vapoursynth.get_plugin_dir())")

	# The cmake script puts the library inside a `lib` dir, which we don't want, so we have to install it manually
	install -Dm755 "build/libvstrt.so" "${pkgdir}${PLUGINDIR}/libvstrt.so"
	for i in $(find models* -type f); do install -Dm644 "${i}" "${pkgdir}${PLUGINDIR}/${i}"; done

	# For some reason this plugin wants to look for trtexec at ${PLUGINDIR}/vsmlrt-cuda/trtexec
	# instead of in PATH, so we have to symlink it there from the tensorrt package.
	mkdir -p "${pkgdir}${PLUGINDIR}/vsmlrt-cuda"
	ln -s /usr/bin/trtexec "${pkgdir}${PLUGINDIR}/vsmlrt-cuda/trtexec"

	install -Dm644 "${_plug}/scripts/vsmlrt.py" "${pkgdir}${site_packages}/vsmlrt.py"

	install -Dm644 "${_plug}/README.md" "${pkgdir}/usr/share/doc/vapoursynth/tools/${_plug}/README.md"
	install -Dm644 "${_plug}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
