# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=oslo.rootwrap
_pycname=${_pyname/./-}
pkgname=python-${_pycname}
pkgver=6.3.1
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
md5sums=('adc3b29e0e5915b4fe3114fda9bf15a6'
         '7104540ddcfcdf75ab7ac175ddb17b64')
sha256sums=('799474f406ea1d4e0d976b4ba201a9ccbcc82ff8a864e8bdd2b9606a18f756b4'
            'aab94fc49457a7c3be76812df6506f21b7332253f264528f657088b3a9f5d9ce')
sha512sums=('49aad2de86fc135c0cb84a4bc2de31a361140ea40b27490c5685ea2d4c1863b2e7d5ae4ea77ce74720827c9f791daed0730eddd3a51b715b7af1cf294920ffcb'
            '00545beecbbf1c6ab19bfb865c852207bab85ef443cfa4f4f327f42a7bcd021c22a920ee14e401a3c005e33e55420cc504cd5d33712fa1043d5bd1e642df37be')

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
