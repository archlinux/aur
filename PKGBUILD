# Maintainer: Jonas Witschel <diabonas@archlinux.org>
# Contributor: hexchain <i at hexchain.org>
pkgname=tpm2-abrmd-git
pkgver=2.3.0.r3.ba15348
pkgrel=1
pkgdesc='Trusted Platform Module 2.0 Access Broker and Resource Management Daemon'
arch=('x86_64')
url='https://github.com/tpm2-software/tpm2-abrmd'
license=('BSD')
depends=('dbus' 'glib2' 'tpm2-tss')
makedepends=('git' 'autoconf-archive' 'python')
checkdepends=('cmocka' 'ibm-sw-tpm2' 'iproute2')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url.git")
sha512sums=('SKIP')

pkgver() {
	cd "${pkgname%-git}"
	git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g;s/_//'
}

prepare () {
	cd "${pkgname%-git}"
	./bootstrap
}

build() {
	cd "${pkgname%-git}"
	(( CHECKFUNC )) && _opts=('--enable-unit' '--enable-integration')
	./configure --prefix=/usr \
	            --sbindir=/usr/bin \
	            --with-dbuspolicydir=/usr/share/dbus-1/system.d \
	            "${_opts[@]}"
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
