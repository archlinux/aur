# Maintainer: Will Handley <wh260@cam.ac.uk>
pkgname=python-nv-one-logger-core
_srcname=nv_one_logger_core
pkgver=2.3.1
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
source=("https://files.pythonhosted.org/packages/source/n/${_srcname}/${_srcname}-${pkgver}.tar.gz")
sha256sums=('cbb2f87604c78b96a302f32d87199902129d76153a73a20f8455a250b3246c1d')

prepare() {
    cd "$_srcname-$pkgver"
    # Keep upstream metadata while allowing Arch's Poetry 2 build backend.
    sed -i -e 's/\[project.urls\]/[tool.poetry.urls]/' \
        -e 's/poetry-core>=1.9.1,<2.0.0/poetry-core>=1.9.1/' \
        -e 's/, "python-semantic-release>=9.8.3,<10.0"//' pyproject.toml
}

build() {
    cd "$_srcname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_srcname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
