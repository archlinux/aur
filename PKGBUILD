# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=avro
pkgbase=python-$_pyname
pkgname=(python{,2}-$_pyname)
pkgver=1.10.0
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
md5sums=('ae5da129dc22247278328bbae6ea2fcf')
sha256sums=('bbf9f89fd20b4cf3156f10ec9fbce83579ece3e0403546c305957f9dac0d2f03')
sha512sums=('d363aefa05defe4d7ddf9afe8cfc33b450baa81833b0c07756a6d5de0e7ba78c71904491f9d0f0f1950ed3df942b4348677833c4c227084a48bd4a72da80b401')

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
