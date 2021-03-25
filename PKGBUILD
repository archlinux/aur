# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=confluent-kafka
pkgbase=python-$_pyname
pkgname=(python{,2}-$_pyname)
pkgver=1.6.1
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
md5sums=('810bd441c5a21a7fa8f0a8cbcaca45e9')
sha256sums=('800f9cf5ec421dab82c01355bfa9ed819b70d70b01ca1e41c0f8526e5f340ddf')
sha512sums=('fe8b900381dbc5a178518205e1d18db5ccec1eeb17ccc59e6072fb8381418ffae097cd353d28fddd69ca939482ecaddc43310e74f1da3533f92701855c7372f5')

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
