# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=oslo.metrics
_pycname=${_pyname/./-}
pkgname=python-${_pycname}
pkgver=0.2.1
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
	python-stestr
	bandit
)
options=('!emptydirs')
source=(https://pypi.io/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.tar.gz)
md5sums=('6e43f355e9cc70bcd35462407c3dec9e')
sha256sums=('684fa7efabae73e24efac9561bd52ed0792eab548aa2bb185b75a93737108d94')
sha512sums=('0493683ba72205a365f3795876f63c17fd70dd1f64002c66a28d0aab4e7518a0db66454cfb29767ba625582f75943696b2ce2c2ba4a79f2ae0d2e7321ec2329f')

export PBR_VERSION=$pkgver

build(){
	cd $_pyname-$pkgver
	export PYTHONPATH="${PWD}"
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
	mkdir -p "$pkgdir/usr/share/doc"
	cp -r doc/build/text "$pkgdir/usr/share/doc/${pkgname}"
	rm -r "$pkgdir/usr/share/doc/${pkgname}/.doctrees"
}
