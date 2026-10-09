# Maintainer: aliu <aaronliu 0 1 3 0  gmail com>
# Contributor: pikl <me@pikl.uk>
# Contributor: CountMurphy (sarif)
pkgname=immich-machine-learning
pkgver=3.3.1
pkgrel=1
_model_commit=8bf3fd1b44b0c8608f52fb6e50ddff52826576d8
pkgdesc="Machine learning server for the Immich photo management system"
arch=(any)
license=('AGPL-3.0-only')
url='https://github.com/immich-app/immich/tree/main/machine-learning'
depends=('python>=3.11' # 'python<4' not recommended by python
	'python-onnxruntime<2'
	'python-aiocache<1.0'
	'python-fastapi<1.0'
	'gunicorn'
	'python-huggingface-hub'
	'python-numpy>=2.4.0'
	'python-onnx>=1.22.0'
	'python-onnx-ir'
	'python-onnxscript'
	'python-opencv<6.0'
	'python-orjson'
	'python-pillow<13'
	'python-pydantic<3'
	'python-pydantic-settings<3'
	'python-python-multipart<1.0'
	'python-rich'
	'python-safetensors'
	'python-tokenizers<1.0'
	'uvicorn<1.0'
	'python-rapidocr'
)
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
checkdepends=('python-httpx' 'python-pytest' 'python-pytest-asyncio' 'python-pytest-cov' 'python-pytest-mock')
optdepends=(
	'libva-mesa-driver: GPU acceleration'
	'mesa-utils: GPU acceleration'
	'vulkan-driver: Vulkan support'
	'intel-compute-runtime: OpenCL support'
	'intel-media-driver: HW acceleration'
	'immich-server: Photo management system dependent on this'
)
source=("immich-${pkgver}.tar.gz::https://github.com/immich-app/immich/archive/refs/tags/v${pkgver}.tar.gz"
	"ml-models-${_model_commit}.tar.gz::https://github.com/immich-app/ml-models/archive/${_model_commit}.tar.gz"
	'immich-machine-learning.service'
	'opencv.patch')
b2sums=('66335b33ef0930d1c6e1d102a2a1280ad937f4f08f9438104ba386d24c5b6444f5fc28d5c21dc1fc39446770e21a9caeb901e1f999badaa577929b46465b87a3'
        '10a6ff3903a65855dca3f621fcbb60843b17c24ae587caef40f3c1791d8da5d0f5ba5b0aba3187763423793efeec58d3c8cdbd35024072d670bd6b6861f6c4dd'
        '2097cfbe79d07d32f696be0ec4998f987976cd3031ad5f693e84619a5da758c78a4a25171eb983b08a9b9ab567159e9be51f56226ad66ab0ea0c01d4d167d2f6'
        '2c18901487a3f279b0bfa19f875c6def44386bc0fdb283990ca4e9b86a928ca085093db6ff1f1833be3c93b3ae99e91044a6196a88d456d1698d2ed7f7be0481')

prepare() {
	cd "${srcdir}/immich-${pkgver}/machine-learning"
	patch -p1 < "${srcdir}/opencv.patch"
}

build() {
	# from: ENV and RUN commands in machine-learning/Dockerfile
	#   * later ENV commands picked up in systemd service files
	cd "${srcdir}/ml-models-${_model_commit}"
	python -m build --wheel --no-isolation

	cd "${srcdir}/immich-${pkgver}/machine-learning"
	python -m build --wheel --no-isolation
}

check() {
	cd "${srcdir}/immich-${pkgver}/machine-learning"
	python -m installer --overwrite-existing --destdir="${srcdir}/check" "${srcdir}/ml-models-${_model_commit}"/dist/*.whl
	PYTHONPATH="${srcdir}/check$(python -c 'import sysconfig; print(sysconfig.get_path("purelib"))')" pytest
}

package() {
   cd "${srcdir}/ml-models-${_model_commit}"
   python -m installer --destdir="${pkgdir}" dist/*.whl

   cd "${srcdir}/immich-${pkgver}/machine-learning"
   python -m installer --destdir="${pkgdir}" dist/*.whl

   cd "${srcdir}"
   install -Dm644 immich-machine-learning.service "${pkgdir}/usr/lib/systemd/system/immich-machine-learning.service"
}
