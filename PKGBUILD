# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=restructuredtext-lint
_pycname=${_pyname/-/_}
pkgbase=python-$_pyname
pkgname=(python{,2}-$_pyname)
pkgver=1.4.0
pkgrel=2
pkgdesc="reStructuredText linter"
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
md5sums=('05aae776c7fe02edb03f3b2601ac6b67')
sha256sums=('1b235c0c922341ab6c530390892eb9e92f90b9b75046063e047cacfb0f050c45')
sha512sums=('8e16e2a43cb1e52bb3b4ac60da53130bd4a8d0b823fc95b32e62068bed95728084de3b55820cfcaba70eecaaa93bdf3f956b8bb6c55155115b40c7151ef58a2c')

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
