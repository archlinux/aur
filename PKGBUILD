# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-k3cat
_name=${pkgname#python-}
pkgver=0.1.7
pkgrel=1
pkgdesc="Like nix command cat or tail, continuously scan a file line by line"
provides=(${pkgname})
conflicts=(${pkgname})
arch=('any')
url="https://github.com/pykit3/k3cat"
_pydeps=(
    k3confloader
    k3portlock
    k3utfjson
    k3fs
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
    python-k3proc
    python-k3thread
    python-k3ut
)
license=('MIT')
source=("${_name}::git+${url}.git#tag=v$pkgver")
sha256sums=('73924c7ff50a501610eb5ef66ecf06ccd0151c583ba83dd377c5e96eb3f44b48')

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
