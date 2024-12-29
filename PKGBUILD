# Maintainer: BrainDamage

pkgname=ntp-refclock
pkgver=0.6
pkgrel=2
ntpver=4.2.8p16
pkgdesc='Wrapper for ntpd reference clock drivers'
arch=('x86_64' 'armv7h' 'aarch64')
license=('BSD-2-Clause')
url='https://github.com/mlichvar/ntp-refclock'
source=("https://github.com/mlichvar/ntp-refclock/archive/v${pkgver}.tar.gz"
		"https://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-${ntpver%.*p*}/ntp-${ntpver}.tar.gz")
sha256sums=('fb2ef8bdf29715d180575fb66657224311822e01ad2dfd512694756fa3d49921'
            '5225858bfd843b080fb9daa5b7370519130e5e49ac3eb0371e334bdc06c52dd7')

build() {
	cd "${srcdir}/ntp-${ntpver}"
	#first build the NTP code
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
