# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=zstd
pkgbase=python-$_pyname
pkgname=(python{,2}-$_pyname)
pkgver=1.5.1.0
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
md5sums=('fe5e894d6925ee1ff13b824eababf13b')
sha256sums=('9519bb0cd91c4498cd8cf66ef88fb22e5d6a442317704e6afd00b12726d17d0a')
sha512sums=('4775f9db3b924116272060fd46885a601ec5153b350974ef5fe41878f10aad0fee428f053ce71aaf881eb73bfc11ae1d89148f65447fc6febe3f53a50ffa0a63')

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
