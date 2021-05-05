# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=oslo.rootwrap
_pycname=${_pyname/./-}
pkgname=python-${_pycname}
pkgver=6.2.0
pkgrel=2
pkgdesc="Oslo Rootwrap"
arch=(any)
url="https://docs.openstack.org/oslo.rootwrap/latest/"
license=(Apache)
depends=(
	python
	python-pbr
	python-six
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
	bandit
)
options=('!emptydirs')
source=(
	https://pypi.io/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.tar.gz
	0000-lost-binary2string.patch
)
md5sums=('3dad1a7a001be9f6283bcc25ce511c39'
         '781fdf0abc0d4549396493bff5a6dc22')
sha256sums=('83e01cf523b04a2f7c1a4c9000c55bbc1b75a26391cce25b3a7c94b50cafa848'
            'e61c6e768aad32df895744652a1238c32d13659b3ba2c8735b830e6e8e95b497')
sha512sums=('bf3e91ec8a18f92f6f5974a6d8369ae73dba6e61fa3001996678b85d0bfb2426536d27097ad784169e6eca50ad23471505d5089e8d4a6a84c9e0e009a6a38f5a'
            '3c3dd8a25956eddd8a1c8707c07c2a82fadcf4419e58d7cea72ce36f1147747f2b51fd8c02b94814d9f63189b273ed2a43f42d491dc8b0653aec56f8ebe1d846')

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
