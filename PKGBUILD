pkgbase=faiss
pkgname=('faiss-cpu' 'faiss-gpu')
arch=('x86_64' 'aarch64')
url="https://github.com/facebookresearch/faiss"
license=('MIT')
pkgver=1.14.3
pkgrel=1.1
source=("${url}/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')
depends=('blas' 'lapack' 'openmp'
'python-numpy'
)
makedepends=('cmake'
    'git'
    'python-build'
    'python-scikit-build-core'
    'python-installer'
    'python-setuptools'
    'swig')
#checkdepends=('python-pytest')
options=(!debug)

prepare() {
	cd faiss-${pkgver}
#	echo 'set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fpermissive")' >>CMakeLists.txt
	#sed -i -e '21a set(CMAKE_BUILD_RPATH "$ORIGIN")' \
	#-e '21a set(CMAKE_BUILD_RPATH_USE_ORIGIN TRUE)' \
	#-e '21a list(APPEND CMAKE_LIBRARY_PATH ${CMAKE_INSTALL_PREFIX}/lib)' \
	#faiss/python/CMakeLists.txt
if [ -n "$ROCM_HOME" ];then
:
#	sed -i -e 's|${PROJECT_SOURCE_DIR}/faiss/gpu/hipify.sh|hipify-perl -print-stats ${PROJECT_SOURCE_DIR}/faiss/gpu/*[cu,h,cpp]*|' \
#	-e 's/GPU_EXT_PREFIX "hip"/GPU_EXT_PREFIX "cu"/' \
#	CMakeLists.txt
#	sed -i '/list(TRANSFORM FAISS_GPU_SRC REPLACE cu$ hip)/d' \
#	faiss/gpu/CMakeLists.txt
fi
}

build() {
	flags=(-DBUILD_SHARED_LIBS=ON
		-DFAISS_ENABLE_GPU=OFF
        	-DBUILD_TESTING=OFF
-DPython_EXECUTABLE=/usr/bin/python3 -DFAISS_ENABLE_PYTHON=ON
                -DCMAKE_BUILD_TYPE=Release
                -DCMAKE_INSTALL_PREFIX=/usr)
        if [[ $CARCH == 'x86_64' ]]; then
                #if [ -n "$(ld.so --help |grep 'x86-64-v4 (supported,')" ]; then
                        flags=(${flags[@]} -DFAISS_OPT_LEVEL=avx512)
                #elif [ -n "$(ld.so --help |grep 'x86-64-v3 (supported,')" ]; then
                #        flags="$flags -DFAISS_OPT_LEVEL=generic"
                #fi
        elif [[ $CARCH == 'aarch64' ]]; then
                flags=(${flags[@]} -DFAISS_OPT_LEVEL=sve)
        fi

	# cpu
	cd "${srcdir}/faiss-${pkgver}"
#	-DFAISS_ENABLE_SVS=ON
	cmake ${flags[@]} -B build .
	make -C build -j
	cd build/faiss/python
	python -m build --wheel --no-isolation

        # gpu
        cd "${srcdir}/faiss-${pkgver}"
        if [ -n "$ROCM_HOME" ];then
                flags=(${flags[@]} -DCMAKE_SHARED_LINKER_FLAGS='-Wl,--export-dynamic'
		-DBUILD_TESTING=OFF -DBUILD_SHARED_LIBS=OFF -DFAISS_ENABLE_GPU=ON 
		-DFAISS_ENABLE_ROCM=ON)
        elif [ -n "$CUDA_HOME" ];then
                flags=(${flags[@]} -DFAISS_ENABLE_GPU=ON -DCUDAToolkit_ROOT=$CUDA_HOME)
        fi

        cmake ${flags[@]} -B build_gpu .
        cmake --build build_gpu -j
        cd build_gpu/faiss/python
        python -m build --wheel --no-isolation
}

#check() {
#	cd "${srcdir}/faiss-${pkgver}"
#	make -C build test
#	cd build/faiss/python
#	pytest ../../../tests/test_*.py
#	pytest ../../../tests/torch_*.py
#}

package_faiss-cpu() {
	optdepends=('intel-mkl: for x86_64')
	pkgdesc='A library for efficient similarity search and clustering of dense vectors.'
	provides=('libfaiss' 'python-faiss')

	cd "faiss-${pkgver}/build"
	make DESTDIR="$pkgdir" install
	install -Dm 644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	cd faiss/python
	python -m installer --destdir="$pkgdir" dist/*.whl
}

package_faiss-gpu() {
	pkgdesc='A library for efficient similarity search and clustering of dense vectors (cuda or rocm accelarated).'
	conflicts=('faiss-cpu')
	optdepends=('cuda' 'rocm-hip-sdk' 'hipify-perl')
        provides=('libfaiss' 'python-faiss' 'python-faiss-gpu')
        if [ -n "$ROCM_HOME" ];then
                :
        elif [ -n "$CUDA_HOME" ];then
                depends+=('cuda')
        fi

        cd "faiss-${pkgver}/build_gpu"
        make DESTDIR="$pkgdir" install
        install -Dm 644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
        cd faiss/python
        python -m installer --destdir="$pkgdir" dist/*.whl
}
