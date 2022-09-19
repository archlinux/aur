# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=glance-store
_pycname=${_pyname//-/_}
pkgname=python-$_pyname
pkgver=4.1.0
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
md5sums=('721ff5df6edb6e1fd19a0ecc338b16c8')
sha256sums=('f621e6f676aa0d3682580f3f3ba833afdc077238c97253fbd0bbbd0b9995e04b')
sha512sums=('81462535de76897203d9c9772f1aef6fcce658a09d9c85e61debf0f94a14839b09a4fbe4bb6539b98f6c89297f8298ab77655cebc3a63daab282257f47e5efeb')

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
