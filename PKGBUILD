# Maintainer: Adrià Cabello <adro.cc79 at protonmail dot com>
# Co-Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Started by https://github.com/qumaciel at https://github.com/PixarAnimationStudios/USD/issues/2000

pkgname=('usd'
		 'usd-extras')
_pkgname='OpenUSD'

pkgbase=usd
pkgver=23.11
pkgrel=4
arch=(x86_64)
url='https://openusd.org'
_url='https://github.com/PixarAnimationStudios/'$_pkgname
pkgdesc='3D VFX pipeline interchange file format'
license=('Apache')
options=('!strip')
depends=(glew
		gcc
		python
		boost
		jemalloc
		libglvnd
		libxt
		embree
		openexr
		opencolorio
		openimageio
		opensubdiv
		pyside2
		pyside6
		python-opengl
		python-jinja
		python-numpy
		qt5-base
		onetbb
		materialx
		ninja
		dos2unix
		)
makedepends=(cmake
			help2man
			git
			)

		# git+$_url.git#branch=dev TEST
source=("git+$_url.git#tag=v$pkgver"
		$url/images/USDLogoUnsized.svg
		"usd-tbb.patch" # https://github.com/brechtvl/USD/tree/onetbb
		"usd-embree4.patch"
		"usd-defaultfonts.patch"
		"org.openusd.usdview.desktop"
		)
sha256sums=('SKIP'
            '529dea685836be7de95800d9688db4e1df6a8a3f341130069abdd2b5b1572128'
            'e4a1378a2ce34edbd65f016689cbca0dc37dc2b1c2ddfd837724078ed231063c'
            '8cbdeb862e587e4fc73af9b52046e22d85623021649eeb56e4c14aa31fab89be'
            '3408ad2877d547f60d2db6b28983837119b8800b62ae1cdc23b37dbe31e17f1c'
            '6b880a1dc44ee3286a19b3347f65be5337192d00bccd55fa549598db90a887da')

_pyver=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
_extra=("Abc" "OpenVDB" "Draco" "Osl")

prepare() {
	cd ${srcdir}/$_pkgname

	patch -Np1 -i ${srcdir}/usd-tbb.patch
	patch -Np1 -i ${srcdir}/usd-defaultfonts.patch
	patch -Np1 -i ${srcdir}/usd-embree4.patch

	# Change directories to standard
	sed -i 's|plugin/usd|lib/usd/plugin|g' \
			cmake/macros/{Private,Public}.cmake
	sed -i 's|/python|/python'$_pyver'/site-packages|g' \
			cmake/macros/Private.cmake
	sed -i 's|lib/python/pxr|/lib/python'$_pyver'/site-packages/pxr|' \
			cmake/macros/{Private,Public}.cmake pxr/usdImaging/usdviewq/CMakeLists.txt

	sed -i 's|/pxrConfig.cmake|/lib/cmake/pxr/pxrConfig.cmake|g' \
			pxr/CMakeLists.txt
	sed -i 's|${CMAKE_INSTALL_PREFIX}|${CMAKE_INSTALL_PREFIX}lib/cmake/pxr|g' \
			pxr/CMakeLists.txt
	sed -i 's|"cmake"|"lib/cmake/pxr"|g' \
			pxr/CMakeLists.txt
	sed -i 's|${PXR_CMAKE_DIR}/cmake|${PXR_CMAKE_DIR}|g' \
			pxr/pxrConfig.cmake.in
	sed -i 's|${PXR_CMAKE_DIR}/include|/usr/include|g' \
			pxr/pxrConfig.cmake.in

	dos2unix NOTICE.txt

	# Further drop shebangs line for some py files
	sed -r -i '1{/^#!/d}' \
			pxr/usd/sdr/shaderParserTestUtils.py \
			pxr/usd/usdUtils/updateSchemaWithSdrNode.py \
			pxr/usdImaging/usdviewq/usdviewApi.py

	# Remove Google Roboto fonts
	rm -rf pxr/usdImaging/usdviewq/fonts
	
	rm -rf docs/doxygen/doxygen-awesome-css/
	
	# Support Embree4
	find . -type f -exec gawk '/embree3/ { print FILENAME }' '{}' '+' |
	xargs -r sed -r -i 's/(embree)3/\14/'

}

