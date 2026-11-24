# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-k3zkutil
_name=${pkgname#python-}
pkgver=0.1.10
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
sha256sums=('ae1bcfed8e2cbbc24911c1f62a051fa67c41eda0be42605cb55783889d1a732c')

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
    pytest -x \
        --deselect=test/test_acid.py::TestAcid \
        --deselect=test/test_cached_reader.py::TestCachedReader::test_cache \
        --deselect=test/test_cached_reader.py::TestCachedReader::test_cb \
        --deselect=test/test_cached_reader.py::TestCachedReader::test_update \
        --deselect=test/test_cached_reader.py::TestCachedReader::test_ex \
        --deselect=test/test_cached_reader.py::TestCachedReader::test_watch \
        --deselect=test/test_k3zkutil.py::TestZKinit \
        --deselect=test/test_k3zkutil.py::TestWait \
        --deselect=test/test_zklock.py::TestZKLock::test_bounded_listener \
        --deselect=test/test_zklock.py::TestZKLock::test_concurrent \
        --deselect=test/test_zklock.py::TestZKLock::test_persistent \
        --deselect=test/test_zklock.py::TestZKLock::test_timeout \
        --deselect=test/test_zklock.py::TestZKLock::test_lock_holder \
        --deselect=test/test_zklock.py::TestZKLock::test_watch_acquire \
        --deselect=test/test_zklock.py::TestZKLock::test_set_locked_key \
        --deselect=test/test_zklock.py::TestZKLock::test_try_lock \
        --deselect=test/test_zklock.py::TestZKLock::test_try_release \
        --deselect=test/test_zklock.py::TestZKLock::test_zk_lost \
        --deselect=test/test_zklock.py::TestZKLock::test_node_change_after_acquired \
        --deselect=test/test_zklock.py::TestZKLock::test_node_change_after_released \
        --deselect=test/test_zklock.py::TestZKLock::test_is_locked \
        --deselect=test/test_zklock.py::TestZKLock::test_conn_lost_when_blocking_acquiring \
        --deselect=test/test_zklock.py::TestZKLock::test_internal_zkclient \
        --deselect=test/test_zklock.py::TestZKLock::test_acl \
        --deselect=test/test_zklock.py::TestZKLock::test_config \
        --deselect=test/test_zklock.py::TestZKLock::test_hosts \
        --deselect=test/test_zklock.py::TestZKLock::test_specify_identifier \
        --deselect=test/test_zklock.py::TestZKLock::test_release_listener_removed \
        --deselect=test/test_zklock.py::TestZKLock::test_release_owning_client_stopped \
        --deselect=test/test_zklock.py::TestZKLock::test_release_after_node_replaced
}

package() {
    cd "${srcdir}/${_name}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -vDm0644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
