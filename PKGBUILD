# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-k3etcd
_name=${pkgname#python-}
pkgver=0.2.2
pkgrel=1
pkgdesc="Python client for the etcd v2 API, for etcd server 2.3.x to 3.5.x"
provides=(${pkgname})
conflicts=(${pkgname})
arch=('any')
url="https://github.com/pykit3/k3etcd"
_pydeps=(
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
    python-trustme
    python-pytest
    python-k3ut
    python-k3utdocker
)
license=('MIT')
source=("${_name}::git+${url}.git#tag=v$pkgver")
sha256sums=('216d83820bae3ed3649e32bf00fe300f6e857c9f2b5a85787d0ba31455668faf')

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
    # TestClient 的 setUpClass/setUp 通过 k3utdocker 拉取镜像并启动真实 etcd 集群，
    # 构建 chroot 无 Docker daemon；其余 14 个为不依赖 Docker 的纯单元测试。
    pytest -x --deselect=test/test_k3etcd.py::TestClient
}

package() {
    cd "${srcdir}/${_name}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -vDm0644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
