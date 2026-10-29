# Maintainer: Will Handley <wh260@cam.ac.uk>
pkgname=python-nv-one-logger-pytorch-lightning-integration
_srcname=nv_one_logger_pytorch_lightning_integration
pkgver=2.3.1
pkgrel=1
pkgdesc='NVIDIA OneLogger PyTorch Lightning integration: wires telemetry into Lightning trainers'
arch=('any')
url='https://github.com/NVIDIA/nv-one-logger'
license=('Apache-2.0')
depends=(
    'python>=3.9'
    'python-nv-one-logger-core>=2.3.1'                # AUR
    'python-nv-one-logger-training-telemetry>=2.3.1'  # AUR
    'python-strenum'                           # AUR
    'python-setuptools>=79.0.0'
    'python-lightning>=2.2.0'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-poetry-core'
)
source=("https://files.pythonhosted.org/packages/source/n/${_srcname}/${_srcname}-${pkgver}.tar.gz"
        "lightning-checkpoint-types.patch")
sha256sums=('b32d99b6a8f02a16538bcade939b0a7edd7249e936aacefe336b5519447340c3'
            '67a3717c7224021e99201abfbce16c9dc84017b09c2856b2c635f7a892f2f6e0')

prepare() {
    cd "$_srcname-$pkgver"
    # Keep upstream metadata while allowing Arch's Poetry 2 build backend.
    sed -i -e 's/\[project.urls\]/[tool.poetry.urls]/' \
        -e 's/poetry-core>=1.9.1,<2.0.0/poetry-core>=1.9.1/' \
        -e 's/, "python-semantic-release>=9.8.3,<10.0"//' pyproject.toml
    # The Arch build and import checks exercise the system Python version.
    sed -i 's/python = ">=3.9,<3.14"/python = ">=3.9"/' pyproject.toml
    patch -Np1 -i "$srcdir/lightning-checkpoint-types.patch"
}

build() {
    cd "$_srcname-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    PYTHONPATH="$srcdir/$_srcname-$pkgver/src" python -c \
        'from nv_one_logger.training_telemetry.integration.pytorch_lightning import OneLoggerPTLTrainer'
}

package() {
    cd "$_srcname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
