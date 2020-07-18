# Maintainer: Jonas Witschel <diabonas@archlinux.org>
# Contributor: Iwan Timmer <irtimmer@gmail.com>
pkgname=tpm2-pkcs11-git
pkgver=1.3.0.r320.82d3f2f
pkgrel=1
pkgdesc='PKCS#11 interface for Trusted Platform Module 2.0 hardware'
arch=('x86_64')
url='https://github.com/tpm2-software/tpm2-pkcs11'
license=('BSD')
depends=('openssl' 'python-cryptography' 'python-pyasn1-modules' 'python-yaml' 'sqlite' 'tpm2-tools' 'tpm2-tss-git')
makedepends=('git' 'autoconf-archive')
checkdepends=('cmocka' 'ibm-sw-tpm2' 'expect' 'iproute2' 'java-hamcrest' 'junit'
              'libp11' 'opensc' 'tpm2-abrmd-git' 'tpm2-tss-engine' 'wget' 'xxd')
source=("git+$url.git")
sha512sums=('SKIP')

pkgver() {
	cd "${pkgname%-git}"
	git describe --long | sed 's/[-_]rc/rc/I;s/\([^-]*-\)g/r\1/;s/-/./g'
}

prepare() {
	cd "${pkgname%-git}"
	./bootstrap
}

build() {
	cd "${pkgname%-git}"
	export CLASSPATH="/usr/share/java/junit.jar:/usr/share/java/hamcrest-core.jar:$CLASSPATH"
	./configure --prefix=/usr $( ((CHECKFUNC)) && echo --enable-unit --enable-integration)
	make
	cd tools
	python setup.py build
}

check() {
	cd "${pkgname%-git}"
	make check
}

package() {
	cd "${pkgname%-git}"
	make DESTDIR="$pkgdir" install
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
	cd tools
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
