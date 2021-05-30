# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=pymemcache
pkgbase=python-$_pyname
pkgname=(python{,2}-$_pyname)
pkgver=3.4.3
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
source=(https://pypi.io/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.tar.gz)
md5sums=('ba3840b67f7586f492a60453b8c087a9')
sha256sums=('1d628659f8d88c88832448f3917a2b68468ec8f1515108726c26efc968c413af')
sha512sums=('433f5652b2293140df265dd92a33b6c6bcded53ab8a4e12ee6b2bed2937117ba687ee9e9ed8cca04d1c26f88e8bfb35c93a33d87539e4ff53042bf7eb9c6abdd')

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
	#pushd $_pyname-$pkgver-py2
	#python2 -m pytest
	#popd
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
