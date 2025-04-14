# Maintainer: devome <evinedeng@hotmail.com>

_pkgname=mtcnn-runtime
_pipname="${_pkgname//-/_}"
pkgname="python-${_pkgname}"
pkgver=1.0.0
pkgrel=2
pkgdesc="Python library for streamlined tracking and management of AI training processes."
arch=("any")
url="https://github.com/SAKURA-CAT/${_pkgname}"
license=('Apache-2.0')
depends=("python-onnxruntime" "python-opencv")
makedepends=('python-build' 'python-hatch-fancy-pypi-readme' 'python-hatch-requirements-txt' 'python-installer' 'python-setuptools' 'python-wheel')
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pipname}-${pkgver}.tar.gz"
        "test_mtcnn.py::${url}/raw/refs/heads/main/test/test_mtcnn.py")
sha256sums=('dc48d6566ff0229a028c5074f66989a17ed36ed5e41fe49c973925f8a5043d47'
            'd60b025951af1e97cf64d547d492c547e83aff6d79a947031aa643455a64a347')

prepare() {
    cd "${_pipname}-${pkgver}"
    sed -e "s|filename = \"requirements.txt\"|files = [ \"requirements.txt\" ]|" \
        -e "s|\"optional-dependencies\", ||" \
        -i pyproject.toml
}

build() {
    cd "${_pipname}-${pkgver}"
    python -m build --wheel --no-isolation
}

check() {
    cd "${_pipname}-${pkgver}"
    cp ../test_mtcnn.py .
    python test_mtcnn.py -vv
}

package() {
    cd "${_pipname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
