# Maintainer: BrainDamage <braindamage springlobby.info>

pkgname=ntp-refclock
pkgver=0.5
pkgrel=2
ntpver=4.2.8p15
pkgdesc='Wrapper for ntpd reference clock drivers'
arch=('x86_64' 'armv7h' 'aarch64')
license=('BSD')
url='https://github.com/mlichvar/ntp-refclock'
source=("https://github.com/mlichvar/ntp-refclock/archive/v${pkgver}.tar.gz"
	"https://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-${ntpver%.*p*}/ntp-${ntpver}.tar.gz")
sha1sums=('491c7a2916ad0f7bf74a958c0f09138975a644da'
          'e34e5b6f48c3ed1bbcfb03080dec1b8f91e19381')

prepare() {
	cd "${srcdir}/ntp-${ntpver}"
	sed -i 's/#ifndef __sun/#if !defined(__sun) \&\& !defined(__GLIBC__)/' libntp/work_thread.c
}

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
