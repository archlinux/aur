# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=websockify
pkgbase=python-$_pyname
pkgname=(python{,2}-$_pyname)
pkgver=0.9.0
pkgrel=1
pkgdesc="WebSockets support for any application/server"
arch=(any)
url="https://github.com/novnc/websockify"
license=(LGPL3)
makedepends=(
	python
	python-numpy
	python-setuptools
	python2
	python2-numpy
	python2-setuptools
)
source=(https://pypi.io/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.tar.gz)
md5sums=('ff745fd67457fd077915753c9b808b2a')
sha256sums=('c35b5b79ebc517d3b784dacfb993be413a93cda5222c6f382443ce29c1a6cada')
sha512sums=('527db321ac271e357042afd50cd070049ecf0cc6528b5d1d4d2bd531dd7bd52ed11d0b25482779edeb76dd39d975d132d536a861b5db19ee8053c569c76024d8')

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
	depends=(
		python
		python-numpy
	)
	conflicts=(websockify)
	provides=(websockify)
	replaces=(websockify)
	cd "$_pyname-$pkgver"
	python setup.py install --root "$pkgdir" --optimize=1
}

_package_python2(){
	depends=(
		python2
		python2-numpy
	)
	conflicts=(websockify2)
	provides=(websockify2)
	replaces=(websockify2)
	cd "$_pyname-$pkgver-py2"
	python2 setup.py install --root "$pkgdir" --optimize=1
	for i in "$pkgdir"/usr/bin/*
	do mv -v ${i}{,-2}
	done
}

eval "package_python-${_pyname}(){ _package_python; }"
eval "package_python2-${_pyname}(){ _package_python2; }"
