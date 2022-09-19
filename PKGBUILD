# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=oslo.cache
_pycname=${_pyname/./-}
pkgname=python-${_pycname}
pkgver=3.1.0
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
md5sums=('908f4b039da131f2e82d38ddb19a02b6')
sha256sums=('04c1089ca53fa6445711ed06e2e3737c5cbc55a6d0d1ea4c99cf3fb18e88738c')
sha512sums=('3f5e51ddedd0cf99c35d4164471fb51219c8f6489a902ac742a3b4b6fd2daaf12699e152f27ef84eb8dd6af08f98b700f2194de4810e479cb8fc94e6334081eb')

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
