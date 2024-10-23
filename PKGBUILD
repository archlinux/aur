# Maintainer: europrimus <dev@c-f.me>
# Contributor: lesebas <sebdeligny@gmail.com>
pkgname=cnijfilter-ts7640series
pkgver=6.70
pkgverminor=a
pkgrel=1
pkgdesc="Canon IJ Printer Driver for Linux for GX1040 or Pixma TS7640i series and other (GX1040,GX1050,GX2040,GX2050,GX5540,GX5550,PIXMA TS7640i,PIXMA TS7650i,PIXMA TS7740i,PIXMA TS7750i,PIXMA TS8750,PIXMA TS8751) based on 6.70a version"
arch=('i686' 'x86_64')
url="https://www.canon.com.au/home-printers"
license=('GPL' 'custom:canon')
depends=('cups' 'libxml2' 'ghostscript')
makedepends=('automake' 'autoconf')
provides=('tocanonij' 'tocnpwg' 'cnijlgmon3')
conflicts=('cnijfilter' 'cnijfilter-mg3600' 'cnijfilter2' 'cnijfilter-ts7450series')
source=("https://gdlp01.c-wss.com/gds/7/0100012137/01/cnijfilter2-source-$pkgver-1.tar.gz" 'keytext.c.patch')
md5sums=('eace124513c5b692210cea43d529834e' 'dafa6c1d2df6c1bba71dce55be4e4703')

[[ "$CARCH" == "x86_64" ]] && _arch="x86_64" || _arch="i686"

prepare() {
	patch -Np1 -i ../keytext.c.patch
	cd "cnijfilter2-source-$pkgver-1"
	sed -e '/GET_PROTOCOL/ s:^int:extern &:g' -i 'lgmon3/src/cnijlgmon3.c'
}

build() {
	cd "cnijfilter2-source-$pkgver-1"

	pushd cmdtocanonij2
	./autogen.sh --prefix=/usr \
		     --datadir=/usr/share \
		     LDFLAGS="-L../../com/libs_bin_$_arch"
	make
	popd

	pushd cmdtocanonij3
	./autogen.sh --prefix=/usr \
		--datadir=/usr/share \
		LDFLAGS="-L../../com/libs_bin_$_arch"
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
		     LDFLAGS="-L../../com/libs_bin_$_arch"
	make #CFLAGS="${CFLAGS} -fcommon"
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
	cd "cnijfilter2-source-$pkgver-1"

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

	cd "cnijfilter2-source-$pkgver-1"

	install -m644 com/ini/cnnet.ini "$pkgdir/usr/lib/bjlib2"
	install -sm755 com/libs_bin_$_arch/*.so.* "$pkgdir/usr/lib"
	install -Dm644 doc/LICENSE-cnijfilter-${pkgver}${pkgverminor}EN.txt \
		"$pkgdir/usr/share/licenses/cnijfilter2/LICENSE"

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

