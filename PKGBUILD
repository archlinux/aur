#Maintainer thermi
#I Used the packet "dogecoin-qt-git" of Gee as a base for this one
#Based of primecoin-qt by Daniel Spies

pkgname=dogecoin-qt
_binname=dogecoin
pkgver=1.8.2
pkgrel=2
pkgdesc="Cryptocurrency"
arch=('x86_64' 'i686')
url="http://dogecoin.com/"
license=('MIT')
provides=('dogecoin-qt')
depends=('miniupnpc' 'boost-libs' 'protobuf' 'openssl' 'db')
makedepends=('boost' 'gcc' 'make' 'git' 'qt4' 'miniupnpc' 'boost-libs' 'protobuf' 'openssl' 'db')
source=("https://github.com/dogecoin/dogecoin/archive/v${pkgver}.tar.gz"
        "dogecoin.desktop"
        "fixing-boost.patch"
        )
install=dogecoin.install

sha256sums=('87060dfe6d9770f8af17c447120cb6a059bbd84687dfd6a1f0787c9d75d75d9e'
            '04d41773462ad6609658e291d22b15cd8d58b8eb5e4391a80cd1dae75e7df0e6'
            '3b335f979bc54d5c8760c84192a3b1224e0fa0d7afaa2fb806c4a3b777c2bded')

prepare() {
	cd "${srcdir}/dogecoin-$pkgver/"
	patch -p1 -i $srcdir/fixing-boost.patch 
}

build() {
	cd "${srcdir}/dogecoin-$pkgver/"

	./autogen.sh

	# --with-incompatible-bdb is needed, because dogecon-qt wants version 5.1, but Arch is already on 5.3
	./configure QMAKE_CFLAGS_RELEASE="$CPPFLAGS $CFLAGS" QMAKE_CXXFLAGS_RELEASE="$CPPFLAGS 	$CXXFLAGS" \
	QMAKE_LFLAGS_RELEASE="$LDFLAGS" --with-incompatible-bdb --prefix=/usr \
	--sbindir=/usr/bin --sysconfdir=/etc --libexecdir=/usr/lib

	make ${MAKEFLAGS}
}

package() {
	install -Dm644 ${_binname}.desktop "${pkgdir}/usr/share/applications/${_binname}.desktop"
	cd "$srcdir/dogecoin-$pkgver"
	mkdir -p -m 755 "${pkgdir}/usr/share/dogecoin-qt/"
	install -Dm644 share/pixmaps/bitcoin256.xpm "${pkgdir}/usr/share/pixmaps/dogecoin.xpm"
	make DESTDIR=${pkgdir} install 
}
