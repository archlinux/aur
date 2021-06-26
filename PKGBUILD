# Maintainer: Iru Cai <mytbk920423@gmail.com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: Paul Préfontaine <paul+archlinuxaur@prefontaine.name>
# Contributor: HLFH
# Contributor: Wilhelm Schuster <wilhelm [aT] wilhelm [.] re>
# Contributor: The_Decryptor

# FIXME: mruby disabled until we figure out how to build with it

pkgname=h2o-git
pkgver=2.2.0.5238
pkgrel=1
pkgdesc="Optimized HTTP server with support for HTTP/1.x and HTTP/2"
arch=('i686' 'x86_64' 'aarch64')
# if you want websocket support, you'll also need aur/wslay
depends=('libuv' 'libyaml' 'zlib')
makedepends=('cmake')
url="https://github.com/h2o/h2o"
license=('MIT')

# use upstream brotli, libyrmcds, hiredis
bver=1.0.9
yrver=1.3.1
rver=0.14.0
source=('git+https://github.com/h2o/h2o.git'
	"brotli-$bver.tar.gz::https://github.com/google/brotli/archive/v$bver.tar.gz"
	"libyrmcds-$yrver.tar.gz::https://github.com/cybozu/libyrmcds/archive/v$yrver.tar.gz"
	"hiredis-$rver.tar.gz::https://github.com/redis/hiredis/archive/v$rver.tar.gz"
	'deps.patch'
	'h2o-hiredis.patch'
	'h2o.service')
sha256sums=('SKIP'
'f9e8d81d0405ba66d181529af42a3354f838c939095ff99930da6aa9cdf6fe46'
'c00c878e8bedb3d9d5440fc9f58d349e1004612f4c349326cb06bbb1fa6bec27'
'042f965e182b80693015839a9d0278ae73fae5d5d09d8bf6d0e6a39a8c4393bd'
'726e0f46772c80a7e65deedfc070616352d6af9c3ae3a730d7aa688b50fc4441'
'ca9da403a8cdbd2594ba1b7261af119e56772d71ebbf0045bf7aa2d07d88118b'
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

	patch -p1 -i "$srcdir/deps.patch"

	# set CMake minimal version to 3.9 to set CMP0039 to new
	sed -i 's/VERSION 2.8.11/VERSION 3.9/g' CMakeLists.txt

	rm -rf deps/brotli
	mv "$srcdir/brotli-$bver" deps/brotli

	rm -rf deps/yaml

	rm -rf deps/libyrmcds
	mv "$srcdir/libyrmcds-$yrver" deps/libyrmcds

	rm -rf deps/hiredis
	mv "$srcdir/hiredis-$rver" deps/hiredis

	patch -p1 -i "$srcdir/h2o-hiredis.patch"

	sed -i 's|example|/usr/share/doc/h2o/example|' examples/h2o/h2o.conf

	# Note that picotls can be turned off,
	# OpenSSL already supports TLS 1.3
	cmake \
		-DCMAKE_INTERPROCEDURAL_OPTIMIZATION=ON \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_LIBDIR=/usr/lib \
		-DCMAKE_INSTALL_SYSCONFDIR=/etc \
		-DWITH_MRUBY=off \
		-DWITHOUT_LIBS=off \
		-DBUILD_SHARED_LIBS=off \
		.

	make
}

package() {
	cd "$srcdir/h2o"

	install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/h2o/LICENSE"
	install -Dm 644 "$srcdir/h2o.service" "$pkgdir/usr/lib/systemd/system/h2o.service"
	install -Dm 644 examples/h2o/h2o.conf "$pkgdir/etc/h2o.conf"
	make DESTDIR="$pkgdir" install
}
