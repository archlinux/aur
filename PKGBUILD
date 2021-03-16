# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=restructuredtext-lint
_pycname=${_pyname/-/_}
pkgbase=python-$_pyname
pkgname=(python{,2}-$_pyname)
pkgver=1.3.2
pkgrel=1
pkgdesc="A comprehensive, fast, pure Python memcached client"
arch=('any')
url="https://github.com/twolfson/restructuredtext-lint"
license=(UNLICENSE)
makedepends=(
	python
	python-docutils
	python-setuptools
	python2
	python2-docutils
	python2-setuptools
)
source=("https://pypi.io/packages/source/${_pyname::1}/$_pyname/$_pycname-$pkgver.tar.gz")
md5sums=('f329e3fb722f4d58b72af9e96f088df4')
sha256sums=('d3b10a1fe2ecac537e51ae6d151b223b78de9fafdd50e5eb6b08c243df173c80')
sha512sums=('723c97879d54ce475a71441a9ca190a07f12a13da51c818ded29f3e4da255e734b54a49ae6c395cc1938e91ba9e88964d6aae896517e0d239301704f1b18cf67')

prepare(){
	cp -a $_pycname-$pkgver{,-py2}
	sed -i '1s/ python$/ python2/g' $(find $_pycname-$pkgver-py2 -name '*.py')
}

build(){
	pushd $_pycname-$pkgver
	python setup.py build
	popd
	pushd $_pycname-$pkgver-py2
	python2 setup.py build
	popd
}

_package_python(){
	depends=(
		python
		python-docutils
	)
	cd $_pycname-$pkgver
	python setup.py install --root "$pkgdir" --optimize=1
	install -Dm644 UNLICENSE "$pkgdir"/usr/share/licenses/$pkgname/UNLICENSE
}

_package_python2(){
	depends=(
		python2
		python2-docutils
	)
	cd $_pycname-$pkgver-py2
	python2 setup.py install --root "$pkgdir" --optimize=1
	install -Dm644 UNLICENSE "$pkgdir"/usr/share/licenses/$pkgname/UNLICENSE
	for i in "$pkgdir"/usr/bin/*
	do mv -v ${i}{,2}
	done
}

eval "package_python-${_pyname}(){ _package_python; }"
eval "package_python2-${_pyname}(){ _package_python2; }"
