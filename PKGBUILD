# Maintainer: aliu <aaronliu 0 1 3 0  gmail com>
# Contributor: pikl <me@pikl.uk>
pkgname=immich-machine-learning
pkgver=2.3.1
pkgrel=2
pkgdesc="Machine learning server for the Immich photo management system"
arch=(any)
license=('AGPL-3.0-only')
depends=('python>=3.11'  # 'python<4' not recommended by python
	'onnxruntime>=1.23.0' 'python-onnxruntime<2'
	'python-aiocache>=0.12.1' 'python-aiocache<1.0'
    'python-fastapi>=0.95.2' 'python-fastapi<1.0'
    'python-ftfy>=6.1.1'
    'gunicorn>=21.1.0'
    'python-huggingface-hub>=0.20.1'  # 'python-huggingface-hub<1.0'
    'python-insightface>=0.7.3' 'python-insightface<1.0'
    'python-numpy>=2.3.4'
    'python-opencv>=4.7.0.72' 'python-opencv<5.0'
    'python-orjson>=3.9.5'
    'python-pillow>=9.5.0'  # 'python-pillow<11.0'
    'python-pydantic>=2.0.0' 'python-pydantic<3'
    'python-pydantic-settings>=2.5.2' 'python-pydantic-settings<3'
    'python-python-multipart>=0.0.6' 'python-python-multipart<1.0'
    'python-rich>=13.4.2'
    'python-tokenizers>=0.15.0' 'python-tokenizers<1.0'
    'uvicorn>=0.22.0' 'uvicorn<1.0'
    'python-rapidocr>=3.1.0'
	# Transitive dependencies that repos haven't correctly indicated yet
	'python-ml-dtypes>=0.5.0'  # for python-onnx>=1.19.0
	'python-albumentationsx'  # for insightface when albucore>=0.0.29
)
# makedepends=('uv>=0.8.15')
makedepends=('python-build' 'python-installer' 'python-wheel')
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
sha256sums=('20bd60862447e7e369189f9390f8e013b50101cf2fb7561ed47793bcb63c6cc8'
            'f9215f428f5bd596a24c0cce90ccfa3724d8caf33d7b5811e73b2b5277c111cd')

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
