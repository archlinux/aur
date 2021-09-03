# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=oslo.limit
_pycname=${_pyname/./-}
pkgname=python-${_pycname}
pkgver=1.4.0
pkgrel=1
pkgdesc="Limit enforcement library to assist with quota calculation."
arch=(any)
url="https://docs.openstack.org/oslo.limit/latest/"
license=(Apache)
depends=(
	python
	python-pbr
	python-keystoneauth1
	python-oslo-config
	python-oslo-i18n
	python-oslo-log
	python-openstacksdk
)
makedepends=(
	python-setuptools
	python-openstackdocstheme
	python-reno
	python-sphinx
	python-sphinxcontrib-apidoc
	python-fixtures
)
checkdepends=(
	python-stestr
	python-hacking
	python-oslotest
	python-stestr
	bandit
	python-pre-commit
	python-fixtures
)
options=('!emptydirs')
source=(https://pypi.io/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.tar.gz)
md5sums=('2d8a94f5358c7c4b502195f09cc01d8d')
sha256sums=('ca11f5a19c092f8ecae9a5360584b6c0a3e6d1189eafa9dab2b6d6afb6f5507e')
sha512sums=('6c52bf009ab5ecc186b2174a49cf2b5fac6320aa0170375733f6c78d75fb8ee1850dcac172a5b6689114b83625eb7e618c299f6127772152fc049cec2eae9f6a')

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
