# Maintainer: Will Handley <wh260@cam.ac.uk>
pkgname=python-nv-one-logger-pytorch-lightning-integration
_repo=nv-one-logger
_tag=nv-one-logger-pytorch-lightning-integration-v2.3.0
pkgver=2.3.0
pkgrel=1
pkgdesc='NVIDIA OneLogger PyTorch Lightning integration: wires telemetry into Lightning trainers'
arch=('any')
url='https://github.com/NVIDIA/nv-one-logger'
license=('Apache-2.0')
depends=(
    'python>=3.9'                              # upstream pins <3.14 but no real 3.14 ABI break observed
    'python-nv-one-logger-core'                # AUR
    'python-nv-one-logger-training-telemetry'  # AUR
    'python-strenum'                           # AUR
    'python-lightning'                         # AUR
)
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
)
source=("$_tag.tar.gz::https://github.com/NVIDIA/$_repo/archive/refs/tags/$_tag.tar.gz")
sha256sums=('d55275d6bd27cf7bc14d5a3c2d7abecbe630093196af5c4dfdc8af6e75e5680f')

prepare() {
    # Replace upstream's pre-PEP-621 Poetry pyproject.toml with a
    # setuptools-backed one (poetry-core 2.x in Arch rejects the old
    # schema). Also drops upstream's `python <3.14` pin — see comment in
    # the original pyproject; no real 3.14 ABI break observed in this
    # subpackage's code.
    cat > "$_repo-$_tag/nv_one_logger/one_logger_pytorch_lightning_integration/pyproject.toml" <<'EOF'
[build-system]
requires = ["setuptools>=61", "wheel"]
build-backend = "setuptools.build_meta"

[project]
name = "nv-one-logger-pytorch-lightning-integration"
version = "2.3.0"
description = "NVIDIA OneLogger PyTorch Lightning integration"
readme = "README.md"
license = "Apache-2.0"
requires-python = ">=3.9"
dependencies = [
    "nv-one-logger-core>=2.3.0",
    "nv-one-logger-training-telemetry>=2.3.0",
    "StrEnum>=0.4.0",
    "lightning>=2.2.0",
]

[project.urls]
Homepage = "https://github.com/NVIDIA/nv-one-logger"

[tool.setuptools.packages.find]
where = ["src"]
EOF
}

build() {
    cd "$_repo-$_tag/nv_one_logger/one_logger_pytorch_lightning_integration"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_repo-$_tag/nv_one_logger/one_logger_pytorch_lightning_integration"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
