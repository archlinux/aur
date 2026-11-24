# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-k3mime
_name=${pkgname#python-}
pkgver=0.1.10
pkgrel=1
pkgdesc="MIME type detection by filename"
provides=(${pkgname})
conflicts=(${pkgname})
arch=('any')
url="https://github.com/pykit3/k3mime"
_pydeps=(
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
    python-pip
)
license=('MIT')
source=("${_name}::git+${url}.git#tag=v$pkgver")
sha256sums=('cf4b40775812ce4ba5988e66feb018d3fd13aa7148f42cc2f1b5a250531cab03')

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
