# Maintainer: Alex Hirzel <alex at hirzel period us>

pkgname=mitsuba3-git
pkgver=3.2.1.r49.g0cf6701c
pkgrel=1
pkgdesc="A Retargetable Forward and Inverse Renderer"
arch=('x86_64')
url="https://www.mitsuba-renderer.org/"
license=('custom')
depends=('libpng' 'libjpeg-turbo' 'libc++' 'pybind11' 'pugixml' 'cuda' 'python-pytorch' 'python-pytest')
makedepends=('clang' 'git' 'cmake' 'ninja' 'patchelf' 'python' 'graphviz' 'python-sphinx' 'python-sphinx-tabs' 'python-sphinx-hoverxref' 'python-sphinxcontrib-youtube' 'python-sphinx_design' 'python-nbsphinx' 'python-sphinx-gallery' 'python-sphinx-copybutton' 'python-sphinx-furo')
source=(
	'git+https://github.com/fastfloat/fast_float'
	'git+https://github.com/intel/IntelSEAPI'
	'git+https://github.com/mitsuba-renderer/asmjit'
	'git+https://github.com/mitsuba-renderer/cmake-defaults'
	'git+https://github.com/mitsuba-renderer/drjit'
	'git+https://github.com/mitsuba-renderer/drjit-core'
	'git+https://github.com/mitsuba-renderer/embree'
	'git+https://github.com/mitsuba-renderer/mitsuba3.git'
	'git+https://github.com/mitsuba-renderer/mitsuba-data'
	'git+https://github.com/mitsuba-renderer/mitsuba-tutorials'
	'git+https://github.com/mitsuba-renderer/nanogui'
	'git+https://github.com/mitsuba-renderer/nanothread'
	'git+https://github.com/mitsuba-renderer/openexr'
	'git+https://github.com/mitsuba-renderer/tinyformat'
	'git+https://github.com/Tessil/robin-map'
	'git+https://github.com/wjakob/glfw'
	'git+https://github.com/wjakob/nanovg'
	'git+https://github.com/wjakob/nanovg_metal'

	'pybind11.patch'
	'dependencies.patch'
	'test_scene.xml'
)
md5sums=(
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'9591ce4762b4bc3656eba529b608f067'
	'0f37038218fccc7f08e718f95d150213'
	'1e1daddd0a6431bb524402eedc8d51c7'
)

