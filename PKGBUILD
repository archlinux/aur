# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=oslo.upgradecheck
_pycname=${_pyname/./-}
pkgname=python-${_pycname}
pkgver=1.4.0
pkgrel=1
pkgdesc="Common code for writing OpenStack upgrade checks"
arch=(any)
url="https://docs.openstack.org/oslo.upgradecheck/latest/"
license=(Apache)
depends=(
	python
	python-pbr
	python-oslo-config
	python-oslo-i18n
	python-prettytable
	python-oslo-utils
	python-oslo-policy
)
makedepends=(
	python-setuptools
	python-sphinx
	python-openstackdocstheme
	python-reno
)
checkdepends=(
	python-hacking
	python-oslotest
	python-stestr
	python-pre-commit
	python-oslo-serialization
)
options=('!emptydirs')
source=(https://pypi.io/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.tar.gz)
md5sums=('332ee28ac0b82e1234c3a9b551a972d9')
sha256sums=('fed6db548731388e7ee4cb064ac76b524ff3397fdc63a59c5c569fc6642b6713')
sha512sums=('ce53c01a6e144788c16f36af74d4593e850631c4552560e36ac17b1583d966ba2df83dc4a4251a81ccb35363935688b1d901de718e2149dd86473cdcc2570961')

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
