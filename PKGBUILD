# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=oslo.privsep
_pycname=${_pyname/./-}
pkgname=python-${_pycname}
pkgver=3.0.1
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
md5sums=('96951be7cf8a90ad7a55ffac32fc1e88')
sha256sums=('c50977470b09a4016254dadc274837673604bd07b23b9d77a00769c47a0b05e4')
sha512sums=('fc373a6c8690545f8e8fb9a2d05e7ce8b25453f31b7f5cf7c851573b7492b7c333583c35ed08b6867af6e928759764dcb6a4cc733550b0fc1be0eab216e9bae3')

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
