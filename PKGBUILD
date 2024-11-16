#Maintainer mauritiusdadd
#Contributor thermi
#I Used the packet "dogecoin-qt-git" of Gee as a base for this one
#Based of primecoin-qt by Daniel Spies

pkgname=dogecoin-qt
_binname=dogecoin
pkgver=1.14.8
pkgrel=1
pkgdesc="Cryptocurrency"
arch=('x86_64' 'i686')
url="http://dogecoin.com/"
license=('MIT')
provides=('dogecoin-daemon' 'dogecoin-tx' 'dogecoin-cli' )
depends=('miniupnpc' 'boost-libs' 'protobuf' 'openssl' 'db' 'libevent' 'qt5-base')
makedepends=('boost' 'gcc' 'make' 'git' 'qt5-tools' 'miniupnpc' 'boost-libs' 'protobuf' 'openssl' 'db')
source=("https://github.com/$_binname/$_binname/archive/v${pkgver}.tar.gz"
        "$_binname.desktop"
	"${pkgname}.patch")
install=$_binname.install
sha256sums=('f88dc488535f02b98012c83a824002d0879fd2796443c6218dfd647aaec7cf61'
            '04d41773462ad6609658e291d22b15cd8d58b8eb5e4391a80cd1dae75e7df0e6'
            'e45fb9f27d1e091a04c77aa7594b100531bc631b44de116474ccc5ed655650fa')
options=(!lto)

prepare() {
    cd "$srcdir"
    patch -p1 -i "${pkgname}.patch"
}

build() {
    cd "$srcdir/$_binname-$pkgver/"

    LDFLAGS=${LDFLAGS/-static/}

    ./autogen.sh 

    ./configure --with-incompatible-bdb --enable-c++17 --prefix=/usr \
	--sbindir=/usr/bin --sysconfdir=/etc --libexecdir=/usr/lib --with-gui=qt5

    make
}

package() {
	install -Dm644 "$srcdir/$_binname.desktop" "$pkgdir/usr/share/applications/$_binname.desktop"
	cd "$srcdir/$_binname-$pkgver/"
	mkdir -p -m 755 "$pkgdir/usr/share/$_binname-qt/"
	install -Dm644 share/pixmaps/dogecoin256.xpm "$pkgdir/usr/share/pixmaps/$_binname.xpm"
	make DESTDIR=${pkgdir} install 
}
