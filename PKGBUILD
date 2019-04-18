# Maintainer: Sharky <sharky@sharky.pw>
pkgname=libdb-4.8
pkgver=4.8.30
pkgrel=1
epoch=
pkgdesc="Oracle Berkeley DB version 4.8.30"
arch=('x86_64' 'i686')
url="https://www.oracle.com/technetwork/database/database-technologies/berkeleydb/overview/index.html"
license=('custom:Berkeley database license')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(libtool staticlibs)
install=
changelog=
source=("http://download.oracle.com/berkeley-db/db-$pkgver.tar.gz"
        "01_gcc8-atomic_compare_exchange.patch")
noextract=()
md5sums=('f80022099c5742cd179343556179aa8c'
         '4f493a3ccab85f0d4e4efb5a5d09370b')
sha1sums=('ab36c170dda5b2ceaad3915ced96e41c6b7e493c'
          'c6e0db69bde739d6f3c454136653d648accdd615')
sha256sums=('e0491a07cdb21fb9aa82773bbbedaeb7639cbd0e7f96147ab46141e0045db72a'
            'e381aebd56fb5a7a6767fdbe841dffbacde0b0cb406467eb4100955e8e952fa3')
validpgpkeys=("9337E0FFC604A322352A55606253B09AEA6AE9E1")

prepare() {
    cd "db-$pkgver"
    patch -p2 -i "$srcdir/01_gcc8-atomic_compare_exchange.patch"
}


build() {
	cd "db-$pkgver/build_unix"
	../dist/configure --prefix=/opt/BerkeleyDB-4.8 --enable-cxx --enable-shared --enable-static --disable-replication
	make
}


package() {
	cd "db-$pkgver/build_unix"
	make DESTDIR="$pkgdir/" install
	libtool --finish "$pkgdir/opt/BerkeleyDB-4.8/lib"

	# Remove conflicting symlinks created by make, should never overwrite 
	# main libdb symlinks to current version. Programs that need or use 
	# db4.8 should be able to find it.
	rm -f "$pkgdir/usr/lib/libdb.so"
	rm -f "$pkgdir/usr/lib/libdb_cxx.so"
	rm -f "$pkgdir/usr/lib/libdb-4.so"
	rm -f "$pkgdir/usr/lib/libdb_cxx-4.so"
	
	install -Dm644 "$srcdir/db-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
