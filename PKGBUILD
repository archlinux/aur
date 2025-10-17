# Maintainer: aliu <aaronliu 0 1 3 0  gmail com>
# Contributor: pikl <me@pikl.uk>
pkgname=immich-machine-learning
pkgver=2.1.0
pkgrel=1
pkgdesc="Machine learning server for the Immich photo management system"
arch=(any)
# PYTHON V3.12 REQUIRED
#   Current incompatibility with arch base version of python (3.13)
#   so depend on python312. Cannot use python=3.12 since the AUR
#   package does not contain a provides=.
depends=('python312')
makedepends=('uv')
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
sha256sums=('acc20b8d4cc2b9024f934bd74f9a544493ea13b3bd0a8039ddd70677a5fb071c'
            'ce6fae49e23d705b8d08205d981bb217eaf55347a499a8d0492b7ed95b520cff')

_installdir=/usr/lib/immich/immich-machine-learning
_venvdir="${_installdir}/venv"

build() {
    # from: ENV and RUN commands in machine-learning/Dockerfile
    #   * later ENV commands picked up in systemd service files
    cd "${srcdir}/immich-${pkgver}/machine-learning"
    # pip install of uv not required because uv is a makedep
    export PYTHONUNBUFFERED=1  # for logging
    uv sync --frozen --extra cpu --no-dev --no-editable --no-progress --python 3.12 --no-managed-python
    # delete any uv bytecode
    find ".venv" -type f -name "*.py[co]" -delete
    find ".venv" -type d -name "__pycache__" -delete
    # relocate without breaking
    sed -i "s|${srcdir}/immich-${pkgver}/machine-learning/\.venv|${_venvdir}|g" ".venv/bin/"*
}

package() {
   cd "${srcdir}/immich-${pkgver}"

   # install machine-learning
   # from: machine-learning/Dockerfile COPY commands
   #   * setting NODE_ENV=production and others picked up in systemd service file
   install -dm755 "${pkgdir}${_installdir}"
   cp -r "machine-learning/.venv" "${pkgdir}${_installdir}/venv"
   cp -r "machine-learning/immich_ml" "${pkgdir}${_installdir}"
   cp -r "machine-learning/ann" "${pkgdir}${_installdir}"

   cd "${srcdir}"
   install -Dm644 immich-machine-learning.service "${pkgdir}/usr/lib/systemd/system/immich-machine-learning.service"
}
