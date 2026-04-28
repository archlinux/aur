# Maintainer: Will Handley <wh260@cam.ac.uk>
pkgname=python-nv-one-logger-training-telemetry
_repo=nv-one-logger
_tag=nv-one-logger-training-telemetry-v2.3.0
pkgver=2.3.0
pkgrel=1
pkgdesc='NVIDIA OneLogger training telemetry: instruments ML training jobs'
arch=('any')
url='https://github.com/NVIDIA/nv-one-logger'
license=('Apache-2.0')
depends=(
    'python>=3.8'
    'python-nv-one-logger-core'  # AUR
    'python-strenum'             # AUR
    'python-typing_extensions'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
)
source=("$_tag.tar.gz::https://github.com/NVIDIA/$_repo/archive/refs/tags/$_tag.tar.gz")
sha256sums=('85034832aa330c849f2c4d5319e19414f67e383a852b7a88a10e96618fc2ba2c')

prepare() {
    # Same poetry-core 2.x incompatibility as nv-one-logger-core: replace
    # the pre-PEP-621 pyproject with a setuptools-backed one. src/ layout
    # is already setuptools-compatible.
    cat > "$_repo-$_tag/nv_one_logger/one_logger_training_telemetry/pyproject.toml" <<'EOF'
[build-system]
requires = ["setuptools>=61", "wheel"]
build-backend = "setuptools.build_meta"

[project]
name = "nv-one-logger-training-telemetry"
version = "2.3.0"
description = "NVIDIA OneLogger training telemetry"
readme = "README.md"
license = "Apache-2.0"
requires-python = ">=3.8"
dependencies = [
    "nv-one-logger-core>=2.3.0",
    "StrEnum>=0.4.0",
    "typing-extensions>=4.12.2",
]

[project.urls]
Homepage = "https://github.com/NVIDIA/nv-one-logger"

[tool.setuptools.packages.find]
where = ["src"]
EOF
}

build() {
    cd "$_repo-$_tag/nv_one_logger/one_logger_training_telemetry"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_repo-$_tag/nv_one_logger/one_logger_training_telemetry"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
