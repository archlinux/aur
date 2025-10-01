# Maintainer: unit73e <unit73e@gmail.com>
pkgname=cnijfilter2
pkgver=6.81
pkgrel=1
pkgdesc="Canon IJ Printer Driver for Linux"
arch=('i686' 'x86_64')
url="https://www.canon.com.au/home-printers"
license=('GPL' 'custom:canon')
depends=('cups' 'libxml2' 'ghostscript')
makedepends=('automake' 'autoconf')
provides=('tocanonij' 'tocnpwg' 'cnijlgmon3')
conflicts=('cnijfilter' 'cnijfilter-mg3600')
source=("https://gdlp01.c-wss.com/gds/4/0100012534/01/$pkgname-source-$pkgver-1.tar.gz"
        'add-missing-import.patch'
        'fix-libxml2-config.patch'
        'gcc15-fix.patch')
sha256sums=('a75716fc9b2823ed61bda09bd720e188f0cb309c012e975a89815738ae71bb1b'
            'a1f2ebcfa0c5c6e0d680480bd349ff4b8e4315d031315819ff92a1c11e3d2281'
            '25ab9319e30b221a2095733d0d8b576931cf5e320a47ea57dec1b1b5be1548f2'
            '268dfd75e58f6849655c0de54580e494c630e517fb9dd3a9a023ea3253640c9b')


prepare() {
	cd "$pkgname-source-$pkgver-1"
	sed -e '/GET_PROTOCOL/ s:^int:extern &:g' -i 'lgmon3/src/cnijlgmon3.c'
  patch -Np1 -i ../add-missing-import.patch
  patch -Np1 -i ../fix-libxml2-config.patch
  patch -Np1 -i ../gcc15-fix.patch
}

build() {
	cd "$pkgname-source-$pkgver-1"

	pushd cmdtocanonij2
	./autogen.sh --prefix=/usr \
		     --datadir=/usr/share \
		     LDFLAGS="-L../../com/libs_bin_$CARCH"
	make
	popd

	pushd cmdtocanonij3
	./autogen.sh --prefix=/usr \
		--datadir=/usr/share \
		LDFLAGS="-L../../com/libs_bin_$CARCH"
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
		     LDFLAGS="-L../../com/libs_bin_$CARCH"
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
	install -sm755 com/libs_bin_$CARCH/*.so.* "$pkgdir/usr/lib"
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
