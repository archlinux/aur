# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=oslo.messaging
_pycname=${_pyname/./-}
pkgname=python-${_pycname}
pkgver=14.0.0
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
md5sums=('baf22245c7a34f5ffed229373e10f7f1')
sha256sums=('49917adeef2f795c9d9fad8714997cabb3df2ca7fac57c8bb119617bff2874c3')
sha512sums=('01fc34749987167e988142786eb27f612ef396b44a57987ad2f7fb3493b0cd9eaad8bc0f2d9c898184dd014132a4e35583e20dcef3428101af1ee912f2af6d0a')

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
