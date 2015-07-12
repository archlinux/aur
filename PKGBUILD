# Contributor: fs4000 <matthias_dienstbier[at]yahoo[dot]de>

pkgname=phc-k8
pkgver=0.4.6
pkgrel=1
pkgdesc="frequency driver for AMD CPUs with undervolting feature"
url="http://www.linux-phc.org"
arch=('any')
license=('GPL')
provides=('linux-phc')
backup=(etc/default/phc-k8 etc/modprobe.d/phc-k8.conf)
install=phc-k8.install
source=(phc-k8-$pkgver.tar.gz::$url/forum/download/file.php?id=165
        phc-k8.{default,sh,sleep,system-sleep})
sha256sums=('33c6041f314cfe25b7cded4b71736a3986781c505209c1af766723a12d37b53b'
            '352a97272390ed428cc1ebb886ebb044e7b54c145aa7a4c0d96862ad7a7fd46a'
            '8b4638f406249bf3e54604bfd282af6886be1c817045d586471383ea3b251fbf'
            '8619514df4b931705f713d61c1288b6e6960d578067523604b75960dcbc6e778'
            '74ae72d992d0205babd6c9428e637ca407fb26461bfc68da7f331945126b810a')

prepare() {
	cd phc-k8_v$pkgver
	sed -e 's,lib/modules/$(KERNELVERSION)/updates/kernel/arch/x86/kernel/cpu/cpufreq,usr/lib/modules/$(KERNELVERSION)/extramodules,'\
	    -e 's,^\tinstall -m 644 -o root -g root phc-k8.modprobe,#\tinstall -m 644 -o root -g root phc-k8.modprobe,' -i Makefile
	sed -i 's,/sbin/modprobe phc-k8 |,/sbin/modprobe phc-k8 \&\& /usr/bin/phc-k8 set |,' phc-k8.modprobe
}

package() {
	install -Dm644 phc-k8.default "$pkgdir/etc/default/phc-k8"
	install -Dm755 phc-k8.sh "$pkgdir/usr/bin/phc-k8"
	install -Dm755 phc-k8.sleep "$pkgdir/usr/lib/pm-utils/sleep.d/00phc-k8"
	install -Dm755 phc-k8.system-sleep "$pkgdir/usr/lib/systemd/system-sleep/phc-k8"

	cd phc-k8_v$pkgver
	install -Dm644 phc-k8.modprobe "$pkgdir/etc/modprobe.d/phc-k8.conf"
	install -d "$pkgdir/usr/src/phc-k8/" "$pkgdir/usr/share/doc/phc-k8/"
	install -m644 Changelog README "$pkgdir/usr/share/doc/phc-k8/"
	install -m644 Makefile mperf.? phc-k8.? "$pkgdir/usr/src/phc-k8/"
}
