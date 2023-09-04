# Maintainer: Adrià Cabello <adro.cc79 at protonmail dot com>
# Co-Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Started by https://github.com/qumaciel at https://github.com/PixarAnimationStudios/USD/issues/2000

pkgname=('usd'
		'usd-embree'
		'usd-alembic'
		'usd-draco'
		'usd-openvdb'
		'usd-openshadinglanguage'
		 )
_pkgname='OpenUSD'

pkgbase=usd
pkgver=23.08
pkgrel=7
arch=(x86_64)
url='https://openusd.org'
_url='https://github.com/PixarAnimationStudios/'$_pkgname
license=('Apache')
options=('!strip')
depends=(glew
		gcc
		python
		boost
		jemalloc
		libglvnd
		libxt
		openexr
		opencolorio
		openimageio
		opensubdiv
		pyside2
		pyside6
		python-opengl
		qt5-base
		onetbb
		)
makedepdends=(cmake
			help2man
			 )

		# git+$_url.git#branch=dev TEST
source=("git+$_url.git#tag=v$pkgver"
		$url/images/USDLogoUnsized.svg
		"org.openusd.usdview.desktop"
		"usd-tbb.patch"
		"usd-embree4.patch"
		"usd-defaultfonts.patch"
		)
sha256sums=('SKIP'
            '529dea685836be7de95800d9688db4e1df6a8a3f341130069abdd2b5b1572128'
            '6e598e28c36f3953ecdcd9fc0fccc5a591b654a8eccc08881f9ea33ffb32591a'
            'a73c5c69478f27a6db9a7c5ad41b4a12825081c82f47f8e1e04c8e9d92c8e75a'
            'bce5bd6e41d8192948021f5e2b6b3b7302dd49234d353227503d6d0711205a19'
            '3408ad2877d547f60d2db6b28983837119b8800b62ae1cdc23b37dbe31e17f1c')

python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')

prepare() {
	cd ${srcdir}/$_pkgname

	patch -Np1 -i ${srcdir}/usd-tbb.patch
	patch -Np1 -i ${srcdir}/usd-defaultfonts.patch
	patch -Np1 -i ${srcdir}/usd-embree4.patch

	# Change directories to standard
	sed -i 's|plugin/usd|lib/usd/plugin|g' \
			cmake/macros/{Private,Public}.cmake
	sed -i 's|/python|/python'$python_version'/site-packages|g' \
			cmake/macros/Private.cmake
	sed -i 's|lib/python/pxr|/lib/python'$python_version'/site-packages/pxr|' \
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

	# Use c++17 standard
	sed -i 's|set(CMAKE_CXX_STANDARD 14)|set(CMAKE_CXX_STANDARD 17)|g' cmake/defaults/CXXDefaults.cmake

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

	# Delete components to split
	local delete=("Embree" "Abc" "OpenVDB" "Draco" "Osl")
	for name in "${delete[@]}"; do
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

package_usd-embree() {
	pkgdesc='Embree component for USD'
	depends=(usd=$pkgver
			embree)

	find usd-fakeinstall -type f -name "*Embree*" -exec cp --parents {} ${pkgdir}/ \;
	find usd-fakeinstall -type d -name "*Embree*" -exec cp --parents -r {} ${pkgdir}/ \;
	mv ${pkgdir}/usd-fakeinstall ${pkgdir}/usr

}

package_usd-alembic() {
	pkgdesc='Alembic component for USD'
	depends=(usd=$pkgver
			alembic)

	find usd-fakeinstall -type f -name "*Abc*" -exec cp --parents {} ${pkgdir}/ \;
	find usd-fakeinstall -type d -name "*Abc*" -exec cp --parents -r {} ${pkgdir}/ \;
	mv ${pkgdir}/usd-fakeinstall ${pkgdir}/usr
}

package_usd-draco() {
	pkgdesc='Draco component for USD'
	depends=(usd=$pkgver
			draco)

	find usd-fakeinstall -type f -name "*Draco*" -exec cp --parents {} ${pkgdir}/ \;
	find usd-fakeinstall -type d -name "*Draco*" -exec cp --parents -r {} ${pkgdir}/ \;
	mv ${pkgdir}/usd-fakeinstall ${pkgdir}/usr

	install -Dm755 ${srcdir}/usd-fakeinstall/bin/usdcompress ${pkgdir}/usr/bin/usdcompress
}

package_usd-openvdb() {
	pkgdesc='OpenVDB component for USD'
	depends=(usd=$pkgver
			openvdb)

	find usd-fakeinstall -type f -name "*OpenVDB*" -exec cp --parents {} ${pkgdir}/ \;
	find usd-fakeinstall -type d -name "*OpenVDB*" -exec cp --parents -r {} ${pkgdir}/ \;
	mv ${pkgdir}/usd-fakeinstall ${pkgdir}/usr
}

package_usd-openshadinglanguage() {
	pkgdesc='OSL (OpenShadingLanguage) component for USD'
	depends=(usd=$pkgver
			openimageio)

	find usd-fakeinstall -type f -name "*Osl*" -exec cp --parents {} ${pkgdir}/ \;
	find usd-fakeinstall -type d -name "*Osl*" -exec cp --parents -r {} ${pkgdir}/ \;
	mv ${pkgdir}/usd-fakeinstall ${pkgdir}/usr
}
