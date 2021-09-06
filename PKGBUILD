# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=oslo.policy
_pycname=${_pyname/./-}
pkgname=python-${_pycname}
pkgver=3.8.2
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
md5sums=('511a86e6bf9ffd4e8f5fb041d2262d7a')
sha256sums=('233030f9acbc3cb894c66943fd71406ec12825776021f5dda4afab6f1762837f')
sha512sums=('6daea44a93f53608529314b5eb780d999a1ffd65c3c54f05d58341254f99754c94e177ad01bb37aa036f98f3211bb3705c499ad6244a68165ae56fa59943c79a')

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
