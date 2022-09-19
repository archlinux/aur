# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=oslo.limit
_pycname=${_pyname/./-}
pkgname=python-${_pycname}
pkgver=2.0.1
pkgrel=1
pkgdesc="Limit enforcement library to assist with quota calculation."
arch=(any)
url="https://docs.openstack.org/oslo.limit/latest/"
license=(Apache)
depends=(
	python
	python-pbr
	python-keystoneauth1
	python-oslo-config
	python-oslo-i18n
	python-oslo-log
	python-openstacksdk
)
makedepends=(
	python-setuptools
	python-openstackdocstheme
	python-reno
	python-sphinx
	python-sphinxcontrib-apidoc
	python-fixtures
)
checkdepends=(
	python-stestr
	python-hacking
	python-oslotest
	python-stestr
	bandit
	python-pre-commit
	python-fixtures
)
options=('!emptydirs')
source=(https://pypi.io/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.tar.gz)
md5sums=('ad4bb636e6ccb0a504de3a7af7f2eef9')
sha256sums=('2171408f4d9ee1d754eda051711faed7e0b3f281f9386428517b036e8d9323c9')
sha512sums=('1f3e8ffc327ccbfa6a15cc093441f5f89d40933763b03c1ed468deb5aadc224e8da4f2963805d20e26c454ee0645492919f63c86ef6c75d35c3e1e04d901db16')

export PBR_VERSION=$pkgver

build(){
	cd $_pyname-$pkgver
	export PYTHONPATH="$PWD"
	python setup.py build
	sphinx-build -b text doc/source doc/build/text
}

check(){
	cd $_pyname-$pkgver
	stestr run
}

package(){
	cd $_pyname-$pkgver
	python setup.py install --root="$pkgdir/" --optimize=1
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
	mkdir -p "$pkgdir/usr/share/doc"
	cp -r doc/build/text "$pkgdir/usr/share/doc/$pkgname"
	rm -r "$pkgdir/usr/share/doc/$pkgname/.doctrees"
}
