# Maintainer: aliu <aaronliu 0 1 3 0  gmail com>
# Contributor: pikl <me@pikl.uk>
pkgname=immich-machine-learning
pkgver=3.0.1
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
	'python-insightface<2.0'
	'python-numpy'  # upstream recommends <2.4 for CPUs below x86-64-v2
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
b2sums=('2fb4f53b8a4c7b7b4978598365aecc73367b8a7c9c70f0e72051afed4bc2f624449ee5b5421aba1310203478aac8b4f05e898f5e2eb860689118bc5702877b0e'
		'2097cfbe79d07d32f696be0ec4998f987976cd3031ad5f693e84619a5da758c78a4a25171eb983b08a9b9ab567159e9be51f56226ad66ab0ea0c01d4d167d2f6'
		'a444630fe3591d24daf733e436274b9cebb1b4efbe9f4fa9ce5acec324894107a0fd47abaca447e0eec9142a6c02a71900cd4d9f2a70c391695e9dde7fec11b2')

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
