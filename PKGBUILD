# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=oslo.cache
_pycname=${_pyname/./-}
pkgname=python-${_pycname}
pkgver=2.8.1
pkgrel=1
pkgdesc="Cache storage for OpenStack projects."
arch=(any)
url="https://docs.openstack.org/oslo.cache/latest/"
license=(Apache)
depends=(
	python
	python-pbr
	python-dogpile.cache
	python-oslo-config
	python-oslo-i18n
	python-oslo-log
	python-oslo-utils
)
makedepends=(
	python-setuptools
	python-openstackdocstheme
	python-sphinx
	python-reno
	python-sphinxcontrib-apidoc
	python-mock
	python-oslotest
	python-binary-memcached
	python-memcached
	python-etcd3gw
)
checkdepends=(
	python-hacking
	python-oslotest
	python-pifpaf
	bandit
	python-stestr
	python-pre-commit
	python-pymemcache
	python-binary-memcached
	python-memcached
	python-pymongo
	python-etcd3gw
)
options=('!emptydirs')
source=(https://pypi.io/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.tar.gz)
md5sums=('7b31017f4cf50f3f11ce99e49c677ced')
sha256sums=('b5dbb5492a032bc8b1fb6c247c0f87560dba67384eb724a3d500ebe301d8330f')
sha512sums=('da91158415e3553c35092dc0c76d11ebae646d4e7e14ac1ad7394d9a951efc3ac963069838ccac0bd3fa84391aec7a7b0f7ca6c2771a3f0b160338d23e79afd1')

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
