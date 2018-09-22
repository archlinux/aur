# Maintainer: locked_sh <locked.shadow@openmailbox.org>
# Contributor: Nicholas Wang <me@nicho1as.wang>

pkgname=emercoin
pkgver=0.7.2
pkgrel=1
pkgdesc="Digital currency and blockchain service platform"
arch=('i686' 'x86_64')
url="https://emercoin.com/"
license=('GPL')
depends=('boost-libs' 'miniupnpc' 'qt5-base' 'protobuf' 'qrencode')
makedepends=('boost')
source=("https://github.com/${pkgname}/${pkgname}/archive/v${pkgver}emc.tar.gz"
        "Fix-missing-include.patch"
)
sha256sums=('bcd46d5773431c67d864ccb9fe4ab5757f2f85c142a5f36ded4f95018532922d'
            '75b1e7bebb53a48cf93f2b701bbd8d9a1e7005b45c63a804596b68b0e9343c87')
prepare() {
	cd "${pkgname}-${pkgver}emc"
	patch -Np1 -i ${srcdir}/Fix-missing-include.patch #See https://doc.qt.io/Qt-5/qintvalidator.html for more details
}

build() {
	cd "${pkgname}-${pkgver}emc"
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
