# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=oslo.middleware
_pycname=${_pyname/./-}
pkgname=python-${_pycname}
pkgver=4.4.0
pkgrel=1
pkgdesc="Oslo Middleware library"
arch=(any)
url="https://docs.openstack.org/oslo.middleware/latest/"
license=(Apache)
depends=(
	python
	python-pbr
	python-jinja
	python-oslo-config
	python-oslo-context
	python-oslo-i18n
	python-oslo-utils
	python-stevedore
	python-webob
	python-debtcollector
	python-statsd
	python-bcrypt
)
makedepends=(
	python-setuptools
	python-sphinx
	python-openstackdocstheme
	python-reno
)
checkdepends=(
	python-fixtures
	python-hacking
	python-oslotest
	python-testtools
	python-coverage
	python-oslo-serialization
	bandit
	python-stestr
	python-pre-commit
)
options=('!emptydirs')
source=(https://pypi.io/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.tar.gz)
md5sums=('e6cf0e771b7a086888f1d861ad6093fb')
sha256sums=('0b91cd7e0a34b5d0cc3bbfa67bc0b1f2c543edcacef3a488dd20e70539524521')
sha512sums=('6cbfb22ec4a513bed214de32924c370ac290ebc9c6dfd6e14b60035179695f49f623dffba9313d263f818c02eaed92596ba58912daf6289760570861307beaa5')

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