build() {
# 	export CC=clang && export CXX=clang++
	extra_flags="${extra_flags-} -DTBB_SUPPRESS_DEPRECATED_MESSAGES=1 $(pkgconf --cflags Imath)"

	_CMAKE_FLAGS+=(
		-DCMAKE_INSTALL_PREFIX:PATH=/
		-DCMAKE_CXX_FLAGS_RELEASE="${CXXFLAGS-} ${extra_flags}"
		-DCMAKE_C_FLAGS_RELEASE="${CFLAGS-} ${extra_flags}"
		-DCMAKE_CXX_STANDARD=17
		-DCMAKE_EXE_LINKER_FLAGS="${LDFLAGS}"
		-DCMAKE_SHARED_LINKER_FLAGS="${LDFLAGS}"
		-DCMAKE_SKIP_INSTALL_RPATH=ON
		-DCMAKE_SKIP_RPATH=ON
		-DCMAKE_VERBOSE_MAKEFILE=ON

		-DPYSIDEUICBINARY:PATH=/usr/bin/uic #QT5
# 		-DPYSIDEUICBINARY:PATH=/usr/lib/qt6/uic #QT6
		-DPYSIDE_AVAILABLE=ON
		-DPYTHON_EXECUTABLE=/usr/bin/python

# 		-DTBB_ROOT=/opt/tbb2019
# 		-DBOOST_ROOT=""

		-DPXR_INSTALL_LOCATION:STRING=/usr/lib/usd/plugin

		-DPXR_BUILD_DOCUMENTATION=OFF
		-DPXR_BUILD_EXAMPLES=OFF
		-DPXR_BUILD_IMAGING=ON
		-DPXR_BUILD_MONOLITHIC=OFF
		-DPXR_BUILD_TESTS=OFF
		-DPXR_BUILD_TUTORIALS=OFF
		-DPXR_BUILD_USD_IMAGING=ON
		-DPXR_BUILD_USD_TOOLS=ON
		-DPXR_BUILD_USDVIEW=ON

		-DPXR_VALIDATE_GENERATED_CODE=OFF
		-DPXR_INSTALL_LOCATION=/usr/lib/usd/plugin
		-DPXR_MALLOC_LIBRARY:PATH=/usr/lib/libjemalloc.so

		-DPXR_BUILD_ALEMBIC_PLUGIN=ON
		-DPXR_BUILD_DRACO_PLUGIN=ON
		-DPXR_BUILD_EMBREE_PLUGIN=ON
		-DPXR_BUILD_OPENCOLORIO_PLUGIN=ON
		-DPXR_BUILD_OPENIMAGEIO_PLUGIN=ON
		-DPXR_BUILD_PRMAN_PLUGIN=OFF
		-DPXR_ENABLE_MATERIALX_SUPPORT=ON
		-DPXR_ENABLE_OPENVDB_SUPPORT=ON
		-DPXR_ENABLE_HDF5_SUPPORT=ON
		-DPXR_ENABLE_PTEX_SUPPORT=OFF
		-DPXR_ENABLE_OSL_SUPPORT=ON
		-DPXR_ENABLE_PYTHON_SUPPORT=ON
	)
	export CXXFLAGS+=" -DBOOST_BIND_GLOBAL_PLACEHOLDERS"
	export LD_PRELOAD=/usr/lib/libjemalloc.so

	cmake -S $_pkgname -B build -G Ninja "${_CMAKE_FLAGS[@]}"

	ninja -C build -j$(($(nproc) - 4))

	rm -rf ${srcdir}/usd-fakeinstall
	DESTDIR=${srcdir}/usd-fakeinstall ninja -C build install

}

package_usd() {
	pkgdesc='3D VFX pipeline interchange file format'

	DESTDIR=${pkgdir}/usr ninja -C build install

	rm -vrf ${pkgdir}/usr/share/usd

	install -Dm644 ${srcdir}/USDLogoUnsized.svg ${pkgdir}/usr/share/icons/hicolor/scalable/apps/openusd.svg
	install -Dm755 ${srcdir}/org.openusd.usdview.desktop ${pkgdir}/usr/share/applications/org.openusd.usdview.desktop

	# Delete extra components in base package
	for name in "${_extra[@]}"; do
		find "$pkgdir" -type d -name "*$name*" -exec rm -rf {} \; || true
		find "$pkgdir" -type f -name "*$name*" -exec rm -f {} \; || true
	done
	rm ${pkgdir}/usr/bin/usdcompress

	# Man Generation
	mkdir -p ${pkgdir}/usr/share/man/man1
	for cmd in ${pkgdir}/usr/bin/*
	do
	PYTHONPATH="${pkgdir}/$(python3 -c 'import site; print(site.getsitepackages()[0])')" \
	LD_PRELOAD=/usr/lib/libjemalloc.so:$LD_PRELOAD \
		help2man \
		--no-info --no-discard-stderr --version-string="$pkgver" \
		--output=${pkgdir}/usr/share/man/man1/$(basename "${cmd}").1 \
		"${cmd}"
	done

	sed -i 's|${PXR_CMAKE_DIR}/cmake|${PXR_CMAKE_DIR}|g' \
			${pkgdir}/usr/lib/cmake/pxr/pxrConfig.cmake
	sed -i 's/_IMPORT_PREFIX ""/_IMPORT_PREFIX "\/usr"/' \
			${pkgdir}/usr/lib/cmake/pxr/pxrTargets.cmake


	install -Dm644 ${srcdir}/$_pkgname/NOTICE.txt ${pkgdir}/usr/share/doc/usd
	install -Dm644 ${srcdir}/$_pkgname/README.md ${pkgdir}/usr/share/doc/usd
	install -Dm644 ${srcdir}/$_pkgname/LICENSE.txt ${pkgdir}/usr/share/doc/licenses/usd
}

package_usd-extras() {
	pkgdesc='Extra components for USD'
	depends=(usd=$pkgver
			alembic
			draco
			openshadinglanguage
			openvdb)

	for name in "${_extra[@]}"; do
		find usd-fakeinstall -type d -name "*$name*" -exec cp --parents -r {} ${pkgdir}/ \; || true
		find usd-fakeinstall -type f -name "*$name*" -exec cp --parents {} ${pkgdir}/ \; || true
	done

	mv ${pkgdir}/usd-fakeinstall ${pkgdir}/usr

}
