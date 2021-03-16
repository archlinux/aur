# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=whereto
pkgbase=python-$_pyname
pkgname=(python{,2}-$_pyname)
pkgver=0.4.0
pkgrel=1
pkgdesc="Test Apache redirect rules."
arch=(any)
url="https://docs.openstack.org/whereto/latest/"
license=(Apache)
makedepends=(
	python
	python-pbr
	python-pcre
	python-setuptools
	python2
	python2-pbr
	python2-pcre
	python2-setuptools
)
checkdepends=(
	python-hacking
	python-coverage
	python-subunit
	python-sphinx
	python-oslotest
	python-testrepository
	python-testtools
	python-openstackdocstheme
	python-reno
	python-sphinxcontrib-autoprogram
	python-openstackdocstheme
)
source=(https://pypi.io/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.tar.gz)
md5sums=('7bcd145ed84a895df5b53aab92c18768')
sha256sums=('0212ee7341ec9b2d0c3771eb4ff1ef73235ab3f24df02e2fbfab4867c31479c4')
sha512sums=('999f52d185f47ad4a9a2f9c249f0af75f97ae498fb91f4c429dc8ce3509a2c9b0976b935191f3f860c7eadcb74c2363c4d0a8dea72b5e85ec18c1d1dac26e442')

export PBR_VERSION=$pkgver

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

## Test for python2 was broken
check(){
	pushd "$srcdir"/$_pyname-$pkgver
	python -m pytest
	popd
	#pushd "$srcdir"/$_pyname-$pkgver-py2
	#python2 -m pytest
	#popd
}

_package_python(){
	depends=(
		python
		python-pbr
		python-pcre
	)
	cd $_pyname-$pkgver
	python setup.py install --root "$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

_package_python2(){
	depends=(
		python2
		python2-pbr
		python2-pcre
	)
	cd $_pyname-$pkgver-py2
	python2 setup.py install --root "$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
	for i in "$pkgdir"/usr/bin/*
	do mv -v ${i}{,-2}
	done
}

eval "package_python-${_pyname}(){ _package_python; }"
eval "package_python2-${_pyname}(){ _package_python2; }"
