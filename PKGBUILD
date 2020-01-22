# Maintainer: Jonas Witschel <diabonas@archlinux.org>
# Contributor: Iwan Timmer <irtimmer@gmail.com>
pkgname=tpm2-pkcs11-git
pkgver=1.0.1.r24.e482faa
pkgrel=1
pkgdesc='PKCS#11 interface for Trusted Platform Module 2.0 hardware'
arch=('x86_64')
url='https://github.com/tpm2-software/tpm2-pkcs11'
license=('BSD' 'custom:IPR')
depends=('openssl' 'python-cryptography' 'python-pyasn1-modules' 'python-yaml' 'sqlite' 'tpm2-tools')
makedepends=('git' 'autoconf-archive')
checkdepends=('cmocka' 'ibm-sw-tpm2' 'iproute2' 'java-hamcrest' 'jdk8-openjdk' 'junit' 'libp11' 'opensc' 'tpm2-abrmd' 'xxd')
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
	# The integration tests can currently only be compiled with java-environment<9
	# (https://github.com/tpm2-software/tpm2-pkcs11/issues/391)
	export PATH="/usr/lib/jvm/java-8-openjdk/bin:$PATH"
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
