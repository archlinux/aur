# Maintainer: Will Handley <wh260@cam.ac.uk>
pkgname=python-nv-one-logger-core
_repo=nv-one-logger
_tag=nv-one-logger-core-v2.3.0
pkgver=2.3.0
pkgrel=1
pkgdesc='NVIDIA OneLogger core: structured telemetry primitives for ML training jobs'
arch=('any')
url='https://github.com/NVIDIA/nv-one-logger'
license=('Apache-2.0')
depends=(
    'python>=3.8'
    'python-pydantic'
    'python-overrides'
    'python-strenum'   # AUR
    'python-toml'
    'python-typing_extensions'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-poetry-core'
)
source=("$_tag.tar.gz::https://github.com/NVIDIA/$_repo/archive/refs/tags/$_tag.tar.gz")
sha256sums=('e2be7db9f91b4f7ea692e67ec9665b7da00986a648356bd8fb50fa5f6fee22d2')

prepare() {
    # Upstream's pyproject.toml uses Poetry's pre-PEP-621 [tool.poetry]
    # schema, which poetry-core 2.x (in Arch) rejects. Replace it with a
    # minimal setuptools-backed PEP 621 pyproject — the source layout
    # (src/nv_one_logger/...) is already setuptools-compatible.
    cat > "$_repo-$_tag/nv_one_logger/one_logger_core/pyproject.toml" <<'EOF'
[build-system]
requires = ["setuptools>=61", "wheel"]
build-backend = "setuptools.build_meta"

[project]
name = "nv-one-logger-core"
version = "2.3.0"
description = "NVIDIA OneLogger core: structured telemetry primitives for ML training jobs"
readme = "README.md"
license = "Apache-2.0"
requires-python = ">=3.8"
dependencies = [
    "pydantic>=2.10.6",
    "overrides>=7.7.0",
    "StrEnum>=0.4.0",
    "toml>=0.10.2",
    "typing-extensions>=4.12.2",
]

[project.urls]
Homepage = "https://github.com/NVIDIA/nv-one-logger"

[tool.setuptools.packages.find]
where = ["src"]
EOF
}

build() {
    cd "$_repo-$_tag/nv_one_logger/one_logger_core"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_repo-$_tag/nv_one_logger/one_logger_core"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
