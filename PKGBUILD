# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=oslo.messaging
_pycname=${_pyname/./-}
pkgname=python-${_pycname}
pkgver=12.9.1
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
	python-oslo-metrics
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
md5sums=('37ee8a1a5d3d13743410f0e4b3496c41')
sha256sums=('c83efc787347bb7953a69a07acdd4f140200edce78a92ff08ce7a863abe56ca3')
sha512sums=('808436d4a821d1f8dc8a7bf00156f6ad6a199dfc11f72e41cc4ea03c6dbb4c6ade52c1f92b4798a29cbda0c5fc07b981dbecbb1d34bb6a53b6a1b4bf8b9e5267')

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
