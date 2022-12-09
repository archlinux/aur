# Maintainer: Alex Hirzel <alex at hirzel period us>

pkgname=luisarender-git
pkgver=1381f5ab
pkgrel=1
pkgdesc="High-Performance Rendering Framework on Stream Architectures"
arch=('x86_64')
url="https://luisa-render.com/"
license=('BSD')
depends=('abseil-cpp' 'assimp' 'cuda' 'embree' 'glfw-wayland' 'tbb')
makedepends=('clang' 'git' 'cmake')
source=(
	'git+https://github.com/LuisaGroup/LuisaRender.git'
	'git+https://github.com/LuisaGroup/LuisaCompute.git'
	'git+https://github.com/jarro2783/cxxopts.git'
	'git+https://github.com/fastfloat/fast_float.git'
	'git+https://github.com/syoyo/tinyexr.git'

	# for compute
	'git+https://github.com/Cyan4973/xxHash.git'
	'git+https://github.com/gabime/spdlog.git'
	'git+https://github.com/chriskohlhoff/asio.git'
	'git+https://github.com/nothings/stb.git'
	'git+https://github.com/nlohmann/json.git'
	'git+https://github.com/glfw/glfw.git'
	'git+https://github.com/ocornut/imgui.git'
	'git+https://github.com/LuisaGroup/EASTL.git'
	'git+https://github.com/jothepro/doxygen-awesome-css.git'
	'git+https://github.com/KhronosGroup/SPIRV-Headers'
	'git+https://github.com/KhronosGroup/SPIRV-Tools.git'
	'git+https://github.com/KhronosGroup/glslang.git'
	'git+https://github.com/google/shaderc.git'

	# submodules within compute
	'git+https://github.com/LuisaGroup/EABase.git'
	'git+https://github.com/microsoft/mimalloc.git'

	'assimp.patch'
	'abseil-cpp.patch'
	'pybind11.patch'
)

sha256sums=(
	'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'
	'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'
	'SKIP' 'SKIP' 'SKIP' 'SKIP'

	'822638ea7608bf42fdfd7f04d4453c5413c7cb673296415fc82dc110fc1f97a3'
	'0fb87b700d7e657836d69aca7f114d8bfaaf7843b0c04c05cb4d3f2cb2a99ba6'
	'a1bd3301ed9aaa7cb35acf14afe430db3edd1523324fa6498776e60e80c4cf14'
)

pkgver() {
	git -C "$srcdir/LuisaRender" describe --long --tags --always | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
	cd "$srcdir/LuisaRender"

	# map submodules from sources list into the project structure
	# this list contains folder name -> path mappings, and since there is
	# nesting we need to be careful to 'cd' to the correct parent repository
	# when calling "submodule update"
	for clone_path in \
		"LuisaCompute        src/compute" \
		"xxHash              src/compute/src/ext/xxHash" \
		"spdlog              src/compute/src/ext/spdlog" \
		"asio                src/compute/src/ext/asio" \
		"stb                 src/compute/src/ext/stb/stb" \
		"json                src/compute/src/ext/json" \
		"glfw                src/compute/src/ext/glfw" \
		"imgui               src/compute/src/ext/imgui/imgui" \
		"EASTL               src/compute/src/ext/EASTL" \
		"EABase              src/compute/src/ext/EASTL/packages/EABase" \
		"mimalloc            src/compute/src/ext/EASTL/packages/mimalloc" \
		"doxygen-awesome-css src/compute/src/ext/doxygen-awesome-css" \
		"abseil-cpp          src/compute/src/ext/abseil-cpp" \
		"SPIRV-Hea           src/compute/src/ext/SPIRV-Headers" \
		"SPIRV-Tools         src/compute/src/ext/SPIRV-Tools" \
		"glslang             src/compute/src/ext/glslang" \
		"shaderc             src/compute/src/ext/shaderc" \
		"cxxopts             src/ext/cxxopts" \
		"fast_float          src/ext/fast_float" \
		"tinyexr             src/ext/tinyexr" \
	; do
		clone_path=( $clone_path );      # string to array
		clone=${clone_path[0]};          # first path from above - the cloned folder from PKGBUILD
		full_repo_path=${clone_path[1]}; # second path from above - where it's used in git tree

		# split full_repo_path into sections, e.g.
		# [src/compute/src/ext/EASTL] / [packages/mimalloc]
		# ^ repo_with_submodule         ^ submodule_path_within_repo
		repo_with_submodule=$(dirname $(dirname $full_repo_path))
		submodule_path_within_repo=$(basename $(dirname $full_repo_path))/$(basename $full_repo_path)

		git config submodule.$full_repo_path.url $srcdir/$clone
		pushd $repo_with_submodule > /dev/null
			git config submodule.$full_repo_path.url $srcdir/$clone
			git -c protocol.file.allow=always submodule update --init $submodule_path_within_repo
		popd > /dev/null
	done

	# use system assimp
	pushd "$srcdir/LuisaRender" > /dev/null
		git restore . # in case it was already applied
		git apply -v "$srcdir/assimp.patch"
		rm -rf ext/assimp
	popd > /dev/null

	# use system abseil-cpp and pybind11
	pushd "$srcdir/LuisaRender/src/compute" > /dev/null
		git restore . # in case it was already applied
		git apply -v "$srcdir/abseil-cpp.patch"
		git apply -v "$srcdir/pybind11.patch"
		rm -rf ext/abseil-cpp ext/pybi
	popd > /dev/null
}

build() {
	cmake -S "$srcdir/LuisaRender" \
		-B "$srcdir/build" \
		-DLUISA_RENDER_BUILD_TESTS=ON \
		-DLUISA_COMPUTE_ENABLE_PYTHON=ON \
		-DCMAKE_BUILD_TYPE=Release

	make -C "$srcdir/build" ${MAKEFLAGS:--j1}
}

package() {
	cd "$srcdir/build"

	pkgusr="$pkgdir/usr"
	pkglib="$pkgusr/lib/$pkgname"

	cd "$srcdir/LuisaRender"
	install -Dm644 LICENSE "$pkgusr/share/licenses/$pkgname/LICENSE"

	# for now, we manually pick things out of the build folder rather than using
	# the install.
	cd "$srcdir/build/bin"
	for binary_name in luisa-render-*; do
		dest="$pkgusr/bin/$binary_name"
		install -Dm755 $binary_name $dest
		patchelf --set-rpath "/usr/lib/$pkgname" "$dest"
	done
	for so in *.so*; do
		dest="$pkglib/$so"
		install -Dm755 "$so" $dest
		patchelf --set-rpath "/usr/lib/$pkgname" "$dest"
	done
}
