# Maintainer: Jonas Witschel <diabonas@archlinux.org>
# Contributor: Iwan Timmer <irtimmer@gmail.com>
pkgname=tpm2-pkcs11-git
pkgver=1.8.0.r7.9f851dd
pkgrel=1
pkgdesc='PKCS#11 interface for Trusted Platform Module 2.0 hardware'
arch=('x86_64')
url='https://github.com/tpm2-software/tpm2-pkcs11'
license=('BSD')
depends=('libyaml' 'openssl' 'python' 'python-bcrypt' 'python-cryptography' 'python-pyasn1'
         'python-pyasn1-modules' 'python-tpm2-pytss' 'python-yaml' 'sqlite' 'tpm2-tools' 'tpm2-tss'
         'libtss2-esys.so' 'libtss2-fapi.so' 'libtss2-mu.so' 'libtss2-rc.so' 'libtss2-tctildr.so')
makedepends=('git' 'autoconf-archive' 'cmocka' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('expect' 'iproute2' 'java-hamcrest' 'junit' 'libp11' 'opensc' 'openssh'
              'python-python-pkcs11' 'swtpm' 'tpm2-abrmd' 'tpm2-tss-engine' 'wget' 'xxd')
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
	./configure --prefix=/usr --enable-unit $( ((CHECKFUNC)) && echo --enable-integration)
	make
	cd tools
	python -m build --wheel --no-isolation
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
	python -m installer --destdir="$pkgdir" dist/*.whl
}
