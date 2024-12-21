# Maintainer: Eric Berquist <eric dot berquist at gmail dot com>

_name="exdir"
pkgname="python-${_name}"
pkgver=0.5.0.1
pkgrel=1
pkgdesc="Directory structure standard for experimental pipelines"
arch=("any")
url="https://exdir.readthedocs.io/"
license=("MIT")
makedepends=("python-build"
             "python-installer"
             "python-setuptools"
             "python-wheel")
depends=("python-numpy" "python-ruamel-yaml")
optdepends=(
  "python-quantities"
)
checkdepends=(
  "python-h5py"
  "python-pytest"
  "python-quantities"
)
source=("https://github.com/CINPLA/${_name}/archive/refs/tags/v${pkgver}.tar.gz"
        "numpy-2.diff")
sha256sums=('fc74a6cdb52c6b664f88a7da3933aff245e561bc27d8300bba9a35035c59bd26'
            '7f64ac7ff662a35a4ffd25d0a89b7bf28fcc63bfc799c5bb6817126d69c81872')

prepare() {
  cd "${srcdir}/${_name}-${pkgver}"

  # $(git diff 07f1e62 ecfabcd) needed for NumPy 2
  patch -p0 -i ../numpy-2.diff
}

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -D -m644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}

check() {
  cd "${srcdir}/${_name}-${pkgver}"
  python -m pytest
}
