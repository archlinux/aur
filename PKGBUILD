# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=oslo.reports
_pycname=${_pyname/./-}
pkgname=python-${_pycname}
pkgver=2.3.0
pkgrel=1
pkgdesc="Oslo Reports library"
arch=(any)
url="https://docs.openstack.org/oslo.reports/latest/"
license=(Apache)
depends=(
	python
	python-pbr
	python-jinja
	python-oslo-serialization
	python-psutil
	python-oslo-i18n
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
	python-hacking
	python-oslotest
	python-stestr
	python-oslo-config
	python-eventlet
	python-greenlet
	python-coverage
	python-pre-commit
	bandit
)
options=('!emptydirs')
source=(https://pypi.io/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.tar.gz)
md5sums=('33bc0d4665c3f060aa84f8b3c8423236')
sha256sums=('665cb23ca148bfd802ebb4ab883feb5e3e3749ef6fc77d3c18803c7db2c11451')
sha512sums=('7baf354d6e0a332805c0383cfa47171b9f0f32470a0257bdcff0b67cd401623dfb2187f7e4ba65c74e0da6fa053bf8caca7f5d3cf3ac00b1b4cf7549e0c6bc75')

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
