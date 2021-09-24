# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=zstd
pkgbase=python-$_pyname
pkgname=(python{,2}-$_pyname)
pkgver=1.5.0.2
pkgrel=2
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
md5sums=('ba4d858bf5d2dad7384be7f534419b9a')
sha256sums=('8d3388a15135c481b28ca67d079cb5fd79a9691626fd9979e6b4ec00eabb9e79')
sha512sums=('a7a6033e743c5bc0fa5256dfd256c2a9417c200cda5d5c02c6c7a5d5553d188637e21908658a4a948e565b16bb03f85f57c74d51c63a3ae7eb160f8b3bdbd3c3')

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
