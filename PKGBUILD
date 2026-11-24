# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-k3redisutil
_name=${pkgname#python-}
pkgver=0.1.8
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
sha256sums=('5ca02e3654d6cfe4d19eca18c88160a208ec3f007be35f58ed2ac6d827f652c4')

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
	# These classes start real Redis containers via k3utdocker/Docker,
	# which needs a running daemon at /var/run/docker.sock (absent in the
	# build chroot). Other tests use fakes/local HTTP servers.
	pytest -x \
		--deselect=test/test_k3redisutil.py::TestRedis::test_set_get \
		--deselect=test/test_k3redisutil.py::TestRedis::test_list_channel \
		--deselect=test/test_k3redisutil.py::TestRedisRecreate::test_recreate_client
}

package() {
    cd "${srcdir}/${_name}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -vDm0644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
