# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=oslo.service
_pycname=${_pyname/./-}
pkgname=python-${_pycname}
pkgver=2.5.0
pkgrel=2
pkgdesc="Oslo Service API"
arch=(any)
url="https://docs.openstack.org/oslo.service/latest/"
license=(Apache)
depends=(
	python
	python-pbr
	python-webob
	python-debtcollector
	python-eventlet
	python-fixtures
	python-greenlet
	python-oslo-utils
	python-oslo-concurrency
	python-oslo-config
	python-oslo-log
	python-oslo-i18n
	python-pastedeploy
	python-routes
	python-paste
	python-yappi
)
makedepends=(
	python-setuptools
	python-sphinx
	python-openstackdocstheme
	python-reno
)
checkdepends=(
	python-fixtures
	python-hacking
	python-oslotest
	python-requests
	python-stestr
	python-doc8
	python-coverage
	bandit
	python-pre-commit
)
options=('!emptydirs')
source=(https://pypi.io/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.tar.gz)
md5sums=('fb59c5c4e5b3081e0f9172a1af3ec6ce')
sha256sums=('147da1140bc112f0aba810ebf05f16775a181a7d9e8e87e19e8a59a49ecbcc28')
sha512sums=('fa7ecc1a62664475a1382b13896e50ae22198fac670580aabafaba4564669b49023372286346e084aa1dc3c44049ba3893429e41eba4f98ed7448a2af6f788eb')

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
