# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=oslo.versionedobjects
_pycname=${_pyname/./-}
pkgname=python-${_pycname}
pkgver=2.5.0
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
md5sums=('f3711b4e7c4b5e57372b200b0d4203f8')
sha256sums=('ad08dbe84a808ce17e76c41ec3f682b1201ed685346e63c6ebcb22fdd908768c')
sha512sums=('1eceac157f223e25cb08041fc2d7f73d9f4b5d8fb75cf5a542c6c6a1ecb16457c1f15cbed227b742a62c1608744dcee1f11d3dd1e8841bd9bc9990880b9bb73f')

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
