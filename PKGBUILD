# Maintainer: piernov <piernov@piernov.org>

pkgname=ssf-git
_pkgname=ssf
pkgver=r386.2caaaab
pkgrel=1
pkgdesc="Network toolkit providing ways to forward data from sockets through a TLS link"
arch=('x86_64')
url="https://securesocketfunneling.github.io/ssf/"
license=('MIT')
depends=('openssl-1.0' 'boost-65-compat-libs' 'krb5')
makedepends=('boost-65-compat')
source=("git+https://github.com/securesocketfunneling/ssf.git")
sha512sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$_pkgname"
	git submodule update --init
}

build() {
	cd "$_pkgname"

	export PKG_CONFIG_PATH=/usr/lib/openssl-1.0/pkgconfig
	export _OPENSSL_INCLUDEDIR=/usr/include/openssl-1.0/
	export _OPENSSL_LIBDIR=/usr/lib/openssl-1.0/

	mkdir -p build
	cd build
	cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd "$_pkgname/build"
	make install DESTDIR="$pkgdir"
	install -dm755 "$pkgdir"/usr/share/ssf
	mv "$pkgdir"/usr/bin/certs "$pkgdir"/usr/share/ssf/
}