pkgver() {
	git -C "$srcdir/${pkgname%-git}" describe --long --tags --always | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
	cd "$srcdir/${pkgname%-git}"

	# map submodules from sources list into the project structure
	# this list contains folder name -> path mappings, and since there is
	# nesting we need to be careful to 'cd' to the correct parent repository
	# when calling "submodule update"
	for clone_path in \
		"asmjit            ext/asmjit" \
		"drjit             ext/drjit" \
		"drjit-core        ext/drjit/ext/drjit-core" \
		"robin-map         ext/drjit/ext/drjit-core/ext/robin_map" \
		"nanothread        ext/drjit/ext/drjit-core/ext/nanothread" \
		"cmake-defaults    ext/drjit/ext/drjit-core/ext/nanothread/ext/cmake-defaults" \
		"embree            ext/embree" \
		"fast_float        ext/fastfloat" \
		"IntelSEAPI        ext/ittnotify" \
		"nanogui           ext/nanogui" \
		"glfw              ext/nanogui/ext/glfw" \
		"nanovg            ext/nanogui/ext/nanovg" \
		"nanovg_metal      ext/nanogui/ext/nanovg_metal" \
		"openexr           ext/openexr" \
		"tinyformat        ext/tinyformat" \
		"mitsuba-data      resources/data" \
		"mitsuba-tutorials tutorials" \
	; do
		clone_path=( $clone_path );      # string to array
		clone=${clone_path[0]};          # first path from above - the cloned folder from PKGBUILD
		full_repo_path=${clone_path[1]}; # second path from above - where it's used in git tree

		# split full_repo_path into sections, e.g.
		# [ext/drjit/ext/drjit-core/ext/nanothread] / [ext/cmake-defaults]
		# ^ repo_with_submodule                       ^ submodule_path_within_repo
		repo_with_submodule=$(dirname $(dirname $full_repo_path))
		submodule_path_within_repo=$(basename $(dirname $full_repo_path))/$(basename $full_repo_path)

		git config submodule.$full_repo_path.url $srcdir/$clone
		pushd $repo_with_submodule > /dev/null
			git config submodule.$full_repo_path.url $srcdir/$clone
			git -c protocol.file.allow=always submodule update --init $submodule_path_within_repo
		popd > /dev/null
	done

	pushd "$srcdir/mitsuba3" > /dev/null
		git restore . # in case it was already applied
		git apply -v "$srcdir/dependencies.patch"

		rm -rf ext/libjpeg ext/libpng ext/pugixml ext/zlib
	popd > /dev/null

	pushd "$srcdir/mitsuba3/ext/drjit/ext/drjit-core/ext/nanothread/ext/cmake-defaults" > /dev/null
		git restore . # in case it was already applied
		git apply -v "$srcdir/pybind11.patch"
	popd > /dev/null

	# generate the mitsuba.conf file with desired renderers
	# NOTE: change this if you want to build something else
	mkdir -p "$srcdir/build"
	#cat "$srcdir/${pkgname%-git}"/resources/mitsuba.conf.template \
	#	| sed '/@INSERT_CONFIGURATIONS_HERE@/s/.*/"scalar_mono", "scalar_mono_double", "scalar_mono_polarized", "scalar_mono_polarized_double", "scalar_rgb", "scalar_rgb_double", "scalar_rgb_polarized", "scalar_rgb_polarized_double", "scalar_spectral", "scalar_spectral_double", "scalar_spectral_polarized", "scalar_spectral_polarized_double", "llvm_mono", "llvm_mono_double", "llvm_mono_polarized", "llvm_mono_polarized_double", "llvm_rgb", "llvm_rgb_double", "llvm_rgb_polarized", "llvm_rgb_polarized_double", "llvm_spectral", "llvm_spectral_double", "llvm_spectral_polarized", "llvm_spectral_polarized_double", "llvm_ad_mono", "llvm_ad_mono_double", "llvm_ad_mono_polarized", "llvm_ad_mono_polarized_double", "llvm_ad_rgb", "llvm_ad_rgb_double", "llvm_ad_rgb_polarized", "llvm_ad_rgb_polarized_double", "llvm_ad_spectral", "llvm_ad_spectral_double", "llvm_ad_spectral_polarized", "llvm_ad_spectral_polarized_double", "cuda_mono", "cuda_mono_double", "cuda_mono_polarized", "cuda_mono_polarized_double", "cuda_rgb", "cuda_rgb_double", "cuda_rgb_polarized", "cuda_rgb_polarized_double", "cuda_spectral", "cuda_spectral_double", "cuda_spectral_polarized", "cuda_spectral_polarized_double", "cuda_ad_mono", "cuda_ad_mono_double", "cuda_ad_mono_polarized", "cuda_ad_mono_polarized_double", "cuda_ad_rgb", "cuda_ad_rgb_double", "cuda_ad_rgb_polarized", "cuda_ad_rgb_polarized_double", "cuda_ad_spectral", "cuda_ad_spectral_double", "cuda_ad_spectral_polarized", "cuda_ad_spectral_polarized_double"/' \
	#	> "$srcdir/build/mitsuba.conf"
}

build() {
	cmake	-S "$srcdir/${pkgname%-git}" \
		-B "$srcdir/build" -G Ninja \
		-DCMAKE_C_COMPILER=clang \
		-DCMAKE_CXX_COMPILER=clang++ \
		-DCMAKE_MODULE_PATH:PATH="$(pybind11-config --cmakedir)" \
		-DCMAKE_INSTALL_PREFIX:PATH="$pkgdir/usr"

	ninja -C "$srcdir/build" ${MAKEFLAGS:--j1}
	ninja -C "$srcdir/build" mkdoc
}

check() {
	"$srcdir/build/mitsuba" "$srcdir/test_scene.xml"
}

package() {
	pkgusr="$pkgdir/usr"
	pkglib="$pkgusr/lib/$pkgname"
	binary_name="mitsuba"

	cd "$srcdir/${pkgname%-git}"
	install -Dm644 LICENSE "$pkgusr/share/licenses/$pkgname/LICENSE"

	# for now, we manually pick things out of the build folder rather than using
	# the install. may need to separate out DrJit later...
	cd "$srcdir/build"
	install -Dm755 mitsuba "$pkgusr/bin/$binary_name"
	for so in *.so plugins/*.so; do
		install -Dm755 "$so" "$pkglib/$so"
	done

	# install data (mitsuba searches for it here by default)
	cp -R "$srcdir/build/data" "$pkgusr/lib/$pkgname/data"

	# install documentation
	mkdir -p "$pkgdir/usr/share/doc/$pkgname"
	cp -R "$srcdir/build/html" "$pkgdir/usr/share/doc/$pkgname"
	rm -rf "$pkgdir/usr/share/doc/$pkgname/html/.doctrees" # not needed

	# install python modules
	local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
	mkdir -p "$pkgdir$site_packages"
	cp -R python/* "$pkgdir$site_packages"

	# fix rpaths
	patchelf --set-rpath "/usr/lib/$pkgname" "$pkgusr/bin/$binary_name"
	for so in "$pkglib/*.so";                 do patchelf --set-rpath "\$ORIGIN" $so; done
	for so in "$pkglib/plugins/*.so";         do patchelf --remove-rpath $so; done
	for so in "$pkgdir$site_packages"/*/*.so; do patchelf --set-rpath "/usr/lib/$pkgname" "$so"; done
}
