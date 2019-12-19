pkgname=cnijfilter2
pkgver=5.90
pkgrel=1
pkgdesc="Canon IJ Printer Driver for Linux"
arch=('i686' 'x86_64')
url="https://www.canon.com.au/home-printers"
license=('GPL' 'custom:canon')
depends=('cups' 'libxml2' 'ghostscript')
makedepends=('automake' 'autoconf')
provides=('tocanonij' 'tocnpwg' 'cnijlgmon3')
source=("http://gdlp01.c-wss.com/gds/4/0100010484/01/$pkgname-source-$pkgver-1.tar.gz")
md5sums=('11029121b7003a3ebd5d53a1331673a7')

[[ "$CARCH" == "x86_64" ]] && _arch="64" || _arch="32"

build() {
	cd "$pkgname-source-$pkgver-1"

	pushd cmdtocanonij2
	./autogen.sh --prefix=/usr \
		     --datadir=/usr/share \
		     LDFLAGS="-L../../com/libs_bin$_arch"
	make
	popd

	pushd cmdtocanonij3
	./autogen.sh --prefix=/usr \
		--datadir=/usr/share \
		LDFLAGS="-L../../com/libs_bin$_arch"
	make
	popd

	pushd cnijbe2
	./autogen.sh --prefix=/usr \
		     --enable-progpath=/usr/bin
	make
	popd

	pushd lgmon3
	./autogen.sh --prefix=/usr \
		     --enable-libpath=/usr/lib/bjlib2 \
		     --enable-progpath=/usr/bin \
		     --datadir=/usr/share \
		     LDFLAGS="-L../../com/libs_bin$_arch"
	make
	popd

	pushd rastertocanonij
	./autogen.sh --prefix=/usr \
		     --enable-progpath=/usr/bin
	make
	popd

	pushd tocanonij
	./autogen.sh --prefix=/usr
	make
	popd

	pushd tocnpwg
	./autogen.sh --prefix=/usr
	make
	popd
}

check() {
	cd "$pkgname-source-$pkgver-1"

	pushd cmdtocanonij2
	make check
	popd

	pushd cmdtocanonij3 
	make check
	popd

	pushd cnijbe2
	make check
	popd

	pushd lgmon3
	make check
	popd

	pushd rastertocanonij
	make check
	popd

	pushd tocanonij
	make check
	popd

	pushd tocnpwg
	make check
	popd
}

package() {
	mkdir -p "$pkgdir/usr/lib/bjlib2"
	mkdir -p "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/usr/lib/cups/filter"
	mkdir -p "$pkgdir/usr/lib/cups/backend"
	mkdir -p "$pkgdir/usr/share/cups/model"

	cd "$pkgname-source-$pkgver-1"

	install -m644 com/ini/cnnet.ini "$pkgdir/usr/lib/bjlib2"
	install -sm755 com/libs_bin$_arch/*.so.* "$pkgdir/usr/lib"
	install -Dm644 doc/LICENSE-cnijfilter-${pkgver}EN.txt \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	pushd ppd
	install -m644 *.ppd "$pkgdir/usr/share/cups/model"
	popd

	pushd cmdtocanonij2
	make DESTDIR="$pkgdir/" install
	popd

	pushd cmdtocanonij3 
	make DESTDIR="$pkgdir/" install
	popd

	pushd cnijbe2
	make DESTDIR="$pkgdir/" install
	popd

	pushd lgmon3
	make DESTDIR="$pkgdir/" install
	popd

	pushd rastertocanonij
	make DESTDIR="$pkgdir/" install
	popd

	pushd tocanonij
	make DESTDIR="$pkgdir/" install
	popd

	pushd tocnpwg
	make DESTDIR="$pkgdir/" install
	popd
}
