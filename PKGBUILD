# Maintainer: Iru Cai <mytbk920423@gmail.com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: Paul Préfontaine <paul+archlinuxaur@prefontaine.name>
# Contributor: HLFH
# Contributor: Wilhelm Schuster <wilhelm [aT] wilhelm [.] re>
# Contributor: The_Decryptor

pkgname=h2o-git
pkgver=2.2.0.2053
pkgrel=2
pkgdesc="Optimized HTTP server with support for HTTP/1.x and HTTP/2"
arch=('i686' 'x86_64')
# if you want websocket support, you'll also need aur/wslay
depends=('libuv' 'libyaml' 'zlib')
makedepends=('cmake' 'libtool' 'make' 'pkg-config' 'ruby')
url="https://github.com/h2o/h2o"
license=('MIT')
source=('git+https://github.com/h2o/h2o.git'
        'h2o.service')
sha256sums=('SKIP'
            '7fccdeb1a89134b48674764dc243f8967eb1234679e401af93e210fbf0934b62')
backup=('etc/h2o.conf')
provides=('h2o' 'libh2o')
conflicts=('h2o' 'libh2o')

pkgver() {
	cd "$srcdir/h2o"
	git describe --tags | sed -e 's/^v//g' -e 's/-g.*$//g' -e 's/-/./g'
}

build() {
	cd "$srcdir/h2o"

	# Note that picotls can be turned off,
	# OpenSSL already supports TLS 1.3
	cmake \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_LIBDIR=/usr/lib \
		-DWITH_MRUBY=on \
		-DWITH_PICOTLS=on \
		-DWITHOUT_LIBS=off \
		-DBUILD_SHARED_LIBS=off \
		.

	make
	make libh2o
}

package() {
	cd "$srcdir/h2o"

	install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/h2o/LICENSE"
	install -Dm 644 "$srcdir/h2o.service" "$pkgdir/usr/lib/systemd/system/h2o.service"
	install -Dm 644 examples/h2o/h2o.conf "$pkgdir/etc/h2o.conf"
	make DESTDIR="$pkgdir" install
}
