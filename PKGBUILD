# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=avro
pkgbase=python-$_pyname
pkgname=(python{,2}-$_pyname)
pkgver=1.10.2
pkgrel=1
pkgdesc="Avro is a serialization and RPC framework."
arch=(any)
url="https://avro.apache.org/"
license=(Apache)
makedepends=(
	python
	python-setuptools
	python2
	python2-setuptools
)
source=(https://pypi.io/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.tar.gz)
md5sums=('b0350c3965ddeabf0fe3273e42461087')
sha256sums=('381b990cc4c4444743c3297348ffd46e0c3a5d7a17e15b2f4a9042f6e955c31a')
sha512sums=('46bb7035a71a0d1b43d067fdc8bde8328322acc764908d100bb0ef4a23913e7fd7660ee61dfb21e8e85cc53720192e329da6f2f31aeafd480322ade0907bc2a7')

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

_package_python(){
	depends=(python)
	cd $_pyname-$pkgver
	python setup.py install --root "$pkgdir" --optimize=1
	install -Dm644 avro/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

_package_python2(){
	depends=(python2)
	cd $_pyname-$pkgver-py2
	python2 setup.py install --root "$pkgdir" --optimize=1
	install -Dm644 avro/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
	for i in "$pkgdir"/usr/bin/*
	do mv -v ${i}{,2}
	done
}

eval "package_python-${_pyname}(){ _package_python; }"
eval "package_python2-${_pyname}(){ _package_python2; }"
