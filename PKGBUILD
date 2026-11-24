# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-k3logcollector
_name=${pkgname#python-}
pkgver=0.1.7
pkgrel=1
pkgdesc="Log collector for scanning and aggregating log files"
conflicts=(${pkgname})
arch=('any')
url="https://github.com/pykit3/k3logcollector"
_pydeps=(
    k3cat
    k3thread
)
depends=('python'
    "${_pydeps[@]/#/python-}")
makedepends=(
    git
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
checkdepends=(
    python-pytest
    python-k3ut
    python-k3log
    python-k3time
)
license=('MIT')
source=("${_name}::git+${url}.git#tag=v$pkgver")
sha256sums=('63fab85fdbdd85a2bcb4ccd9226a20281287030fe9e7e52dd617d890afe8ad26')

prepare() {
    git -C "${srcdir}/${_name}" clean -dfx
}

build() {
    cd "${srcdir}/${_name}"
    python -m build --wheel --no-isolation
}

check() {
	cd "${srcdir}/${_name}"
	
    export PYTHONPATH="${srcdir}${PYTHONPATH:+:${PYTHONPATH}}"
	pytest -x
}

package() {
    cd "${srcdir}/${_name}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -vDm0644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
