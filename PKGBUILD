# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-k3num
_name=${pkgname#python-}
pkgver=0.1.14
pkgrel=3
pkgdesc="Human-readable number formatting and hex string utilities"
provides=(${pkgname})
conflicts=(${pkgname})
arch=('any')
url="https://github.com/pykit3/k3num"
_pydeps=(
)
depends=('python'
    "${_pydeps[@]/#/python-}")
makedepends=(
    'git'
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
checkdepends=(
    python-pytest
    python-k3ut
)
license=('MIT')
source=("${_name}::git+${url}.git#tag=v$pkgver")
sha256sums=('13b97c7afa3085b0adb5b79ffc440ae0b2dec3c322833fe8996f8facd2d5040f')

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
