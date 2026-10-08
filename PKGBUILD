# Maintainer: aliu <aaronliu 0 1 3 0  gmail com>
# Contributor: pikl <me@pikl.uk>
# Contributor: CountMurphy (sarif)
pkgname=immich-machine-learning
pkgver=3.2.4
pkgrel=1
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
	'python-opencv<6.0'
	'python-orjson'
	'python-pillow<13'
	'python-pydantic<3'
	'python-pydantic-settings<3'
	'python-python-multipart<1.0'
	'python-rich'
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
	'immich-machine-learning.service'
	'opencv.patch')
b2sums=('7cf250b78000169632631552a36755227be5bf4a206ae274f82d2f3262607352d2df749fddef16d4fb45a21bd9d6c4cdde368b7283b903d3a556a420c3e56f08'
        '2097cfbe79d07d32f696be0ec4998f987976cd3031ad5f693e84619a5da758c78a4a25171eb983b08a9b9ab567159e9be51f56226ad66ab0ea0c01d4d167d2f6'
        '928b098b8273545dffb4667c2ed92944c6d2a69c7f7b861996aaea425cf850141055327ad1a025aca0de897be71d015161021d84842dd0ebe0765c7eca6994e7')

prepare() {
	cd "${srcdir}/immich-${pkgver}/machine-learning"
	patch -p1 < "${srcdir}/opencv.patch"
}

build() {
	# from: ENV and RUN commands in machine-learning/Dockerfile
	#   * later ENV commands picked up in systemd service files
	cd "${srcdir}/immich-${pkgver}/machine-learning"
	python -m build --wheel --no-isolation
}

check() {
	cd "${srcdir}/immich-${pkgver}/machine-learning"
	 pytest
}

package() {
   cd "${srcdir}/immich-${pkgver}/machine-learning"
   python -m installer --destdir="${pkgdir}" dist/*.whl

   cd "${srcdir}"
   install -Dm644 immich-machine-learning.service "${pkgdir}/usr/lib/systemd/system/immich-machine-learning.service"
}
