# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=zstd
pkgbase=python-$_pyname
pkgname=(python{,2}-$_pyname)
pkgver=1.5.0.1
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
md5sums=('414640bed04a2f8827f1672153b43522')
sha256sums=('718d2875c0f4076ed659ea634e4a7a73e70928a9574f1368e53bd96349077a36')
sha512sums=('6e7afa59cc2e8962d96533a58aef47c6a7b21b669779aae0aef268cedc7378199f596c4576c43276806f425a569c7bed781f981fabb7d2db1f2f7d69d79f85b9')

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
	python setup.py test
	popd
	pushd $_pyname-$pkgver-py2
	python2 setup.py test
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
