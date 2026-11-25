# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-k3zkutil
_name=${pkgname#python-}
pkgver=0.1.11
pkgrel=1
pkgdesc="Helper functions for ZooKeeper with kazoo"
provides=(${pkgname})
conflicts=(${pkgname})
arch=('any')
url="https://github.com/pykit3/k3zkutil"
_pydeps=(
    kazoo
    k3utfjson
    k3net
    k3txutil
    k3confloader
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
    python-k3utdocker
    python-k3thread
)
license=('MIT')
source=("${_name}::git+${url}.git#tag=v$pkgver")
sha256sums=('0ded5fe89c78945e4bf233a9c4e2377f721437fffdb6a75c4b65cccf82410a6b')

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
