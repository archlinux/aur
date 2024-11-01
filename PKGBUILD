# Maintainer: Alex Hirzel <alex at hirzel period us>
# Maintainer: Chuyan Zhang <develop at zcy dot moe>

_pkgname=luisarender
pkgname=$_pkgname-git
pkgver=d77dd353
pkgrel=1
pkgdesc="High-Performance Rendering Framework on Stream Architectures"
arch=('x86_64')
url="https://luisa-render.com/"
license=('BSD')
depends=('assimp' 'cuda' 'embree' 'glfw-wayland' 'tbb')
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
	'git+https://github.com/Neargye/magic_enum.git'
	'git+https://github.com/LuisaGroup/reproc.git'
	'git+https://github.com/LuisaGroup/marl.git'

	# submodules within compute
	'git+https://github.com/LuisaGroup/EABase.git'
	'git+https://github.com/microsoft/mimalloc.git'

	'assimp.patch'
	'pybind11.patch'
)

sha256sums=(
	'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'
	'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'
	'SKIP' 'SKIP'

	'60c46ae63d3f4b42606e59dd6448f53aa5b47039bf1438ef290caab312d06351'
	'133de203c1237cf2463a3b791cd185973b23916b6bb2a9d574617989fc1f0ccb'
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
		"LuisaCompute src/compute" \
		"xxHash       src/compute/src/ext/xxHash" \
		"spdlog       src/compute/src/ext/spdlog" \
		"stb          src/compute/src/ext/stb/stb" \
		"glfw         src/compute/src/ext/glfw" \
		"EASTL        src/compute/src/ext/EASTL" \
		"EABase       src/compute/src/ext/EASTL/packages/EABase" \
		"mimalloc     src/compute/src/ext/EASTL/packages/mimalloc" \
		"magic_enum   src/compute/src/ext/magic_enum" \
		"imgui        src/compute/src/ext/imgui" \
		"reproc       src/compute/src/ext/reproc" \
		"marl         src/compute/src/ext/marl" \
		"cxxopts      src/ext/cxxopts" \
		"fast_float   src/ext/fast_float" \
		"tinyexr      src/ext/tinyexr" \
		"json         src/ext/json" \
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
		git apply -v "$srcdir/pybind11.patch"
		rm -rf ext/abseil-cpp ext/pybind11
	popd > /dev/null
}

build() {
	cmake -S "$srcdir/LuisaRender" \
		-B "$srcdir/build" \
		-DLUISA_RENDER_BUILD_TESTS=ON \
		-DLUISA_COMPUTE_ENABLE_PYTHON=ON \
		-DCMAKE_BUILD_TYPE=Release \
		-GNinja

	cmake --build "$srcdir/build"
}

check() {
	cd "$srcdir/build/bin"
	for test_binary in test_*; do
		msg2 "Running test case $test_binary."
		$srcdir/build/bin/$test_binary
	done
}

package() {
	cd "$srcdir/build"

	pkgusr="$pkgdir/usr"
	pkglib="$pkgusr/lib/$_pkgname"

	cd "$srcdir/LuisaRender"
	install -Dm644 LICENSE "$pkgusr/share/licenses/$_pkgname/LICENSE"

	# for now, we manually pick things out of the build folder rather than using
	# the install.
	cd "$srcdir/build/bin"
	for binary_name in luisa-render-*; do
		dest="$pkgusr/bin/$binary_name"
		install -Dm755 $binary_name $dest
		patchelf --set-rpath /usr/lib/$_pkgname $dest
	done
	for so in *.so*; do
		dest="$pkglib/$so"
		install -Dm755 "$so" $dest
		if ! patchelf --set-rpath /usr/lib/$_pkgname $dest ; then
			msg2 "patchelf for $dest failed."
		fi
	done
}
