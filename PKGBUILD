# Maintainer: Alex Hirzel <alex at hirzel period us>

pkgname=mitsuba2-git
pkgver=2.2.1.r43.g62863cb3
pkgrel=1
pkgdesc="A Retargetable Forward and Inverse Renderer"
arch=('x86_64')
url="https://www.mitsuba-renderer.org/"
license=('custom')
groups=()
depends=('libpng' 'libjpeg-turbo' 'libc++' 'pybind11' 'pugixml' 'cuda')
makedepends=('clang' 'git' 'cmake' 'ninja' 'patchelf' 'python' 'python-sphinx' 'python-guzzle-sphinx-theme' 'python-sphinxcontrib-bibtex' 'jq')
checkdepends=('python-pytest' 'python-pytest-xdist' 'python-numpy')
install=
source=('swap_pybind.patch'
        'swap_pugixml.patch'
        'swap_pybind_enoki.patch'
        'python_collections.patch'
        'test_scene.xml'
        'git+https://github.com/mitsuba-renderer/mitsuba2.git'
        'git+https://github.com/wjakob/tbb.git'
        'git+https://github.com/mitsuba-renderer/asmjit.git'
        'git+https://github.com/mitsuba-renderer/enoki.git'
        'git+https://github.com/mitsuba-renderer/nanogui.git'
        'git+https://github.com/mitsuba-renderer/tinyformat.git'
        'git+https://github.com/mitsuba-renderer/mitsuba-data.git'
        'git+https://github.com/mitsuba-renderer/openexr.git')
md5sums=('e40fe4bf313d60b1eb7c3da60fb6d434'
         '617bd32eecbebd8c7036f738b8275e5f'
         'eee8327568bbe7e0fa0a8d873eb2dea0'
         'fcd771afe770b24492938482d6facfed'
         '1e1daddd0a6431bb524402eedc8d51c7'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP')

pkgver() {
	git -C "$srcdir/${pkgname%-git}" describe --long --tags --always | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
	cd "$srcdir/${pkgname%-git}"

	# submodules, some of which need to be compiled with the same compiler as
	# mitsuba itself so that ABIs line up
	git config submodule.ext/asmjit.url     $srcdir/asmjit
	git config submodule.ext/enoki.url      $srcdir/enoki
	git config submodule.ext/nanogui.url    $srcdir/nanogui # provides bin2c
	git config submodule.ext/tbb.url        $srcdir/tbb
	git config submodule.ext/tinyformat.url $srcdir/tinyformat
	git config submodule.ext/openexr.url    $srcdir/openexr
	git config submodule.resources/data.url $srcdir/mitsuba-data
	git -c protocol.file.allow=always submodule update --init ext/asmjit ext/enoki ext/nanogui ext/tbb ext/tinyformat ext/openexr resources/data

	# system versions of these modules are used
	rmdir ext/zlib ext/libpng ext/libjpeg

	# patch the build system to use system versions
	rmdir ext/pugixml ext/pybind11
	git apply -v $srcdir/swap_pybind.patch
	git apply -v $srcdir/swap_pugixml.patch
	git -C ext/enoki apply -v $srcdir/swap_pybind_enoki.patch

	# fix Python documentation
	git apply -v $srcdir/python_collections.patch

	# not used with the current build options
	rmdir ext/embree

	# generate the mitsuba.conf file with only one renderer (RGB)
	# NOTE: change this if you want to build something else
	# NOTE: scalar_rgb must be in the "enabled" list at all times
	grep -v '#' < "$srcdir/${pkgname%-git}"/resources/mitsuba.conf.template \
		| jq '.["enabled"] = [
			"scalar_mono",                  "scalar_rgb",                  "scalar_spectral",
			"scalar_mono_polarized",        "scalar_rgb_polarized",        "scalar_spectral_polarized",
			"scalar_mono_double",           "scalar_rgb_double",           "scalar_spectral_double",
			"scalar_mono_polarized_double", "scalar_rgb_polarized_double", "scalar_spectral_polarized_double",
			"packet_mono",                  "packet_rgb",                  "packet_spectral",
			"packet_mono_double",           "packet_rgb_double",           "packet_spectral_double",
			"gpu_mono",                     "gpu_rgb",                     "gpu_spectral",
			"gpu_autodiff_mono",            "gpu_autodiff_rgb",            "gpu_autodiff_spectral"
		]' \
		| jq '.["default"] = "scalar_rgb"' \
		> "$srcdir/${pkgname%-git}"/mitsuba.conf
}

build() {
	cmake	-S "$srcdir/${pkgname%-git}" \
		-B "$srcdir/build" -G Ninja \
		-DCMAKE_C_COMPILER=clang \
		-DCMAKE_CXX_COMPILER=clang++ \
		-DCMAKE_MODULE_PATH:PATH="$(pybind11-config --cmakedir)" \
		-DMTS_ENABLE_PYTHON:BOOL=ON \
		-DMTS_ENABLE_GUI:BOOL=OFF \
		-DMTS_ENABLE_EMBREE:BOOL=OFF \
		-DCMAKE_INSTALL_PREFIX:PATH="$pkgdir"

	ninja -C "$srcdir/build" ${MAKEFLAGS:--j1}
	ninja -C "$srcdir/build" mkdoc
}

check() {
	$srcdir/build/dist/mitsuba $srcdir/test_scene.xml
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	ninja -C "$srcdir/build" ${MAKEFLAGS:--j1} install
	cd "$srcdir/build"

	# adapt rpath to where libraries will be installed (so they do not conflict
	# with other installed libraries)
	patchelf --remove-rpath dist/mitsuba dist/python/mitsuba/*.so dist/libIlmImf.so dist/libIlmThread.so dist/libImath.so 
	patchelf --set-rpath '/usr/lib/mitsuba2' dist/mitsuba dist/python/mitsuba/*.so

	install -Dm755 dist/mitsuba         "$pkgdir/usr/bin/mitsuba2"
	install -Dm644 dist/*.so         -t "$pkgdir/usr/lib/mitsuba2"
	install -Dm644 dist/plugins/*.so -t "$pkgdir/usr/lib/mitsuba2/plugins"

	# install data
	mkdir -p "$pkgdir/usr/share/mitsuba2"
	cp -R dist/data "$pkgdir/usr/share/mitsuba2/data"

	# install python module
	local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
	mkdir -p "$pkgdir$site_packages"
	cp -R dist/python/* "$pkgdir$site_packages"

	# install documentation
	mkdir -p "$pkgdir/usr/share/doc/mitsuba2"
	cp -R "$srcdir/build/html" "$pkgdir/usr/share/doc/mitsuba2"

	# folders which are not used/should not be shipped
	rm -rf "$pkgdir/include" "$pkgdir/lib"
}
