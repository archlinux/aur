# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-k3utdocker
_name=${pkgname#python-}
pkgver=0.1.7
pkgrel=1
pkgdesc="Docker client utilities for unit testing"
provides=(${pkgname})
conflicts=(${pkgname})
arch=('any')
url="https://github.com/pykit3/k3utdocker"
_pydeps=(
    docker
    k3ut
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
)
license=('MIT')
source=("${_name}::git+${url}.git#tag=v$pkgver")
sha256sums=('07cb27423aab538e31597e2163cf11f6ccd4181a8ce09433fb4cc2dce47e5b9d')

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
	# This test connects to a real Docker daemon at /var/run/docker.sock,
	# which is not available in the build chroot. The other tests use mocks.
	pytest -x --deselect=test/test_k3utdocker.py::TestK3utdocker::test_build_image
}

package() {
    cd "${srcdir}/${_name}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -vDm0644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
