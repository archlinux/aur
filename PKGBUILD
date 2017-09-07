# Maintainer: xhebox <xw897002528 at gmail dot com>
pkgname=deeponion
pkgver=r11.78a5bf3
pkgrel=1
pkgdesc="DeepOnion (ONION) is a new PoW/PoS altcoin that is most secure. All the communications in DeepOnion network is done through the TOR network."
arch=('i686' 'x86_64')
url="https://github.com/deeponion/deeponion"
license=('MIT')
depends=('miniupnpc' 'boost' 'openssl-1.0' 'libevent' 'db')
source=("deeponion::git+https://github.com/deeponion/deeponion"
"upnp_2.patch")
md5sums=('SKIP'
         '3c6aec679a55744df1fac1a8cb502505')

pkgver() {
    cd "$srcdir/deeponion"
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/$pkgname"
	patch -p1 -i "$srcdir/upnp_2.patch"
}

build() {
	cd "$srcdir/$pkgname"
	cd src/leveldb
	chmod +x ./build_detect_platform
	make libleveldb.a libmemenv.a
	cd -
	cd src/
	make -f makefile.unix \
	CFLAGS="-I/usr/include/openssl-1.0" \
	CXXFLAGS="-I/usr/include/openssl-1.0" \
	LDFLAGS="-L/usr/lib/openssl-1.0"
}

package() {
	cd "$srcdir/$pkgname/src"
	install -D -m755 DeepOniond "$pkgdir/usr/bin/DeepOniond"
	cd ..
	install -D -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
