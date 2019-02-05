# Maintainer: BrainDamage <braindamage springlobby.info>

pkgname=ntp-refclock
pkgver=0.2
pkgrel=1
ntpver=4.2.8p11 #ntp-refclock 0.2 doesn't build with ntp versions later than this one
pkgdesc='Wrapper for ntpd reference clock drivers'
arch=('i686' 'x86_64' 'armv7h')
license=('BSD')
url='https://github.com/mlichvar/ntp-refclock'
source=("https://github.com/mlichvar/ntp-refclock/archive/v${pkgver}.tar.gz"
  "https://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-{$ntpver}.tar.gz")
sha1sums=('8bd9dd471d92c53e2d020a5569e30f8afb8c9958'
  'b20352bb76963a0ef5ec07ba99c2bb97ec6b6aeb')


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
