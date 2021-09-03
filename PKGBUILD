# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=oslo.metrics
_pycname=${_pyname/./-}
pkgname=python-${_pycname}
pkgver=0.3.0
pkgrel=1
pkgdesc="Oslo Metrics API"
arch=(any)
url="https://docs.openstack.org/oslo.metrics/latest/"
license=(Apache)
depends=(
	python
	python-pbr
	python-oslo-utils
	python-oslo-log
	python-oslo-config
	python-prometheus_client
)
makedepends=(
	python-setuptools
	python-openstackdocstheme
	python-reno
	python-sphinx
	python-sphinxcontrib-apidoc
	python-oslotest
)
checkdepends=(
	python-hacking
	python-oslotest
	python-coverage
	python-stestr
	bandit
)
options=('!emptydirs')
source=(https://pypi.io/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.tar.gz)
md5sums=('4c28b7ff3701c7b489a65938fcf317ce')
sha256sums=('9e25c21943e12df9b7390025b92b5112118d4b43bc96a5191eb0a112a0e4e84a')
sha512sums=('f30370d2837ceca015b32d66dafb71d11bf1bfb01d47afa09bdf2e57d0fd65011e30b5e2de68c0f635d5710068b23944f4112f5a22260ed6350aaa7e3c64c4d7')

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
