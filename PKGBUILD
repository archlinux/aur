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
provides=('dogecoin-qt')
depends=('miniupnpc' 'boost-libs' 'protobuf' 'openssl-1.0' 'db' 'libevent')
makedepends=('boost' 'gcc' 'make' 'git' 'qt4' 'miniupnpc' 'boost-libs' 'protobuf' 'openssl' 'db')
source=("https://github.com/dogecoin/dogecoin/archive/v${pkgver}.tar.gz"
		"dogecoin.desktop"
        )

install=dogecoin.install

sha256sums=('416581d0af2df05ededb400b9434765eeaeb1396c9f3ef80a7b59a88c74a90cc'
            '04d41773462ad6609658e291d22b15cd8d58b8eb5e4391a80cd1dae75e7df0e6')

build() {
	cd "${srcdir}/dogecoin-$pkgver/"

	./autogen.sh

	# --with-incompatible-bdb is needed, because dogecon-qt wants version 5.1, but Arch is already on 5.3
	CFLAGS="-I/usr/include/openssl-1.0 $CFLAGS" CPPFLAGS="-I/usr/include/openssl-1.0 $CPPFLAGS" LDFLAGS=" -L/usr/lib/openssl-1.0 $LDFLAGS" \
	./configure QMAKE_CFLAGS_RELEASE="$CPPFLAGS $CFLAGS" QMAKE_CXXFLAGS_RELEASE="$CPPFLAGS $CXXFLAGS" \
	QMAKE_LFLAGS_RELEASE="$LDFLAGS" --with-incompatible-bdb --prefix=/usr \
	--sbindir=/usr/bin --sysconfdir=/etc --libexecdir=/usr/lib

	make ${MAKEFLAGS}
}

package() {
	install -Dm644 "${srcdir}/${_binname}.desktop" "${pkgdir}/usr/share/applications/${_binname}.desktop"
    cd "${srcdir}/dogecoin-${pkgver}/"
	mkdir -p -m 755 "${pkgdir}/usr/share/dogecoin-qt/"
	install -Dm644 share/pixmaps/bitcoin256.xpm "${pkgdir}/usr/share/pixmaps/dogecoin.xpm"
	make DESTDIR=${pkgdir} install 
}
