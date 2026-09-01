pkgbase=faiss
pkgname=('faiss-cpu' 'faiss-gpu')
arch=('x86_64' 'aarch64')
url="https://github.com/facebookresearch/faiss"
license=('MIT')
pkgver=1.15.0
pkgrel=1
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
options=(!debug !lto)

prepare() {
	cp -a faiss-${pkgver} faiss-gpu-${pkgver}
	cd faiss-gpu-${pkgver}
	# fix macro __noinline__ conflict
	sed -i '285i target_precompile_headers(faiss_gpu_objs PUBLIC <format>)' \
faiss/gpu/CMakeLists.txt
}

build() {
	flags=(-DBUILD_SHARED_LIBS=ON
		-DFAISS_ENABLE_GPU=OFF
        	-DBUILD_TESTING=OFF
-DPython_EXECUTABLE=/usr/bin/python3 -DFAISS_ENABLE_PYTHON=ON
                -DCMAKE_BUILD_TYPE=Release
                -DCMAKE_INSTALL_PREFIX=/usr)
        if [[ $CARCH == 'x86_64' ]]; then
                flags=(${flags[@]} -DFAISS_OPT_LEVEL=avx512)
        elif [[ $CARCH == 'aarch64' ]]; then
                flags=(${flags[@]} -DFAISS_OPT_LEVEL=sve)
        fi

	# cpu
	cd "${srcdir}/faiss-${pkgver}"
#	-DFAISS_ENABLE_SVS=ON
	cmake -DCMAKE_CXX_FLAGS="-Wno-template-body" \
		${flags[@]} -B build .
	make -C build -j4
	cd build/faiss/python
	python -m build --wheel --no-isolation

        # gpu
        cd "${srcdir}/faiss-gpu-${pkgver}"
        if [ -n "$ROCM_HOME" ];then
                flags=(${flags[@]} # -DCMAKE_SHARED_LINKER_FLAGS='-Wl,--export-dynamic'
		-DBUILD_TESTING=OFF -DBUILD_SHARED_LIBS=OFF -DFAISS_ENABLE_GPU=ON 
		-DFAISS_ENABLE_ROCM=ON)
        elif [ -n "$CUDA_HOME" ];then
                flags=(${flags[@]} -DFAISS_ENABLE_GPU=ON -DCUDAToolkit_ROOT=$CUDA_HOME)
        fi

        cmake ${flags[@]} -DCMAKE_CXX_FLAGS="-Wno-template-body" -B build_gpu .
	sed -i 's/if !defined(USE_AMD_ROCM)/if defined(USE_AMD_ROCM)/' faiss/gpu/utils/Float16.cuh
	cmake --build build_gpu
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
	optdepends=('cuda' 'hip-runtime-amd' 'openmp')
        provides=('libfaiss' 'python-faiss' 'python-faiss-gpu')
        #if [ -n "$ROCM_HOME" ];then
        #        :
        #elif [ -n "$CUDA_HOME" ];then
        #        depends+=('cuda')
        #fi

        cd "faiss-gpu-${pkgver}/build_gpu"
        make DESTDIR="$pkgdir" install
        install -Dm 644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
        cd faiss/python
        python -m installer --destdir="$pkgdir" dist/*.whl
}
