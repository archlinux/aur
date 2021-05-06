# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=oslo.upgradecheck
_pycname=${_pyname/./-}
pkgname=python-${_pycname}
pkgver=1.3.0
pkgrel=2
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
md5sums=('d4b51767f8ac8d0317352e914ba98a96')
sha256sums=('110151a214cfe41219b3b1cef980d32036e3460b332a431435e1d1cc84590588')
sha512sums=('77f26cba33b1a3075c3de51fc393b65272c01e6d59bc315304a439cb95d104b7596cbd007409e18e98a5e28f90b4d4e67b59680a578bffb840795e11b56bcf76')

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
