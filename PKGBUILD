# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=qpid-proton
_pycname=python-$_pyname
pkgbase=$_pycname
pkgname=(python{,2}-$_pyname)
pkgver=0.34.0
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
source=("https://pypi.io/packages/source/${_pycname::1}/${_pycname}/$_pycname-$pkgver.zip")
md5sums=('56fb4cfc927b0c1478f8d1f7856990f7')
sha256sums=('64a983cc51c78dd6c7c206eb610f52da8edc5e1c5cb6c4e9cdc16ee62a9e1b5e')
sha512sums=('f45427849b0f8e20d2fdb0803c384641766baa6655f0728c6f1960d417f9340decef587c1b55084e48964aa96b5d8a6442510f87aaa2720654dff67773d26051')

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
