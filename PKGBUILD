# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=qpid-proton
_pycname=python-$_pyname
pkgbase=$_pycname
pkgname=(python{,2}-$_pyname)
pkgver=0.33.0
pkgrel=1
pkgdesc="An AMQP based messaging library."
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="http://qpid.apache.org/proton/"
license=(Apache)
makedepends=(
	swig
	libsasl
	openssl
	python-setuptools
	python2-setuptools
)
source=("https://pypi.io/packages/7b/9f/01debe555e64d18e8689a40bdaee9979e2aaaa9ea9fbf2e1bc8fb0c8a4b7/$_pycname-$pkgver.zip")
md5sums=('b195485df49027346e7e60cd011c42a8')
sha256sums=('9535acf706eda58e615705371a2745f1939278be2924d6d61e55a33a44d94fa2')
sha512sums=('6a37579abe800b2ce55a2dcc15f9ece03a39eae750452e4277f1311ea0b4d295bd71e262641008350865bfe04eb163da20c0d8686544cccdbe1890d36d911e27')

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
		libsasl
		openssl
		python
	)
	cd $_pycname-$pkgver
	python setup.py install --root "$pkgdir" --optimize=1
	install -Dm644 docs/* -t "$pkgdir"/usr/share/docs/$pkgname
}

_package_python2(){
	depends=(
		libsasl
		openssl
		python2
	)
	cd $_pycname-$pkgver-py2
	python2 setup.py install --root "$pkgdir" --optimize=1
	install -Dm644 docs/* -t "$pkgdir"/usr/share/docs/$pkgname
}

eval "package_python-${_pyname}(){ _package_python; }"
eval "package_python2-${_pyname}(){ _package_python2; }"
