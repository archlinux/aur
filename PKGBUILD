# Maintainer: Nicholas Wang <me@nicho1as.wang>
# Contributor: locked_sh <locked.shadow@openmailbox.org>

pkgname=emercoin
pkgver=0.6.3.1
pkgrel=3
pkgdesc="Digital currency and blockchain service platform"
arch=('i686' 'x86_64')
url="https://emercoin.com/"
license=('GPL')
depends=('openssl-1.0' 'boost-libs' 'miniupnpc' 'qt5-base' 'protobuf' 'qrencode')
makedepends=('boost')
source=("https://github.com/${pkgname}/${pkgname}/archive/v${pkgver}emc.tar.gz"
        "Fix-build-boost-compilation-error-with-C-11.patch"
        "fix-qt5-build.patch"
        "Fix-build-with-boost-1.66.patch")
sha256sums=('91e3fe3aaf7a162c924da00ed6ca41e6a8457196da66169ed2678ddc8bd99bca'
            '52afbe65bd924a252b939589194be6fdac7d06d884def66ea992562af2f9ccbd'
            'c4d099cc35d3d0770189a4a5884e3fbeb5b2e9f890d12d42d10314f477bcefb8'
            '5d27f2e52820d0de4b1e8c90fb0bc75e525ccd483efa2740235eb3851b18b7bc')
prepare() {
	cd "${pkgname}-${pkgver}emc"
	patch -Np1 -i ${srcdir}/Fix-build-boost-compilation-error-with-C-11.patch #See https://github.com/litecoin-project/litecoin/issues/240 for more details.
	patch -Np1 -i ${srcdir}/fix-qt5-build.patch #See https://forum.feathercoin.com/post/80641 for more details.
	patch -Np1 -i ${srcdir}/Fix-build-with-boost-1.66.patch #See https://github.com/peercoin/peercoin/pull/316/ for more details.
}

build() {
	cd "${pkgname}-${pkgver}emc"
	export PKG_CONFIG_PATH=/usr/lib/openssl-1.0/pkgconfig
	export CFLAGS+=" -I/usr/include/openssl-1.0 -fPIC"
	export CXXFLAGS+=" -fPIC"
	export LDFLAGS+=" -L/usr/lib/openssl-1.0 -lssl"
	./autogen.sh
	./configure --prefix=/usr --with-gui=qt5 --with-incompatible-bdb --with-openssl --with-libressl=no --enable-tests=no
	make
}

package() {
	cd "${pkgname}-${pkgver}emc"
	make DESTDIR="$pkgdir/" install
#	install -Dm644 contrib/debian/emercoin-qt.desktop \
#		"$pkgdir"/usr/share/applications/emercoin.desktop
#	install -Dm644 contrib/debian/emercoin.conf \
#		"$pkgdir/etc/emercoin.conf"
#	install -Dm644 contrib/debian/emercoind.service \
#		"$pkgdir/usr/lib/systemd/system/emercoind.service"
	install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
