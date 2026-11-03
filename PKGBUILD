# Maintainer: Harriet Brien <harrietao@users.noreply.github.com>

# MatterTune includes a Cython extension (graph_partition.pyx) and
# requires numpy at build time for C header paths.
#
# Generate .SRCINFO after editing:
#   makepkg --printsrcinfo > .SRCINFO

pkgname=python-mattertune
_pkgname=MatterTune
pkgver=0.1.0.r441.fea9022
pkgrel=1
pkgdesc="Fine-tuning platform for atomistic foundation models (Fung Lab, Georgia Tech)"
arch=('x86_64')
url="https://github.com/Fung-Lab/MatterTune"
license=('MIT')
depends=(
    'python>=3.10'
    'python-pytorch'
    'python-torchmetrics'
    'python-ase'
    'python-numpy'
    'python-rich'
    'python-pydantic>=2.13'
)
# nshconfig and nshconfig-extra are PyPI-only packages (by the same author).
# They are not in the Arch repos or AUR. Install them before building:
#   pip install nshconfig nshconfig-extra
# or create AUR packages for them. They are listed as pip makedepends below.
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
    'cython'
    'python-numpy'
    'git'
)
# nshconfig and nshconfig-extra must be installed in the build environment:
#   pip install nshconfig nshconfig-extra
optdepends=(
    'python-lightning: training framework (install via pip: pip install lightning)'
    'python-scikit-learn: normalizer utilities for training'
    'python-wandb: Weights and Biases experiment logging'
    'tensorboardx: TensorBoard experiment logging'
    'python-pymatgen: materials data IO and structure handling'
    'python-vesin: neighbor-list provider for some backbones'
    'python-matscipy: neighbor-list provider for some backbones'
)
source=("${_pkgname}::git+https://github.com/Fung-Lab/MatterTune.git")
sha256sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    printf "0.1.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${_pkgname}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
