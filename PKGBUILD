# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=oslo.service
_pycname=${_pyname/./-}
pkgname=python-${_pycname}
pkgver=3.0.0
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
md5sums=('580bf123105699376f14d4edbb771c68')
sha256sums=('87b9ea3e144a186ff1a2e1f18fd4a81f1f381a0574f5acffd93001edd04e8027')
sha512sums=('d85bc73b9e62481b0bac6146dfb3360b0301174c69459ed129e6e271b8a6beacdd10fb5fdf7c0c0ffc517c861433ce0d74b79c805e39a40f05f356ad61b52e03')

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
