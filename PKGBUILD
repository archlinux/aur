# Maintainer: lilydjwg <lilydjwg@gmail.com>
# Contributor: BigfootACA <bigfoot@classfun.cn>

pkgname=python-etcd3
pkgver=0.12.0
pkgrel=4
pkgdesc="Python client for the etcd3 API"
arch=('any')
url="https://github.com/kragniz/python-etcd3"
license=('Apache-2.0')
depends=(
	python
	python-grpcio
	python-protobuf
	python-tenacity
)
makedepends=(python-setuptools)
checkdepends=(
	pifpaf
	python-bumpversion
	python-coverage
	python-flake8
	python-flake8-docstrings
	python-flake8-import-order
	python-grpcio-tools
	python-hypothesis
	python-mock
	python-pytest
	python-pytest-cov
	python-sphinx
	python-tox
	python-yaml
)
source=(python-etcd3-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha512sums=('9407b1730638de10d35b0cb73f775e1b10b3d558ebaca52ffc279dba05392794dcd61123e03b9706c5d46aa23160cdf46fa6e0553d3feb540a6cc1bdd8403265')

build(){
	cd $pkgname-$pkgver
        (
          cd etcd3
          protoc -I proto auth.proto --python_out=etcdrpc
          protoc -I proto kv.proto --python_out=etcdrpc
          protoc -I proto rpc.proto --python_out=etcdrpc
          sed -i '/^import \w\+_pb2\>/s/^/from . /' etcdrpc/rpc_pb2.py
        )
	python setup.py build
}

package(){
	cd $pkgname-$pkgver
	python setup.py install --root "$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
