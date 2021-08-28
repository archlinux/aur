# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=pymemcache
pkgbase=python-$_pyname
pkgname=(python{,2}-$_pyname)
pkgver=3.5.0
pkgrel=1
pkgdesc="A comprehensive, fast, pure Python memcached client"
arch=(any)
url="https://github.com/pinterest/pymemcache"
license=(Apache)
makedepends=(
	python
	python-six
	python-setuptools
	python2
	python2-six
	python2-setuptools
)
checkdepends=(
	python-future
	python-mock
	python-pytest
	python-pytest-cov
	python-gevent
	python-pylibmc
	python-memcached
)
source=(https://pypi.io/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.tar.gz)
md5sums=('717cab2068070a62af7d9c30cc842c40')
sha256sums=('5bf9c94a6bc9ad081dc9b5808284e027d755a0518f6375a57405552938c74d91')
sha512sums=('0244e40ae5060ad3df96ab60d239e92fe0c21d26d560ed380bed06722fd229e40d3d26e3256ff469daaf682019e05b171b11b47a1bc328e35a3d18c87d45a3fc')

prepare(){
	cp -a $_pyname-$pkgver{,-py2}
	sed -i '1s/ python$/ python2/g' $(find $_pyname-$pkgver-py2 -name '*.py')
}

build(){
	pushd $_pyname-$pkgver
	python setup.py build
	popd
	pushd $_pyname-$pkgver-py2
	python2 setup.py build
	popd
}

## Test for python2 was broken
check(){
	pushd $_pyname-$pkgver
	python -m pytest
	popd
}

_package_python(){
	depends=(
		python
		python-six
	)
	cd $_pyname-$pkgver
	python setup.py install --root "$pkgdir" --optimize=1
	install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

_package_python2(){
	depends=(
		python2
		python2-six
	)
	cd $_pyname-$pkgver-py2
	python2 setup.py install --root "$pkgdir" --optimize=1
	install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

eval "package_python-${_pyname}(){ _package_python; }"
eval "package_python2-${_pyname}(){ _package_python2; }"
