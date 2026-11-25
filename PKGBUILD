# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-k3redisutil
_name=${pkgname#python-}
pkgver=0.1.10
pkgrel=1
pkgdesc="Redis utilities for easier client management and proxy support"
provides=(${pkgname})
conflicts=(${pkgname})
arch=('any')
url="https://github.com/pykit3/k3redisutil"
_pydeps=(
    redis
    k3awssign
    k3confloader
    k3http
    k3utfjson
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
    python-mock
    python-pytest
    python-k3utdocker
    python-k3thread
    python-k3ut
)
license=('MIT')
source=("${_name}::git+${url}.git#tag=v$pkgver")
sha256sums=('43f9a138c0cc0b7c6ca197b1c17555a0f135df256d7df400a4bb4c93676cb37d')

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
