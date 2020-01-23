# Maintainer: adrien1018 <adrien.sf.wu[at]gmail[dot]com>
# Contributor: fs4000 <matthias_dienstbier[at]yahoo[dot]de>
# Contributor: trapanator <trap[at]trapanator[dot]com>
# Contributor: tomprogrammer <Thomas-Bahn[at]gmx[dot]net>

pkgname=phc-intel
_phcver=0.3.2
pkgver=$_phcver.12.31
_realver=pack-rev31
pkgrel=2
pkgdesc="Frequency driver for Intel CPUs with undervolting feature"
url="http://www.linux-phc.org"
arch=('any')
license=('GPL')
depends=('dkms')
provides=('linux-phc')
backup=('etc/default/phc-intel')
install=phc-intel.install
source=(phc-intel.{default,sh,sleep,system-sleep}
        $pkgname-$_realver.tar.bz2
        dkms.conf)
sha256sums=('ce08a5a4107be1d5723f1f169d515e67b6c77893f3994fc2d0d2ccf611307ed3'
            'b526f3e8e66f6495531f13f2e6867d3a07b2ec7a7c3b8aa061f22be1cd6e770f'
            '569b85988cb38380fec85c25688b76abc24a46601aa8f58eb24eaebf863eebef'
            '2e17c90d7bfae8f5070e46388e95d443188eaa7beb5ffdd418a0da090f2e7557'
            'adee614a1aacfe924625de0d75703d8fa37f942dcd99e276ee357359beac3129'
            '7b44882a96eeb7c79dbb7fe5b1ff8cded68c2b6a374c95bdc5e08c414cfd3549')

prepare() {
	cd $pkgname-$_realver
	sed -i 's,/sbin/modprobe phc-intel |,/sbin/modprobe phc-intel \&\& /usr/bin/phc-intel set |,' phc-intel.modprobe
}

package() {
	umask 022
	install -Dm644 dkms.conf "$pkgdir/usr/src/phc-intel-$_phcver/dkms.conf"
	install -Dm644 phc-intel.default "$pkgdir/etc/default/phc-intel"
	install -Dm755 phc-intel.sh "$pkgdir/usr/bin/phc-intel"
	install -Dm755 phc-intel.sleep "$pkgdir/usr/lib/pm-utils/sleep.d/00phc-intel"
	install -Dm755 phc-intel.system-sleep "$pkgdir/usr/lib/systemd/system-sleep/phc-intel"

	cd $pkgname-$_realver
	install -Dm644 phc-intel.modprobe "$pkgdir/usr/lib/modprobe.d/phc-intel.conf"
	cp -R inc Makefile "$pkgdir/usr/src/phc-intel-$_phcver/"
}
