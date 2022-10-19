# Maintainer: Anty0 <anty150 at gmail dot com>


# Helper variables for updaurpkg (https://aur.archlinux.org/packages/updaurpkg-git)
_upstreamver='1.4.1'
_upstreamver_regex='^[0-9]+\.[0-9]+\.[0-9]+$'
_source_type='github-tags'
_repo='VeriFIT/mata'


_pkgname=mata
pkgname="python-${_pkgname}"
pkgver="${_upstreamver}"
pkgrel=1
pkgdesc="Pyhton bindings for open source automata library that offers interface for different kinds of automata (NFA, AFA, etc.)"
arch=('x86_64')
url="https://github.com/${_repo}"
license=('GPL3')
groups=()
depends=(
    'python'
    'python-tabulate'
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
sha256sums=('33f5a7f4d68403ab2e5c48b4050162c25702d0f89ef9c101f2573ff9af7ac09a')

prepare() {
    cd "${_pkgname}-${pkgver}/bindings/python"

    # Patch setup.py to use libmata shared library instead of building it again
    sed -i -e 's/sources=\["mata.pyx"\].*/sources=["mata.pyx"],/g' -e 's/.*get_cpp_sources(simlib_source_dir),.*/        libraries=["mata"],/' setup.py
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
