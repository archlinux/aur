# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-k3wsjobd
_name=${pkgname#python-}
pkgver=0.1.8
pkgrel=1
pkgdesc="Gevent-based WebSocket server for async job processing"
provides=(${pkgname})
conflicts=(${pkgname})
arch=('any')
url="https://github.com/pykit3/k3wsjobd"
_pydeps=(
    gevent-websocket
    psutil
    k3thread
    k3utfjson
    k3jobq
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
    python-websocket-client
    python-k3ut
    python-k3proc
    python-k3daemonize
)
license=('MIT')
source=("${_name}::git+${url}.git#tag=v$pkgver")
sha256sums=('6b38d43ccc3a4acc50080791db015abb5eadeac53704b493c887fceedfab1653')

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
