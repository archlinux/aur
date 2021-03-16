# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=oslo.privsep
_pycname=${_pyname/./-}
pkgname=python-${_pycname}
pkgver=2.5.0
pkgrel=1
pkgdesc="OpenStack library for privilege separation"
arch=('any')
url="https://docs.openstack.org/oslo.privsep/latest/"
license=('Apache')
depends=(
	python
	python-oslo-log
	python-oslo-i18n
	python-oslo-config
	python-oslo-utils
	python-cffi
	python-eventlet
	python-greenlet
	python-msgpack
)
makedepends=(
	python-setuptools
	python-openstackdocstheme
	python-sphinx
	python-reno
	python-sphinxcontrib-apidoc
)
checkdepends=(
	python-hacking
	python-oslotest
	python-fixtures
	python-stestr
	bandit
	python-pre-commit
)
options=('!emptydirs')
source=(https://pypi.io/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.tar.gz)
md5sums=('f69c47ab712f0f20c08131bf4b621765')
sha256sums=('97a969fac3d70f61151b3dfbfc04b4541b4954b60de34fdc11525dc6002ae0d2')
sha512sums=('aa042e0ff53bd636e916f68940927ca5aa7b74a4d0ed0d7e62280815beb5b015c3bc8476aff0ab60070bcd948f800b7e3d4b6f83d12ec67eb7d4c5494121a9bb')

build(){
	cd $_pyname-$pkgver
	python setup.py build
	PYTHONPATH=${PWD} sphinx-build -b html doc/source doc/build/html
}

check(){
	cd $_pyname-$pkgver
	PYTHONPATH=${PWD} stestr run
}

package(){
	cd $_pyname-$pkgver
	python setup.py install --root="$pkgdir/" --optimize=1
	mkdir -p "${pkgdir}/usr/share/doc"
	cp -r doc/build/html "${pkgdir}/usr/share/doc/${pkgname}"
}
