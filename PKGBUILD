#Maintainer mauritiusdadd
#Contributor thermi
#I Used the packet "dogecoin-qt-git" of Gee as a base for this one
#Based of primecoin-qt by Daniel Spies

pkgname=dogecoin-qt
_binname=dogecoin
pkgver=1.14.9
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
sha256sums=('0ea009b62034a9fe966140dff641daa1426423f734352ac179a2b23af03c032a'
            '04d41773462ad6609658e291d22b15cd8d58b8eb5e4391a80cd1dae75e7df0e6'
            'dbdc4812447f0aad9d3dbb8ee81d6fe18129af1dcccd7e930eddb5640540d764')
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
