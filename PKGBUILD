# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=oslo.rootwrap
_pycname=${_pyname/./-}
pkgname=python-${_pycname}
pkgver=6.2.0
pkgrel=1
pkgdesc="Oslo Rootwrap"
arch=('any')
url="https://docs.openstack.org/oslo.rootwrap/latest/"
license=('Apache')
depends=(
	python
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
         '13d2c35be1e37af81d708cfe8c96297d')
sha256sums=('83e01cf523b04a2f7c1a4c9000c55bbc1b75a26391cce25b3a7c94b50cafa848'
            '0fb81f04ddd9f1897c11e363d1b2be61fd0940493bed50861194a3a6ee7b5e26')
sha512sums=('bf3e91ec8a18f92f6f5974a6d8369ae73dba6e61fa3001996678b85d0bfb2426536d27097ad784169e6eca50ad23471505d5089e8d4a6a84c9e0e009a6a38f5a'
            'feaa869fb50943464b006d14633e40f43ea75243836f5c4a8ee6a916878275498ddb421d7df73c51336cc71725e7eb4498b5f7214f61394fe0ba09f58aebd11b')

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
	python setup.py build
	sphinx-build -b html doc/source doc/build/html
}

check(){
	cd $_pyname-$pkgver
	PYTHONPATH=${PWD} stestr run
}

package(){
	cd $_pyname-$pkgver
	python setup.py install --root="$pkgdir/" --optimize=1
	install -Dm644 etc/*.sample -t "$pkgdir"/usr/share/${pkgname}/conf
	install -Dm644 etc/*.sample -t "$pkgdir"/etc/oslo
	for i in "$pkgdir"/etc/oslo/*.sample
	do mv -v $i ${i//.sample}
	done
	mkdir -p "${pkgdir}/usr/share/doc"
	cp -r doc/build/html "${pkgdir}/usr/share/doc/${pkgname}"
}
