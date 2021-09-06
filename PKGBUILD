# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=oslo.rootwrap
_pycname=${_pyname/./-}
pkgname=python-${_pycname}
pkgver=6.3.0
pkgrel=1
pkgdesc="Oslo Rootwrap"
arch=(any)
url="https://docs.openstack.org/oslo.rootwrap/latest/"
license=(Apache)
depends=(
	python
	python-pbr
)
makedepends=(
	python-setuptools
	python-openstackdocstheme
	python-sphinx
	python-reno
	python-mock
	python-fixtures
)
checkdepends=(
	python-hacking
	python-fixtures
	python-testtools
	python-stestr
	python-oslotest
	python-eventlet
	python-reno
	python-pre-commit
	bandit
)
options=('!emptydirs')
source=(
	https://pypi.io/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.tar.gz
	0000-lost-binary2string.patch
)
md5sums=('29a6057c0ff278b08978b3d00ce51246'
         '3ed48e97d11bf4589718870c36a2cb37')
sha256sums=('f24a8d0ad64db4570201ad91e40b2b2528f507668f9d888739357fc5eda20a12'
            '8fe35f8236a75384c67be0121ed5dcacfdaf10f57944b9c46f6f18ae7b67527a')
sha512sums=('0f22e3b3b23dbad18109b3f11c18c2e278d582afc62bd03909e46445231e905a70b26a38773ab9c5543a0bcd0987f0681dfaf5a633cbf24f0144c6ff1f081626'
            '2efee44b40ba03d409c55d01f185e8fecd39f1230449ed437007bc8cc942775158d82976285bd5baa54b44d404f83ffa977250693d0109baa30a242809bbfe94')

prepare(){
	for i in "${source[@]}"
	do case "${i}" in
		?*.patch)
			msg2 "Apply patch ${i}"
			patch -Np1 <"${i}"
		;;
	esac
	done
}

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
	install -Dm644 etc/*.sample -t "$pkgdir"/usr/share/$pkgname/conf
	install -Dm644 etc/*.sample -t "$pkgdir"/etc/oslo
	for i in "$pkgdir"/etc/oslo/*.sample
	do mv -v $i ${i//.sample}
	done
	mkdir -p "$pkgdir/usr/share/doc"
	cp -r doc/build/text "$pkgdir/usr/share/doc/$pkgname"
	rm -r "$pkgdir/usr/share/doc/$pkgname/.doctrees"
}
