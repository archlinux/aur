# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: Gaetan Bisson <bisson@archlinux.org>

pkgname=hostapd-git
pkgver=20170315.6c2056abe
pkgrel=1
pkgdesc='IEEE 802.11 AP, IEEE 802.1X/WPA/WPA2/EAP/RADIUS Authenticator'
url='http://w1.fi/hostapd/'
arch=('i686' 'x86_64')
license=('custom')
makedepends=('git')
depends=('openssl' 'libnl')
source=('git://w1.fi/hostap.git'
         'service')
sha256sums=('SKIP'
         '989bc6855f44c0b360e3d4cd4a146c35b7c12f8a0ced627b4b033f58edcade8e')

options=('emptydirs')

conflicts=('hostapd')
provides=('hostapd')

pkgver() {
	cd "${srcdir}/hostap"
	git log -1 --format='%cd.%h' --date=short | tr -d -
}

build() {
	cd "${srcdir}/hostap/hostapd"
	sed -i 's:/etc/hostapd:/etc/hostapd/hostapd:' hostapd.conf
	sed -i '/CONFIG_LIBNL32=y/s/^#//' defconfig
	cp defconfig .config
	make
}

package() {
	cd "${srcdir}/hostap/hostapd"
	
	install -d "${pkgdir}"/usr/bin
	install -t "${pkgdir}"/usr/bin hostapd hostapd_cli

	install -d "${pkgdir}"/usr/share/doc/hostapd
	install -t "${pkgdir}"/usr/share/doc/hostapd -m644 hostapd.[a-z]* wired.conf hlr_auc_gw.milenage_db

	install -d "${pkgdir}"/etc/hostapd
	install -Dm644 hostapd.8 "${pkgdir}"/usr/share/man/man8/hostapd.8
	install -Dm644 hostapd_cli.1 "${pkgdir}"/usr/share/man/man1/hostapd_cli.1
	install -Dm644 ../COPYING "${pkgdir}"/usr/share/licenses/hostapd/COPYING
	install -Dm644 ../../service "${pkgdir}"/usr/lib/systemd/system/hostapd.service
}
