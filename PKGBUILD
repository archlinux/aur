# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=oslo.privsep
_pycname=${_pyname/./-}
pkgname=python-${_pycname}
pkgver=2.6.2
pkgrel=1
pkgdesc="OpenStack library for privilege separation"
arch=(any)
url="https://docs.openstack.org/oslo.privsep/latest/"
license=(Apache)
depends=(
	python
	python-pbr
	python-oslo-log
	python-oslo-i18n
	python-oslo-config
	python-oslo-utils
	python-cffi
	python-eventlet
	python-greenlet
	python-msgpack
)
makedepends=(
	python-setuptools
	python-openstackdocstheme
	python-sphinx
	python-reno
	python-sphinxcontrib-apidoc
)
checkdepends=(
	python-hacking
	python-oslotest
	python-fixtures
	python-stestr
	bandit
	python-pre-commit
)
options=('!emptydirs')
source=(https://pypi.io/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.tar.gz)
md5sums=('decca9992112049c536fe12555a99c9a')
sha256sums=('b7bdb7c575cdce6a541ec698387fdf5fba502d4cb32f912e77ed32ac0dc7133a')
sha512sums=('59cd8567ea31c17d849bc2c6f12ab8b0aeffce3341ae2a6f46c36388229a230930c3b6af9e9d59c754bf5d88a05deb11c413079b27d001ac5e49faa89baa3d1a')

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
