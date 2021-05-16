# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=oslo.vmware
_pycname=${_pyname/./-}
pkgname=python-${_pycname}
pkgver=3.9.0
pkgrel=1
pkgdesc="Oslo VMware library"
arch=(any)
url="https://docs.openstack.org/oslo.vmware/latest/"
license=(Apache)
depends=(
	python
	python-pbr
	python-stevedore
	python-netaddr
	python-oslo-i18n
	python-oslo-utils
	python-pyaml
	python-lxml
	python-suds-jurko
	python-eventlet
	python-requests
	python-urllib3
	python-oslo-concurrency
	python-oslo-context
)
makedepends=(
	python-setuptools
	python-openstackdocstheme
	python-sphinx
	python-reno
	python-fixtures
	python-sphinxcontrib-apidoc
)
checkdepends=(
	python-hacking
	python-fixtures
	python-testtools
	python-stestr
	python-coverage
	bandit
	python-ddt
	python-oslo-context
	python-pre-commit
)
options=('!emptydirs')
source=(https://pypi.io/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.tar.gz)
md5sums=('ab4890841718ff1a1bb3bc877a1aebfb')
sha256sums=('d029f39bb9e4bb7fbb0f9b095d2e32eccd8e4917b6224bae98a2f8ce94ce26e7')
sha512sums=('8fd4dae06da7eb569bd157d67908c724f87e3c836929e74b38d8964050aaa1492f59ee2348df48ccacaeb24ff283598a6ac66003c4756924fa5d1f04c029b350')

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
