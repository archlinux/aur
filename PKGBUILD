# Maintainer: aliu <aaronliu 0 1 3 0  gmail com>
# Contributor: pikl <me@pikl.uk>
pkgname=immich-machine-learning
pkgver=2.7.5
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
	'python-opencv<5.0'
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
# makedepends=('uv')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
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
	'insightface.patch')
b2sums=('93b5f24e7e0ff951df7460a8c04229dfcf69fb01bafc59ebacb48348a4ef167f4204c72862a307aaf32b68a57c2b7c555d4a29b1d98f76c933db680e63ec50c5'
        '2097cfbe79d07d32f696be0ec4998f987976cd3031ad5f693e84619a5da758c78a4a25171eb983b08a9b9ab567159e9be51f56226ad66ab0ea0c01d4d167d2f6'
        '5a3d96580e379149a5641d35103a98e9e89918a6523a664395c382fa5e0cf864ac99caf98ce66d04460262ac7929ac39f11297471ce8d2ecc56379542ddd3246')

prepare() {
	cd "${srcdir}/immich-${pkgver}/machine-learning"
	patch -p1 < "${srcdir}/insightface.patch"
}

build() {
	# from: ENV and RUN commands in machine-learning/Dockerfile
	#   * later ENV commands picked up in systemd service files
	cd "${srcdir}/immich-${pkgver}/machine-learning"
	python -m build --wheel --no-isolation
}

package() {
   cd "${srcdir}/immich-${pkgver}/machine-learning"
   python -m installer --destdir="${pkgdir}" dist/*.whl

   cd "${srcdir}"
   install -Dm644 immich-machine-learning.service "${pkgdir}/usr/lib/systemd/system/immich-machine-learning.service"
}
