# Maintainer: BrainDamage

pkgname=ntp-refclock
pkgver=0.6
pkgrel=1
ntpver=4.2.8p16
pkgdesc='Wrapper for ntpd reference clock drivers'
arch=('x86_64' 'armv7h' 'aarch64')
license=('BSD')
url='https://github.com/mlichvar/ntp-refclock'
source=("https://github.com/mlichvar/ntp-refclock/archive/v${pkgver}.tar.gz"
	"https://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-${ntpver%.*p*}/ntp-${ntpver}.tar.gz")
sha1sums=('53f1488052e002c61fe374ad11f32a8de2f06872'
          '7365404cba22b02454aff8a2cdb636dbcd2f12a5')

build() {
	#first build the NTP code
	cd "${srcdir}/ntp-${ntpver}"
	#disable building NTP components that rely on external libs, we don't use them anyway
	./configure --enable-all-clocks --enable-parse-clocks --without-crypto
	make
	cd "${srcdir}/ntp-refclock-${pkgver}"
	make NTP_SRC="${srcdir}/ntp-${ntpver}"
}

package() {
	cd "${srcdir}/ntp-refclock-${pkgver}"
	make prefix="$pkgdir/usr" sbindir="$pkgdir/usr/bin" install
}
