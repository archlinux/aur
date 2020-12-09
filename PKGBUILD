# Maintainer: Alex Hirzel <alex at hirzel period us>

pkgname=mitsuba2-git
pkgver=2.2.1.r25.g76445e90
pkgrel=1
pkgdesc="A Retargetable Forward and Inverse Renderer"
arch=('x86_64')
url="https://www.mitsuba-renderer.org/"
license=('custom')
groups=()
depends=('libpng' 'libjpeg-turbo' 'libc++' 'pybind11' 'pugixml' 'tbb')
makedepends=('clang' 'git' 'cmake' 'ninja' 'patchelf' 'python' 'python-sphinx' 'python-guzzle-sphinx-theme' 'python-sphinxcontrib-bibtex')
checkdepends=('python-pytest' 'python-pytest-xdist' 'python-numpy')
install=
source=('swap_pybind.patch'
        'swap_pugixml.patch'
        'swap_tbb.patch'
        'swap_pybind_enoki.patch'
        'git+https://github.com/mitsuba-renderer/mitsuba2.git'
        'git+https://github.com/mitsuba-renderer/asmjit.git'
        'git+https://github.com/mitsuba-renderer/enoki.git'
        'git+https://github.com/mitsuba-renderer/tinyformat.git'
        'git+https://github.com/mitsuba-renderer/mitsuba-data.git'
        'git+https://github.com/mitsuba-renderer/openexr.git')
md5sums=('e40fe4bf313d60b1eb7c3da60fb6d434'
         '617bd32eecbebd8c7036f738b8275e5f'
         '3d896789646b5de546668d9f158697d1'
         'eee8327568bbe7e0fa0a8d873eb2dea0'
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
	git config submodule.ext/tinyformat.url $srcdir/tinyformat
	git config submodule.ext/openexr.url    $srcdir/openexr
	git config submodule.resources/data.url $srcdir/mitsuba-data
	git submodule update --init ext/asmjit ext/enoki ext/tinyformat ext/openexr resources/data

	# system versions of these modules are used
	rmdir ext/zlib ext/libpng ext/libjpeg

	# patch the build system to use system versions
	rmdir ext/pugixml ext/pybind11
	git apply -v $srcdir/swap_pybind.patch
	git apply -v $srcdir/swap_pugixml.patch
	git apply -v $srcdir/swap_tbb.patch
	git -C ext/enoki apply -v $srcdir/swap_pybind_enoki.patch

	# not used with the current build options
	rmdir ext/embree ext/nanogui
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

	ninja -C "$srcdir/build" mkdoc
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
