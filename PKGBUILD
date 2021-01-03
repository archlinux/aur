#Maintainer thermi
#I Used the packet "dogecoin-qt-git" of Gee as a base for this one
#Based of primecoin-qt by Daniel Spies

pkgname=dogecoin-qt
_binname=dogecoin
pkgver=1.14.2
pkgrel=1
pkgdesc="Cryptocurrency"
arch=('x86_64' 'i686')
url="http://dogecoin.com/"
license=('MIT')
provides=('dogecoin-daemon' 'dogecoin-tx' 'dogecoin-cli' )
depends=('miniupnpc' 'boost-libs' 'protobuf' 'openssl-1.0' 'db' 'libevent')
makedepends=('boost' 'gcc' 'make' 'git' 'qt5-tools' 'miniupnpc' 'boost-libs' 'protobuf' 'openssl' 'db')
source=("https://github.com/$_binname/$_binname/archive/v${pkgver}.tar.gz"
        "boost.patch"
        "deque.patch"
        "qpainterpath.patch"
        "$_binname.desktop")

install=$_binname.install

sha256sums=('416581d0af2df05ededb400b9434765eeaeb1396c9f3ef80a7b59a88c74a90cc'
            'e6d3eef4e71719afd748bfd312955c32bc50b3ea2b0a92297e6982b42b0c210e'
            '792f4073d0de5017c9750a5f4a653759a79020d0de69e60320fcba0e4030005a'
            '1d503bd528f960a863f702a87a7ae283b6f6b29050b7faa552c3967514b0ece9'
            '04d41773462ad6609658e291d22b15cd8d58b8eb5e4391a80cd1dae75e7df0e6')

prepare() {
	cd "$srcdir/$_binname-$pkgver"
	patch -p2 <$srcdir/deque.patch
	patch -p1 <$srcdir/qpainterpath.patch
	patch -p2 <$srcdir/boost.patch
}

build() {
	cd "$srcdir/$_binname-$pkgver/"

	./autogen.sh

	# --with-incompatible-bdb is needed, because dogecon-qt wants version 5.1, but Arch is already on 5.3
	CFLAGS="-I/usr/include/openssl-1.0 $CFLAGS" CPPFLAGS="-I/usr/include/openssl-1.0 $CPPFLAGS" LDFLAGS=" -L/usr/lib/openssl-1.0 $LDFLAGS" \
	./configure QMAKE_CFLAGS_RELEASE="$CPPFLAGS $CFLAGS" QMAKE_CXXFLAGS_RELEASE="$CPPFLAGS $CXXFLAGS" \
	QMAKE_LFLAGS_RELEASE="$LDFLAGS" --with-incompatible-bdb --prefix=/usr \
	--sbindir=/usr/bin --sysconfdir=/etc --libexecdir=/usr/lib

	make
}

package() {
	install -Dm644 "$srcdir/$_binname.desktop" "$pkgdir/usr/share/applications/$_binname.desktop"
	cd "$srcdir/$_binname-$pkgver/"
	mkdir -p -m 755 "$pkgdir/usr/share/$_binname-qt/"
	install -Dm644 share/pixmaps/bitcoin256.xpm "$pkgdir/usr/share/pixmaps/$_binname.xpm"
	make DESTDIR=${pkgdir} install 
}
