# Maintainer: Anty0 <anty150 at gmail dot com>


# Helper variables for updaurpkg (https://aur.archlinux.org/packages/updaurpkg-git)
_upstreamver='0.51.0'
_upstreamver_regex='^[0-9]+\.[0-9]+\.[0-9]+$'
_source_type='github-tags'
_repo='VeriFIT/mata'


_pkgname=mata
pkgname="python-${_pkgname}"
pkgver="${_upstreamver}"
pkgrel=1
epoch=1
pkgdesc="Pyhton bindings for open source automata library that offers interface for different kinds of automata (NFA, AFA, etc.)"
arch=('x86_64')
url="https://github.com/${_repo}"
license=('GPL3')
groups=()
depends=(
    'python'
    'python-tabulate'
    'python-pandas'
    'python-networkx'
    'mata'
)
optdepends=()
makedepends=(
    'cython'
    'python-setuptools'
    'python-wheel'
    'python-build'
    'python-installer'
)
checkdepends=(
    'python-pytest'
    'python-pytest-cov'
    'python-coverage'
)
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('514d5695886ee02fb7ddf9e5e2a5293354fa0cbdc02fe7acf74d233f9e8a350b')

prepare() {
    cd "${_pkgname}-${pkgver}"

    # Supply verion in VERSION file
    printf '%s' "${pkgver}" > VERSION


    cd "bindings/python"

    # Patch setup.py to use libmata shared library instead of building it again
    perl -0777 -p -i -e 's/sources=\["libmata.pyx"\].*?,/sources=["libmata.pyx"], libraries=["mata"],/s' setup.py
}

build() {
    cd "${_pkgname}-${pkgver}/bindings/python"
    python -m build --wheel --no-isolation
}

# check(){
#     cd "${_pkgname}-${pkgver}/bindings/python"
#     pytest --durations=5 --cov=./ --cov-report term-missing:skip-covered tests/
# }

package() {
    cd "${_pkgname}-${pkgver}/bindings/python"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
