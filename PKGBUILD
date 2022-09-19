# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=confluent-kafka
pkgbase=python-$_pyname
pkgname=(python{,2}-$_pyname)
pkgver=1.9.2
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
md5sums=('09ab474fe8fefff6e40df1cea4ba0832')
sha256sums=('2fb97bd25d436bd59fe079885aa77a3a2f23cface9c6359d4700053665849262')
sha512sums=('bc78c168294dc0eedd6fcc2ae979ab3d9c49c926faf1bb0c5449aeab4d5495388ef012f19ccdfe1614dae0d7d07a7c0bb3295b6cc69b58d1e8b13761ea6e8763')

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
