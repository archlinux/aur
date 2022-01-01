# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=zstd
pkgbase=python-$_pyname
pkgname=(python{,2}-$_pyname)
pkgver=1.5.0.4
pkgrel=1
pkgdesc="ZSTD Bindings for Python"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://github.com/sergey-dryabzhinsky/python-zstd"
license=(BSD)
makedepends=(
	zstd
	python
	python-setuptools
	python2
	python2-setuptools
)
source=(https://pypi.io/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.tar.gz)
md5sums=('2454547d671c8db5816f547d349e9fc6')
sha256sums=('0d048f03fc6354c565ac1e36bb6bf697cfe9941217717fc6a2076529d8b860c3')
sha512sums=('aa74b4a60bcbf138b337b13111489212b28b599fbfbfcc7e058ed03a6d6ba539fed8742babae3d37a1790b26e987d9f111fb6430bfb3f72c3de7794b1f23539b')

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

check(){
	pushd $_pyname-$pkgver
	PYTHONPATH="$(realpath build/lib.linux-*)" python -m pytest
	popd
	pushd $_pyname-$pkgver-py2
	PYTHONPATH="$(realpath build/lib.linux-*)" python2 -m pytest
	popd
}

_package_python(){
	depends=(python)
	cd "$_pyname-$pkgver"
	python setup.py install --root "$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

_package_python2(){
	depends=(python2)
	cd "$_pyname-$pkgver-py2"
	python2 setup.py install --root "$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

eval "package_python-${_pyname}(){ _package_python; }"
eval "package_python2-${_pyname}(){ _package_python2; }"
