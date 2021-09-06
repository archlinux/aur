# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=oslo.vmware
_pycname=${_pyname/./-}
pkgname=python-${_pycname}
pkgver=3.9.1
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
md5sums=('734cd180365ce259cb33f3b87f51b652')
sha256sums=('57f8e8ad571b76f3b40d6a6dfc924583747eb45113bbf696a9ae92c4339cac50')
sha512sums=('323eead60aa91f6fb82c928f5140d3447d45c657d889564bc5ad47eb53f057f54873210695734b3366d3b3b9cf9d248c92211168eb0bda61d7fadc7ca49bd1e9')

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
