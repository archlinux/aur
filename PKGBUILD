# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=oslo.vmware
_pycname=${_pyname/./-}
pkgname=python-${_pycname}
pkgver=4.0.1
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
md5sums=('0863e703cdf5bdf47131fa1e6de52d0d')
sha256sums=('94fbe78f8d12b95bd09f4501638afa26079c6b7abb65f98335ce116aa06950cc')
sha512sums=('0fe36214b4b3261af79b0780ef0e50e44c1cbea0a237381f1fc7fe05a6c2aa7e7b9e4cb5140e2c3f4861b53e051d68ad7ba7fdc36b931ac7649170a407a46d08')

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
