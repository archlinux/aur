# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=oslo.upgradecheck
_pycname=${_pyname/./-}
pkgname=python-${_pycname}
pkgver=2.0.0
pkgrel=1
pkgdesc="Common code for writing OpenStack upgrade checks"
arch=(any)
url="https://docs.openstack.org/oslo.upgradecheck/latest/"
license=(Apache)
depends=(
	python
	python-pbr
	python-oslo-config
	python-oslo-i18n
	python-prettytable
	python-oslo-utils
	python-oslo-policy
)
makedepends=(
	python-setuptools
	python-sphinx
	python-openstackdocstheme
	python-reno
)
checkdepends=(
	python-hacking
	python-oslotest
	python-stestr
	python-pre-commit
	python-oslo-serialization
)
options=('!emptydirs')
source=(https://pypi.io/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.tar.gz)
md5sums=('242581a865ab80de85878a073cdbb379')
sha256sums=('f842efeb7cf5fbbf39b569873216bd1f997dfe8af18d3fc3339ea08a38f83268')
sha512sums=('c414590d4a7d8f41b6cc3c3d1241366f61565f61853230044400307b3592f045492ba32acddd442051232416f33556207aafdccb8587fc3af35d364a28a4efe7')

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
