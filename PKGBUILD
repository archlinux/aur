# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=oslo.metrics
_pycname=${_pyname/./-}
pkgname=python-${_pycname}
pkgver=0.5.0
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
md5sums=('2da28a79fcf9dc8c975ca57675c63bc4')
sha256sums=('db9ae0d7dd3ba1a55f55c25226919ee1f454cfc2535ffa98d5b31ee3cbb67cc5')
sha512sums=('e41236e54844cafc41f5a65602505291d2e3a80a5e01c3aa6f4c039ddd199a898d4c00b9b2d6ea923de6687217aceced409efa740b06be9d3b305b0bb7fe6038')

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
