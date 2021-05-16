# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=oslo.policy
_pycname=${_pyname/./-}
pkgname=python-${_pycname}
pkgver=3.8.0
pkgrel=1
pkgdesc="Oslo Policy library"
arch=(any)
url="https://docs.openstack.org/oslo.policy/latest/"
license=(Apache)
depends=(
	python
	python-pbr
	python-requests
	python-oslo-config
	python-oslo-context
	python-oslo-i18n
	python-oslo-serialization
	python-pyaml
	python-stevedore
	python-oslo-utils
)
makedepends=(
	python-setuptools
	python-sphinx
	python-sphinxcontrib-apidoc
	python-openstackdocstheme
	python-reno
)
checkdepends=(
	python-oslotest
	python-requests-mock
	python-stestr
	python-sphinx
	python-coverage
)
options=('!emptydirs')
source=(https://pypi.io/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.tar.gz)
md5sums=('2ad2be0a33a5dcb838d9f5e4b2e3227c')
sha256sums=('31f4a4c94fddc1247e829349575b4358e21412ee0a4d4d9c1b37ba6be8c3f022')
sha512sums=('374af8005b677c2d7cf83ac7a6714f44caed1c5e06727261934ba3f5559fbe25db15d9768ade7ff945fd59a85e630b5c5b1898b43249ba21c6345fd4d15df584')

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
