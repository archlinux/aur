# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=oslo.limit
_pycname=${_pyname/./-}
pkgbase=python-${_pycname}
pkgname=(python-${_pycname}{,-doc})
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
	python setup.py build
	sphinx-build -b html doc/source doc/build/html
}

check(){
	cd $_pyname-$pkgver
	stestr run
}

_package_pkg(){
	cd $_pyname-$pkgver
	python setup.py install --root="$pkgdir/" --optimize=1
}

_package_doc(){
	pkgdesc="${pkgdesc} Documents"
	depends=()
	cd $_pyname-$pkgver
	DOCDIR="$pkgdir/usr/share/doc"
	mkdir -p "$DOCDIR"
	cp -r doc/build/html "$DOCDIR/${pkgname}"
	rm -r "$DOCDIR/${pkgname}/.doctrees"
}

eval "package_${pkgbase}(){ _package_pkg; }"
eval "package_${pkgbase}-doc(){ _package_doc; }"
