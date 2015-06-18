# Maintainer: drrossum <d.r.vanrossum[at]gmx dot de>
# Contributor: fs4000 <matthias_dienstbier[at]yahoo[dot]de>
# Contributor: trapanator <trap[at]trapanator[dot]com>
# Contributor: tomprogrammer <Thomas-Bahn[at]gmx[dot]net>

pkgname=dkms-phc-intel
pkgver=0.3.2.12.17
_realver=pack-rev17
pkgrel=1
pkgdesc="CPU frequency driver - DKMS automatic module generation after kernel upgrade"
url="http://www.linux-phc.org"
arch=('any')
license=('GPL')
provides=('linux-phc')
replaces=('linux-phc')
conflicts=('phc-intel')
depends=('dkms')
backup=(etc/default/phc-intel)
install=dkms-phc-intel.install
source=(phc-intel-$_realver.tar.bz2::$url/forum/download/file.php?id=166
        phc-intel.{default,sh,sleep,system-sleep}
	dkms-phc-intel.{sh,service}
        dkms.conf)
md5sums=('e756243b8f85386fda2473af1130843f'
         'bc8b26dc2966cc9210c5631aceee025a'
         'd5fccf39f5796a048aae8b7a28fe5d2d'
         'fbef61e4ec39af0b580d11508b41d59e'
         '1b91c6462485c127b621a223412a3dfc'
         '6e97791fb6cc4b9ecf9b8b7127050c3a'
         'dd1b315b5747d52445a95bc731e2ccb6'
         '1f6072119c5e710a3ba2f020cb2f8266')


build() {
	cd phc-intel-$_realver
	sed -e 's,$(DESTDIR)/lib/modules/$(KERNELRELEASE)/extra$,$(DESTDIR)/usr/lib/modules/$(KERNELRELEASE)/extramodules,' \
		-e 's/`uname -r`/\$(KERNELRELEASE)/' \
		-e 's,^\tinstall -m 644 -o root -g root phc-intel.modprobe,#\tinstall -m 644 -o root -g root phc-intel.modprobe,' -i Makefile
	sed -i 's,/sbin/modprobe phc-intel |,/sbin/modprobe phc-intel \&\& /usr/bin/phc-intel set |,' phc-intel.modprobe
}

package() {
	install -Dm644 phc-intel.default "$pkgdir/etc/default/phc-intel"
	install -Dm755 phc-intel.sh "$pkgdir/usr/bin/phc-intel"
	install -Dm755 phc-intel.sleep "$pkgdir/usr/lib/pm-utils/sleep.d/00phc-intel"
	install -Dm755 phc-intel.system-sleep "$pkgdir/usr/lib/systemd/system-sleep/phc-intel"
	install -Dm644 dkms-phc-intel.service "$pkgdir/usr/lib/systemd/system/dkms-phc-intel.service"
	install -Dm755 dkms-phc-intel.sh "$pkgdir/usr/lib/systemd/scripts/dkms-phc-intel"

 	install -d ${pkgdir}/usr/src/${pkgname}-${pkgver}
	cp dkms.conf ${pkgdir}/usr/src/${pkgname}-${pkgver}
	cd phc-intel-$_realver
	install -Dm644 phc-intel.modprobe "$pkgdir/usr/lib/modprobe.d/phc-intel.conf"
	cp -R inc Makefile ${pkgdir}/usr/src/${pkgname}-${pkgver}
}
