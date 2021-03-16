# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=confluent-kafka
pkgbase=python-$_pyname
pkgname=(python{,2}-$_pyname)
pkgver=1.6.0
pkgrel=1
pkgdesc="Confluent's Python client for Apache Kafka"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://github.com/confluentinc/confluent-kafka-python"
license=(Apache)
makedepends=(
	librdkafka
	python
	python-avro
	python-fastavro
	python-requests
	python-pytest-timeout
	python-jsonschema
	python-pyrsistent
	python-protobuf
	python-setuptools
	python2
	python2-avro
	python2-requests
	python2-pytest-timeout
	python2-pyrsistent
	python2-protobuf
	python2-setuptools
)
source=(https://pypi.io/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.tar.gz)
md5sums=('997799934224368a0e9cfcbe4d637e7f')
sha256sums=('8a9caabdb02e87cd65c7f10f689ba3f1a15f8774de455e96fa5fc56eecfee63c')
sha512sums=('80ba5690d5e2abc2e296c792ce15fb2431ae5c2ccb116a0bc1c6d001041ab1353b4e2bb1c6764384ea8209b766f2201afd7774a1ff0d916134ec0bc5039c90ee')

prepare(){
	cp -a $_pyname-$pkgver{,-py2}
	sed -i '1s/ python$/ python2/g' $(find $_pyname-$pkgver-py2 -name '*.py')
}

build(){
	pushd $_pyname-$pkgver
	python setup.py build
	popd
	pushd $_pyname-$pkgver-py2
	python2 setup.py build
	popd
}

_package_python(){
	depends=(
		librdkafka
		python
		python-avro
		python-fastavro
		python-requests
		python-pytest-timeout
		python-jsonschema
		python-pyrsistent
		python-protobuf
	)
	cd $_pyname-$pkgver
	python setup.py install --root "$pkgdir" --optimize=1
	install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
	rm -f "$pkgdir"/usr/LICENSE.txt
}

_package_python2(){
	depends=(
		librdkafka
		python2
		python2-avro
		python2-requests
		python2-pytest-timeout
		python2-pyrsistent
		python2-protobuf
	)
	cd $_pyname-$pkgver-py2
	python2 setup.py install --root "$pkgdir" --optimize=1
	install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
	rm -f "$pkgdir"/usr/LICENSE.txt
}

eval "package_python-${_pyname}(){ _package_python; }"
eval "package_python2-${_pyname}(){ _package_python2; }"
