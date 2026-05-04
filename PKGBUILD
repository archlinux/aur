# Maintainer: Rongbo Wu <wurongbo2012@hotmail.com>
# Maintainer: Hu Butui <hot123tea123@gmail.com>

# note: ktransformers works for compute capability >= 8.0
_CUDA_ARCH_LIST="8.0;8.6;8.9;9.0;10.0;10.0+PTX"
pkgbase=python-ktransformers
pkgname=('python-kt-kernel')
_pkgname=ktransformers
pkgver=0.6.2
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
)
sha256sums=('SKIP'
)

prepare() {
	cd ${_pkgname}
	git submodule update --init --recursive -- third_party/llama.cpp

	cd kt-kernel
	sed -i 's|add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/../third_party/pybind11 ${CMAKE_CURRENT_BINARY_DIR}/third_party/pybind11)|find_package(pybind11)|' CMakeLists.txt
	sed -i 's|pip install .|build --wheel --no-isolation|g' install.sh

}

build() {
	export PIP_NO_BUILD_ISOLATION=1
	cd ${_pkgname}
	if [[ "$CUDA_HOME" ]]; then
		export CPUINFER_USE_CUDA=1
	elif [[ "$ROCM_PATH" ]]; then
		export CPUINFER_USE_ROCM=1
	fi
	cd kt-kernel
	./install.sh build
}

package_python-kt-kernel() {
	pkgdesc="High-performance kernel operations for KTransformers (AMX/AVX/KML optimizations)"
	denpends=(
		python-safetensors
		python-triton
		python-gguf
	)
	optdepends=(
		python-sglang-kt
	)
        cd "${srcdir}/${_pkgname}/kt-kernel"
        python -m installer --destdir="$pkgdir" dist/*${pkgver}*.whl
}
