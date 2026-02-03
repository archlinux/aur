# Maintainer: Deon Spengler <deon@spengler.co.za>

pkgname=python-samplerate-ledfx
pkgver='0.2.6'
pkgrel=1
pkgdesc="Monolithic python wrapper for libsamplerate based on pybind11 and NumPy"
url="https://pypi.org/project/samplerate/#description"
depends=('python' 'libsndfile')
makedepends=('cmake' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools-scm')
license=('MIT')
arch=('x86_64')
provides=(python-samplerate)
source=("https://github.com/LedFx/python-samplerate-ledfx/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f2dee36138801ebe88515f853f0aab3a12aa59e97c7af8c5b3b5e5902f685956')

prepare() {
    cd "python-samplerate-ledfx-${pkgver}"

    # Remove cmake from build dependencies - we use system cmake
    sed -i 's/, "cmake"//' pyproject.toml

    # Fix numpy resize error with referenced arrays
    sed -i 's/output\.resize(out_shape);/output.resize(out_shape, false);/g' src/samplerate.cpp
}

build() {
    cd python-samplerate-ledfx-${pkgver}
    SETUPTOOLS_SCM_PRETEND_VERSION="${pkgver}" python -m build --wheel --no-isolation
}

package() {
    cd python-samplerate-ledfx-${pkgver}
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
