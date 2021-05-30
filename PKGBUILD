# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=oslo.messaging
_pycname=${_pyname/./-}
pkgname=python-${_pycname}
pkgver=12.8.0
pkgrel=1
pkgdesc="Oslo Messaging API"
arch=(any)
url="https://docs.openstack.org/oslo.messaging/latest/"
license=(Apache)
depends=(
	python
	python-pbr
	python-futurist
	python-oslo-config
	python-oslo-log
	python-oslo-utils
	python-oslo-serialization
	python-oslo-service
	python-stevedore
	python-debtcollector
	python-cachetools
	python-webob
	python-pyaml
	python-amqp
	python-kombu
	python-oslo-middleware
)
makedepends=(
	python-setuptools
	python-openstackdocstheme
	python-sphinx
	python-reno
	python-fixtures
	python-confluent-kafka
	python-pyngus
	python-tenacity
)
checkdepends=(
	python-hacking
	python-fixtures
	python-stestr
	python-pre-commit
	python-testscenarios
	python-testtools
	python-oslotest
	python-pifpaf
	python-confluent-kafka
	python-coverage
	python-pyngus
	bandit
	python-eventlet
	python-greenlet
)
options=('!emptydirs')
source=(https://pypi.io/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.tar.gz)
md5sums=('6c9775ceadf7b740a9538ef8d9fa2871')
sha256sums=('175bdf808722f7679508f95a23b59e78a7a71601a784aee53c12f24b0f304ecb')
sha512sums=('44c6d87d3b79da5b881a9fe6fe6adbae7758f2907d81896995952d746b17372a261421cd9a709ab6b93aa4ed693515e81937954d8f5e966fe721769c9f231582')

export PBR_VERSION=$pkgver

build(){
	cd $_pyname-$pkgver
	export PYTHONPATH="$PWD"
	python setup.py build
	sphinx-build -b text doc/source doc/build/text
}

check(){
	cd $_pyname-$pkgver
	stestr run
}

package(){
	cd $_pyname-$pkgver
	python setup.py install --root="$pkgdir/" --optimize=1
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
	mkdir -p "$pkgdir/usr/share/doc"
	cp -r doc/build/text "$pkgdir/usr/share/doc/$pkgname"
	rm -r "$pkgdir/usr/share/doc/$pkgname/.doctrees"
}
