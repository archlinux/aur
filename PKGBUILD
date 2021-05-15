# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=confluent-kafka
pkgbase=python-$_pyname
pkgname=(python{,2}-$_pyname)
pkgver=1.7.0
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
md5sums=('6690aa4605764d6a7c3f102f125a684a')
sha256sums=('80e01b4791513c27eded8517af847530dfdf04c43d99ff132ed9c3085933b75b')
sha512sums=('242736ba1538bef2b9627554e107ec0b435ff78dba321efd3b6feaafea786d6d35641753ea473962962dc0eefca204612483796b68e166f5016618f04c5fd705')

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
