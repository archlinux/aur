# Maintainer: locked_sh <locked.shadow@openmailbox.org>
# Contributor: Nicholas Wang <me@nicho1as.wang>

pkgname=emercoin
pkgver=0.7.0
pkgrel=1
pkgdesc="Digital currency and blockchain service platform"
arch=('i686' 'x86_64')
url="https://emercoin.com/"
license=('GPL')
depends=('openssl-1.0' 'boost-libs' 'miniupnpc' 'qt5-base' 'protobuf' 'qrencode')
makedepends=('boost')
source=("https://github.com/${pkgname}/${pkgname}/archive/v${pkgver}emc.tar.gz"
        "Fix-missing-include.patch"
)
sha256sums=('89ae9724bc4934ff7ad6be920dc90f1558e7a1dcc8e1c8f0651d629d9af75d8e'
            '75b1e7bebb53a48cf93f2b701bbd8d9a1e7005b45c63a804596b68b0e9343c87'
)
prepare() {
	cd "${pkgname}-${pkgver}emc"
	patch -Np1 -i ${srcdir}/Fix-missing-include.patch #See https://doc.qt.io/Qt-5/qintvalidator.html for more details
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
