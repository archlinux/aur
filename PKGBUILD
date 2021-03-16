# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=pycadf
pkgname=python-$_pyname
pkgver=3.1.1
pkgrel=1
pkgdesc="Cloud Auditing Data Federation Library"
arch=(any)
url="https://docs.openstack.org/pycadf/latest/"
license=(Apache)
depends=(
	python
	python-oslo-config
	python-oslo-serialization
	python-pytz
	python-six
	python-debtcollector
)
makedepends=(python-setuptools)
checkdepends=(
	python-hacking
	python-flake8-docstrings
	python-coverage
	python-fixtures
	python-subunit
	python-stestr
	python-testtools
	python-openstackdocstheme
	python-sphinx
	python-sphinxcontrib-apidoc
)
backup=(
	etc/pycadf/ceilometer_api_audit_map.conf
	etc/pycadf/cinder_api_audit_map.conf
	etc/pycadf/glance_api_audit_map.conf
	etc/pycadf/neutron_api_audit_map.conf
	etc/pycadf/nova_api_audit_map.conf
	etc/pycadf/swift_api_audit_map.conf
	etc/pycadf/trove_api_audit_map.conf
)
source=(https://pypi.io/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.tar.gz)
md5sums=('af685f444aefdec58859d1c2419ba011')
sha256sums=('2be491143d21fa3dd1f842ce8dd4973e95f580893887960faa5c11a6190081e8')
sha512sums=('26e83418066d96b4d947965ea43ec3f75a667d40f4d5ed36130eb0bbc6a79bfd212e68b3a54c3db81a7cf670288612e15d40068416fe220e85ecc7670ba735da')

build(){
	cd $_pyname-$pkgver
	python setup.py build
	make -C doc man text
}

check(){
	cd "$srcdir"/$_pyname-$pkgver
	stestr run
}

package(){
	cd $_pyname-$pkgver
	python setup.py install --root "$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
	mv "$pkgdir"{/usr,}/etc
	mkdir -p "${pkgdir}/usr/share/doc"
	cp -r doc/build/text "${pkgdir}/usr/share/doc/${pkgname}"
	install -Dm 644 doc/build/man/$_pyname.1 "${pkgdir}/usr/share/man/man1/${pkgname}.1"
}
