# Maintainer: aliu <aaronliu 0 1 3 0  gmail com>
# Contributor: pikl <me@pikl.uk>
pkgname=immich-machine-learning
pkgver=2.7.2
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
	'python-insightface<1.0'
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
	# Transitive dependencies that repos haven't correctly indicated yet
	'python-albumentationsx'  # for insightface when albucore
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
	"immich-machine-learning.service")
sha256sums=('762903e71e63357f722fade032d629600af4b004514694e303e08da44780fe80'
            '57c0e902457d7adae80a5152dc2d985edc58743d018d79f2da41054a843930cf')

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
