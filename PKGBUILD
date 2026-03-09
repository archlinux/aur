# Maintainer: Hu Butui <hot123tea123@gmail.com>

# note: ktransformers works for compute capability >= 8.0
_CUDA_ARCH_LIST="8.0;8.6;8.9;9.0;10.0;10.0+PTX"
pkgbase=python-ktransformers
pkgname=('python-ktransformers' 'python-kt-kernel')
_pkgname=ktransformers
pkgver=0.5.2.post1
pkgrel=1
arch=('x86_64' 'aarch64')
url="https://kvcache.ai"
license=('Apache-2.0')
depends=(
	python-pytorch
)

makedepends=(
	git
	ninja
	python-build
	python-cmake
	python-cpufeature
	python-installer
	python-packaging
	python-setuptools
	python-wheel
	pybind11
)
optdepends=(
	python-flash-attn
	python-pytest
	python-psutil
)

source=("${_pkgname}::git+https://github.com/kvcache-ai/ktransformers.git#tag=v${pkgver}"
        "setup-with-glog.patch"
)
sha256sums=('SKIP'
            '538620faa124510cf8fee9a5b4944cce0a80cfd73d8ff92bc8abe75e116cdad5'
)

prepare() {
	cd ${_pkgname}
	git submodule update --init --recursive -- third_party/llama.cpp
	patch -p1 -i "${srcdir}/setup-with-glog.patch"
	cd kt-kernel
	sed -i 's|add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/../third_party/pybind11 ${CMAKE_CURRENT_BINARY_DIR}/third_party/pybind11)|find_package(pybind11)|' CMakeLists.txt
	sed -i 's|pip install .|build --wheel --no-isolation|g' install.sh

	cd ../kt-sft
	sed -i 's|add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/../../../third_party/pybind11 ${CMAKE_CURRENT_BINARY_DIR}/third_party/pybind11)|find_package(pybind11)|' csrc/ktransformers_ext/CMakeLists.txt
}

build() {
	export PIP_NO_BUILD_ISOLATION=1
	cd ${_pkgname}/kt-kernel
	if [[ "$CUDA_HOME" ]]; then
		export CPUINFER_USE_CUDA=1
	elif [[ "$ROCM_PATH" ]]; then
		export CPUINFER_USE_ROCM=1
	fi
	./install.sh build

	cd ../kt-sft
	python -m build --wheel --no-isolation -x
#	sed -i 's/nv_bfloat/hip_bfloat/g' csrc/custom_marlin/gptq_marlin/*hip*
}

package_python-ktransformers() {
	pkgdesc="enhance your Transformers experience with advanced kernel optimizations and placement/parallelism strategies."
	depends=(
		python-blessed
		python-colorlog
		python-fire
		python-fastapi
		python-langchain
		python-sentencepiece
		python-transformers
		uvicorn
	)
	optdepends=(
		python-flashinfer
		python-torchviz
	)
	cd "${srcdir}/${_pkgname}/kt-sft"
	python -m installer --destdir="$pkgdir" dist/*.whl 
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/python-ktransformers/LICENSE"

	# remove unused dirs and files
	#local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
	#rm -rfv "${pkgdir}${_site_packages}/${_pkgname}/tests"
}

package_python-kt-kernel() {
	pkgdesc="High-performance kernel operations for KTransformers (AMX/AVX/KML optimizations)"
	denpends=(
		python-safetensors
		python-compressed-tensors
		python-triton
		python-gguf
	)
        cd "${srcdir}/${_pkgname}/kt-kernel"
        python -m installer --destdir="$pkgdir" dist/*.whl
}
