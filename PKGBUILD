# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=glance-store
_pycname=${_pyname//-/_}
pkgname=python-$_pyname
pkgver=2.7.0
pkgrel=1
pkgdesc="OpenStack Image Service Store library"
arch=(any)
url="https://docs.openstack.org/glance_store/latest/"
license=(Apache)
depends=(
	python
	python-oslo-config
	python-oslo-i18n
	python-oslo-serialization
	python-oslo-utils
	python-oslo-concurrency
	python-stevedore
	python-eventlet
	python-six
	python-jsonschema
	python-keystoneauth1
	python-keystoneclient
	python-requests
)
makedepends=(
	python-setuptools
	python-sphinx
	python-openstackdocstheme
	python-reno
	python-sphinxcontrib-apidoc
)
checkdepends=(
	python-hacking
	python-doc8
	python-coverage
	python-fixtures
	python-subunit
	python-requests-mock
	python-retrying
	python-stestr
	python-testscenarios
	python-testtools
	python-oslotest
	python-boto3
	python-oslo-vmware
	python-httplib2
	python-swiftclient
	python-cinderclient
	python-os-brick
	python-oslo-rootwrap
	python-oslo-privsep
)
source=("https://pypi.io/packages/source/${_pycname::1}/$_pycname/$_pycname-$pkgver.tar.gz")
md5sums=('264a478c9fb01372e7d88baa99e280ba')
sha256sums=('8f7faf76e76f2170ea124f9e5e71752da71d1db25053e73581a6291330f687b3')
sha512sums=('fc5b06dbd197d99b36e2f744f10dff77d268e1dfe13ebb85b1945f28d3b27607d7023735868e6f4bfcd63735c917a2bc21aa7772ed35a4710f9df557d4cd5a99')

export PBR_VERSION=$pkgver

build(){
	cd $_pycname-$pkgver
	python setup.py build
	sphinx-build -b html doc/source doc/build/html
}

check(){
	cd $_pycname-$pkgver
	stestr run
}

package(){
	cd $_pycname-$pkgver
	python setup.py install --root "$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
	mkdir -p "${pkgdir}/usr/share/doc"
	cp -r doc/build/html "${pkgdir}/usr/share/doc/${pkgname}"
	rm -r "${pkgdir}/usr/share/doc/${pkgname}/.doctrees"
	mv "$pkgdir"{/usr,}/etc
}
