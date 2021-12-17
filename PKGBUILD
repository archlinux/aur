# Maintainer: Jonas Witschel <diabonas@archlinux.org>
# Contributor: hexchain <i at hexchain.org>
pkgname=tpm2-abrmd-git
pkgver=2.4.0.r20.41fd797
pkgrel=1
pkgdesc='Trusted Platform Module 2.0 Access Broker and Resource Management Daemon'
arch=('x86_64')
url='https://github.com/tpm2-software/tpm2-abrmd'
license=('BSD')
depends=('glib2' 'tpm2-tss' 'libtss2-mu.so' 'libtss2-rc.so' 'libtss2-sys.so' 'libtss2-tctildr.so')
makedepends=('git' 'autoconf-archive' 'python')
checkdepends=('cmocka' 'iproute2' 'swtpm')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=('!lto')
source=("git+$url.git")
sha512sums=('SKIP')

pkgver() {
	cd "${pkgname%-git}"
	git describe --long | sed 's/[-_]rc/rc/I;s/\([^-]*-\)g/r\1/;s/-/./g;s/_//'
}

prepare () {
	cd "${pkgname%-git}"
	./bootstrap
}

build() {
	cd "${pkgname%-git}"
	./configure --prefix=/usr \
	            --sbindir=/usr/bin \
	            --with-dbuspolicydir=/usr/share/dbus-1/system.d \
	            $( ((CHECKFUNC)) && echo --enable-unit --enable-integration)
	make
}

check() {
	cd "${pkgname%-git}"
	make check
}

package() {
	cd "${pkgname%-git}"
	make DESTDIR="$pkgdir" install
	rm -r "$pkgdir/usr/lib/systemd/system-preset"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
