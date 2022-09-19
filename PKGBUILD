# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=oslo.versionedobjects
_pycname=${_pyname/./-}
pkgname=python-${_pycname}
pkgver=3.0.1
pkgrel=1
pkgdesc="Oslo Versioned Objects library"
arch=(any)
url="https://docs.openstack.org/oslo.versionedobjects/latest/"
license=(Apache)
depends=(
	python
	python-pbr
	python-oslo-concurrency
	python-oslo-config
	python-oslo-context
	python-oslo-messaging
	python-oslo-serialization
	python-oslo-utils
	python-iso8601
	python-oslo-log
	python-oslo-i18n
	python-webob
	python-netaddr
)
makedepends=(
	python-setuptools
	python-openstackdocstheme
	python-sphinx
	python-reno
	python-mock
	python-fixtures
)
checkdepends=(
	python-hacking
	python-oslotest
	python-testtools
	python-coverage
	python-jsonschema
	python-stestr
	python-fixtures
	python-pre-commit
	bandit
)
options=('!emptydirs')
source=(https://pypi.io/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.tar.gz)
md5sums=('b482fc968e598a0b468c2f2a0e9d596d')
sha256sums=('2878dcb4645ea2e1e519d0dedb829bd6d5a120e8d6792758101b95d14e5419fc')
sha512sums=('0f2568775fc134c68aed5546482648cdb4117698b0e75c4bbd1a15d7beadd1f100bcbc5b4f59b42ef4f6791bdac8bea9ee191a900c0951523832f7db8e319caa')

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
