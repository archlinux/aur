# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=oslo.limit
_pycname=${_pyname/./-}
pkgname=python-${_pycname}
pkgver=1.3.0
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
)
checkdepends=(
	python-stestr
	python-hacking
	python-oslotest
	python-stestr
	bandit
	python-pre-commit
)
options=('!emptydirs')
source=(https://pypi.io/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.tar.gz)
md5sums=('fd12e78328edf12aebfef069610d4564')
sha256sums=('3063c53b5a1ab03b55e0feeb468c252d036711f37064f44a506647b379e6c453')
sha512sums=('cc4d759be885d3c3fcf72ecc96f31a0746bc7e74eb2643d3017268728fb839d39b8d6f6732d75b4152dee73547888d3ba2d5adad52dce24db4afa7f76f6c2492')

export PBR_VERSION=$pkgver

build(){
	cd $_pyname-$pkgver
	export PYTHONPATH="${PWD}"
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
	mkdir -p "$pkgdir/usr/share/doc"
	cp -r doc/build/text "$pkgdir/usr/share/doc/${pkgname}"
	rm -r "$pkgdir/usr/share/doc/${pkgname}/.doctrees"
}
