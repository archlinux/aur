# Maintainer: BrainDamage

pkgname=ntp-refclock
pkgver=0.7
pkgrel=1
ntpver=4.2.8p18
pkgdesc='Wrapper for ntpd reference clock drivers'
arch=('x86_64' 'armv7h' 'aarch64')
license=('BSD-2-Clause')
url='https://github.com/mlichvar/ntp-refclock'
source=("https://github.com/mlichvar/ntp-refclock/archive/v${pkgver}.tar.gz"
		"https://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-${ntpver%.*p*}/ntp-${ntpver}.tar.gz"
		 ntp-4.2.8.p18-fix-build.patch)
sha256sums=('f93043ba4ca22f7d495cf86f6311923b67d5e153607dc7634a8b12409de1b114'
            'cf84c5f3fb1a295284942624d823fffa634144e096cfc4f9969ac98ef5f468e5'
            '9c4afa0daed5fd3cc9544ec808b2bb1dd959e5d40c4cae307b7025b16885903c')

prepare() {
	cd "${srcdir}/ntp-${ntpver}"

	patch -Np1 < ../ntp-4.2.8.p18-fix-build.patch
	autoreconf -fiv
}


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
	make NTP_SRC="${srcdir}/ntp-${ntpver}" prefix="$pkgdir/usr" sbindir="$pkgdir/usr/bin" install
}
