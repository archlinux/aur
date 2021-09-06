# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=oslo.service
_pycname=${_pyname/./-}
pkgname=python-${_pycname}
pkgver=2.6.0
pkgrel=1
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
md5sums=('063c4da5c17164e4b7631957b0f4c011')
sha256sums=('7d58aa94c407f935570e47362107af8e9d5585c855a17ae34d3b9aa9750939f6')
sha512sums=('102690b122822bafaf7614d97c753475665befc2153c6af0348e6766fdbb9e96bcb1dcda0221fa925031691a53a9f3c9bf9102a380c2f561c057241920192e12')

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
