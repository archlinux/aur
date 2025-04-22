# Maintainer: Hu Butui <hot123tea123@gmail.com>

# update _CUDA_ARCH_LIST for your nvidia cards
# note: ktransformers works for compute capability >= 8.0
_CUDA_ARCH_LIST="8.0;8.6;8.9;9.0;10.0;10.0+PTX"
pkgname=python-ktransformers
_pkgname=ktransformers
pkgver=0.2.4post1
pkgrel=1
pkgdesc="A Flexible Framework for Experiencing Cutting-edge LLM Inference Optimizations"
arch=('x86_64')
url="https://github.com/kvcache-ai/ktransformers"
license=('Apache-2.0')
depends=(
	python-accelerate
	python-blessed
	python-colorlog
	python-fastapi
	python-fire
	python-flash-attention
	python-langchain
	python-protobuf
	python-pytorch-opt-cuda
	python-sentencepiece
	python-transformers
	uvicorn
)
makedepends=(
	git
	ninja
	python-build
	python-cpufeature
	cmake
	python-installer
	python-setuptools
	python-wheel
)
source=("${_pkgname}::git+https://github.com/kvcache-ai/ktransformers.git#tag=v${pkgver}"
        "0001-fix-building-torch-extension-with-glog.patch"
)
sha256sums=('cff5fe39a8c0306e4bfcd1aa46847a0d8a30d44ab5f7ddac749fe651f21ad888'
            '464ec579cf2f824b2b279147efd5ad958f9dbfbb7898c0ab509cc385de1fecd6')

prepare() {
	cd "${srcdir}/${_pkgname}"
	git submodule update --init --recursive
	patch -p1 -i "${srcdir}/0001-fix-building-torch-extension-with-glog.patch"
}

build() {
	cd "${srcdir}/${_pkgname}"
	CUDA_HOME=/opt/cuda \
	TORCH_CUDA_ARCH_LIST=${_CUDA_ARCH_LIST} \
	KTRANSFORMERS_FORCE_BUILD=TRUE \
	python -m build --wheel --no-isolation -x
}

package() {
	cd "${srcdir}/${_pkgname}"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	# remove unused dirs and files
	local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
	rm -rfv "${pkgdir}${_site_packages}/${_pkgname}/tests"
}
