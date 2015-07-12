# Maintainer: fs4000 <matthias_dienstbier[at]yahoo[dot]de>
# Maintainer: trapanator <trap[at]trapanator[dot]com>
# Maintainer: tomprogrammer <Thomas-Bahn[at]gmx[dot]net>

pkgname=phc-intel
pkgver=0.3.2.12.17
_realver=pack-rev17
pkgrel=1
pkgdesc="frequency driver for Intel CPUs with undervolting feature"
url="http://www.linux-phc.org"
arch=('any')
license=('GPL')
provides=('linux-phc')
backup=(etc/default/phc-intel)
install=phc-intel.install
source=(phc-intel-$_realver.tar.bz2::$url/forum/download/file.php?id=166
        phc-intel.{default,sh,sleep,system-sleep})
sha256sums=('97e8659423ff9ce5e7f77e5e4049b100677a37b05a341d294aba286de1bbaeb9'
            'ce08a5a4107be1d5723f1f169d515e67b6c77893f3994fc2d0d2ccf611307ed3'
            'c48fea46501c98c1f2aee0a49fd6abc68ac5a691bbdd3e3e41eb25dd2080c17f'
            '569b85988cb38380fec85c25688b76abc24a46601aa8f58eb24eaebf863eebef'
            '2e17c90d7bfae8f5070e46388e95d443188eaa7beb5ffdd418a0da090f2e7557')

prepare() {
	cd phc-intel-$_realver
	sed -e 's,$(DESTDIR)/lib/modules/$(KERNELRELEASE)/extra$,$(DESTDIR)/usr/lib/modules/$(KERNELRELEASE)/extramodules,' \
	    -e 's,^\tinstall -m 644 -o root -g root phc-intel.modprobe,#\tinstall -m 644 -o root -g root phc-intel.modprobe,' -i Makefile
	sed -i 's,/sbin/modprobe phc-intel |,/sbin/modprobe phc-intel \&\& /usr/bin/phc-intel set |,' phc-intel.modprobe
}

package() {
	install -Dm644 phc-intel.default "$pkgdir/etc/default/phc-intel"
	install -Dm755 phc-intel.sh "$pkgdir/usr/bin/phc-intel"
	install -Dm755 phc-intel.sleep "$pkgdir/usr/lib/pm-utils/sleep.d/00phc-intel"
	install -Dm755 phc-intel.system-sleep "$pkgdir/usr/lib/systemd/system-sleep/phc-intel"

	cd phc-intel-$_realver
	install -Dm644 phc-intel.modprobe "$pkgdir/usr/lib/modprobe.d/phc-intel.conf"
	install -d "$pkgdir/usr/src/phc-intel/"
	cp -R inc Makefile "$pkgdir/usr/src/phc-intel/"
}
