# Maintainer: Moses Narrow <moe_narrow@use.startmail.com>
# Contributor: locked_sh <locked.sh@disroot.org>
# Contributor: Nicholas Wang <me@nicho1as.wang>

pkgname=emercoin
pkgver=0.7.11
pkgrel=3
pkgdesc="Digital currency and blockchain service platform"
arch=('i686' 'x86_64' 'aarch64' 'armv8' 'armv7' 'armv7l' 'armv7h' 'armv6h' 'armhf' 'armel' 'arm')
url="https://emercoin.com/"
license=('GPL')
depends=('boost-libs' 'miniupnpc' 'qt5-base' 'protobuf' 'qrencode' 'libevent')
makedepends=('boost' 'qt5-tools')
source=("https://github.com/${pkgname}/${pkgname}/archive/v${pkgver}emc.tar.gz"
        "Fix-missing-include.patch"
        "Fix-deadlock-while-switching-from-SSLv3-to-TLS.patch"
        "emercoin-qt.desktop"
)
sha256sums=('78d11b9308d67e53552d596269ae3be881ee6f88c8fb531a08ec9b77e9f7d024'
            '75b1e7bebb53a48cf93f2b701bbd8d9a1e7005b45c63a804596b68b0e9343c87'
            '1b339af10cbd8e003ce7c44f28b9d2eaf23e01d094078f96f21fa45d1679edef'
            '06645c91c499215866a506e409a8f4a80d77dbb85fdfc0bd9d1db75e2687a508')
prepare() {
	cd "${pkgname}-${pkgver}emc"
	patch -Np1 -i ${srcdir}/Fix-missing-include.patch #See https://doc.qt.io/Qt-5/qintvalidator.html for more details
#	patch -Np1 -i ${srcdir}/Fix-deadlock-while-switching-from-SSLv3-to-TLS.patch #See https://bugs.archlinux.org/task/60235 and https://github.com/bitcoin/bitcoin/issues/14273#issuecomment-424905851 for more details
}

build() {
	cd "${pkgname}-${pkgver}emc"
	./autogen.sh
	./configure --prefix=/usr --with-gui=qt5 --with-incompatible-bdb --with-openssl --with-libressl=no --enable-tests=no
	make
}

package() {
	cd ${pkgname}-${pkgver}emc
	make DESTDIR=${pkgdir}/ install
	install -Dm644 ${srcdir}/emercoin-qt.desktop ${pkgdir}/usr/share/applications/emercoin.desktop
	install -Dm644 src/qt/res/icons/emercoin.png ${pkgdir}/usr/share/pixmaps/emercoin.png
#	install -Dm644 contrib/debian/emercoin.conf \
#		"$pkgdir/etc/emercoin.conf"
#	install -Dm644 contrib/debian/emercoind.service \
#		"$pkgdir/usr/lib/systemd/system/emercoind.service"
	install -Dm644 COPYING ${pkgdir}/usr/share/licenses/${pkgname}/COPYING
  mv  ${pkgdir}/usr/share/man/man1 ${pkgdir}/usr/share/man/man2
}
