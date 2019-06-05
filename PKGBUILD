# Maintainer: Iru Cai <mytbk920423@gmail.com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: Paul Préfontaine <paul+archlinuxaur@prefontaine.name>
# Contributor: HLFH
# Contributor: Wilhelm Schuster <wilhelm [aT] wilhelm [.] re>
# Contributor: The_Decryptor

pkgname=h2o-git
pkgver=2.2.0.2300
pkgrel=1
pkgdesc="Optimized HTTP server with support for HTTP/1.x and HTTP/2"
arch=('i686' 'x86_64')
# if you want websocket support, you'll also need aur/wslay
depends=('libuv' 'libyaml' 'zlib')
makedepends=('cmake' 'ruby')
url="https://github.com/h2o/h2o"
license=('MIT')

# brotli
bver=1.0.7
source=('git+https://github.com/h2o/h2o.git'
        "brotli-$bver.tar.gz::https://github.com/google/brotli/archive/v$bver.tar.gz"
		'brotli-107.patch'
        'h2o.service')
sha256sums=('SKIP'
'4c61bfb0faca87219ea587326c467b95acb25555b53d1a421ffa3c8a9296ee2c'
'853ca2d73332bcb18c04ad7b79e1bb8f618f89665e04c47c55c8227c89e77075'
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
	rm -rf deps/brotli
	mv "$srcdir/brotli-$bver" deps/brotli
	patch -p1 -i "$srcdir/brotli-107.patch"

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
