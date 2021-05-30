# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=oslo.cache
_pycname=${_pyname/./-}
pkgname=python-${_pycname}
pkgver=2.8.0
pkgrel=2
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
md5sums=('95800e23fe5896f7cf7bbf24cc0aa314')
sha256sums=('df6719808835ec13d98c9cc2dcd99d7bb50d72755cf347f7299c663ffb76c2e8')
sha512sums=('9eade48ccc56b6387e497b59dc72b59e9f9b76ae32931b696d7d312ec34fede64b31200afd6d755409207a966ff5cc9715a3f4f9881d64b0323ef03f6f250609')

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
