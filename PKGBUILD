# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-k3cgrouparch
_name=${pkgname#python-}
pkgver=0.1.9
pkgrel=1
pkgdesc="Set up cgroup directory tree and add pid to cgroup"
provides=(${pkgname})
conflicts=(${pkgname})
arch=('any')
url="https://github.com/pykit3/k3cgrouparch"
_pydeps=(
    gevent-websocket
    k3fs
    k3thread
    k3utfjson
    k3zkutil
    kazoo
    psutil
    redis
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
    python-k3fs
)
license=('MIT')
source=("${_name}::git+${url}.git#tag=v$pkgver")
sha256sums=('8da25d0daef38cf76a39e4eaf252ac8dc8fa105cf8969a5c38216d826ee37b11')

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
