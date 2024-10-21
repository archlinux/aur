# Maintainer: Maximilian Stahlberg <maximilian.stahlberg tuhh de>

_name=swiglpk
pkgname="python-${_name}"
pkgver=5.0.10
pkgrel=1
pkgdesc='A Python interface to the GLPK optimization solver'
arch=(any)
url='https://github.com/biosustain/swiglpk'
license=(GPL-3.0-or-later)
depends=(python glpk)
makedepends=(swig python-setuptools python-build python-installer python-wheel)
#checkdepends=(python-nose) # FIXME
conflicts=(python-swiglpk-git)
source=("https://github.com/biosustain/swiglpk/archive/${pkgver}.tar.gz")
sha256sums=('4df7cc42ed2ea83f389577e77272c607503bb92b3bab769c86fc78bfc32cbab7')

build() {
    cd "${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

check(){
    cd "${_name}-${pkgver}"

    local python_version=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
    local python_path="${PWD}/build/lib.linux-${CARCH}-cpython-${python_version}"

    if [ ! -d "${python_path}" ]; then
	echo "${python_path} does not exist"
	exit 1
    fi

    # FIXME: Unclear how to run tests; see https://github.com/opencobra/swiglpk/issues/108.
    #PYTHONPATH="${python_path}" nosetests
}

package() {
    cd "${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
