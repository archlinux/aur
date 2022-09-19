# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=oslo.middleware
_pycname=${_pyname/./-}
pkgname=python-${_pycname}
pkgver=5.0.0
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
md5sums=('85eaa484469c368a4f85d4ed720372b3')
sha256sums=('3d0f2fd723d194d2a8c64068e8a057a5038c860abe0c03f6f0f08cf7b86781d1')
sha512sums=('8bd1f4d2cb0203abee1c2c6d53761c921993a68f9855caf6563285159f3029fdffec9336a0a8a8825890e075ecc01ab575d96263dfd2827f21a47a21339b7f52')

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
