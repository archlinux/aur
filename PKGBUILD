#Maintainer thermi
#I Used the packet "dogecoin-qt-git" of Gee as a base for this one
#Based of primecoin-qt by Daniel Spies

pkgname=dogecoin-qt
_binname=dogecoin
pkgver=1.10.0
pkgrel=2
pkgdesc="Cryptocurrency"
arch=('x86_64' 'i686')
url="http://dogecoin.com/"
license=('MIT')
provides=('dogecoin-qt')
depends=('miniupnpc' 'boost-libs' 'protobuf' 'openssl-1.0' 'db')
makedepends=('boost' 'gcc' 'make' 'git' 'qt4' 'miniupnpc' 'boost-libs' 'protobuf' 'openssl' 'db')
# Patches are from https://sources.debian.net/data/main/d/dogecoin/1.10.0-5/debian/patches/
source=("https://github.com/dogecoin/dogecoin/archive/v${pkgver}.tar.gz"
		"0001-configure.ac_use_PIC.patch"
		"0002-rename-libbitcoinconsensus-to-libdogecoinconsensus.patch"
		"0004-rename-RAND_egd.patch"
		"dogecoin.desktop"
        )
install=dogecoin.install

sha256sums=('e392f4142819fdab313ba921af53fdbd2cf6ee8965d237d0cb5cda8a52c97084'
            '243ee3a86d91b408fad90f956a891c10958993ef170b4168444e09d78b8c0bac'
            '215cab9e24d2c5583370979e4a0a9b46ccc5f4595233bb1a6a2eb4586773efbb'
            '38e6a8cc94ab53901919c672ce1cf808c82cd2f32e6e5514fd4ecba94d0d26cc'
            '04d41773462ad6609658e291d22b15cd8d58b8eb5e4391a80cd1dae75e7df0e6')

prepare() {
	cd "${srcdir}/dogecoin-$pkgver/"
	patch -p1 <"${srcdir}/0001-configure.ac_use_PIC.patch"
	patch -p1 <"${srcdir}/0002-rename-libbitcoinconsensus-to-libdogecoinconsensus.patch"
	patch -p1 <"${srcdir}/0004-rename-RAND_egd.patch"
}
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
