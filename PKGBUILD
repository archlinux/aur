# Maintainer: Amish <contact at via dot aur>
# Contributor: M0Rf30
# Contributor: Lukas Fleischer <archlinux at cryptocrack dot de>
# Contributor: Hugo Doria <hugo@archlinux.org>
# Contributor: Kessia 'even' Pinheiro <kessiapinheiro at gmail.com>
# Contributor: dorphell <dorphell@archlinux.org>
# Contributor: Gregor Ibic <gregor.ibic@intelicom.si>

pkgname=snort-nfqueue
pkgver=2.9.6.1
pkgrel=7
pkgdesc='A lightweight network intrusion detection system.'
arch=('i686' 'x86_64')
url='http://www.snort.org'
license=('GPL')
provides=("snort=$pkgver")
conflicts=('snort')
depends=('libdaq' 'libdnet' 'libnetfilter_queue' 'libpcap' 'openssl' 'pcre' 'zlib')
backup=('etc/snort/snort.conf'
        'etc/snort/homenet.conf'
        'etc/snort/rules/local.rules'
        'etc/snort/rules/snort.rules'
        'etc/snort/threshold.conf'
        'etc/snort/reference.config'
        'etc/snort/classification.config'
        'etc/logrotate.d/snort')
options=('!makeflags' '!libtool')
install='snort.install'
source=("http://www.snort.org/dl/snort-current/snort-${pkgver}.tar.gz"{,.sig}
	"http://rules.emergingthreats.net/open/snort-2.9.0/emerging.rules.tar.gz"
        'snort.conf'
        'homenet.conf'
        'local.rules'
        'logrotate'
	'snort.service')
sha256sums=('119e4c5df83fe36a8d465e72a0347fe31e7771704da286f04115b0c5baa5f7b8'
            'SKIP'
            'SKIP'
            '7eb355f118a80002bc10b6069b641b57041ea9061e4d65f4c5e50d78aa640f84'
            'b65d8d8e37f686244dfb7293b1ea378f1dfd8141c14dbaf5e83dba9440152808'
            'ec4d81936b3905ba980ee694ae77ad15d5adda45c9f87fa0c27adc38f11bca08'
            '4df93871c41f94d688a6c8b9762fa221a703b54d309ee1436c90eebbd3fb8c9d'
            'b904ed172ea0c1a4eeaddb30745aadb8db21e333eb9faaf93400ce3db166f90d')

prepare() {
  if [ ! -x "/usr/lib/daq/daq_nfq.so" ]; then
    echo 'ERROR: daq is without NFQUEUE support'
    echo 'ERROR: first download libdaq source, makepkg and install it'
    echo 'WEBSITE: https://www.archlinux.org/packages/?q=libdaq'
    exit
  fi 
}

build() {
  cd "${srcdir}/snort-${pkgver}"
  ./configure --prefix=/usr --sysconfdir=/etc/snort --with-libpcap-includes=/usr/include/pcap \
	      --with-daq-includes=/usr/include --with-daq-libraries=/usr/lib/ \
              --enable-zlib --disable-static-daq
  make
}

package() {
  cd "${srcdir}/snort-${pkgver}"
  make DESTDIR="${pkgdir}" install

  install -d -m750 "${pkgdir}"/var/log/snort/old
  chmod 750 "${pkgdir}"/var/log/snort
  chown -R 29:29 "${pkgdir}"/var/log/snort
  install -d -m755 "${pkgdir}"/etc/snort/rules "${pkgdir}"/etc/snort/dynamicrules
  install -D -m644 etc/{*.conf*,*.map} "${pkgdir}"/etc/snort/
  install -D -m644 ../snort.conf ../homenet.conf "${pkgdir}"/etc/snort/
  install -D -m644 ../local.rules "${pkgdir}"/etc/snort/rules/
  touch "${pkgdir}"/etc/snort/rules/snort.rules
  chmod 644 "${pkgdir}"/etc/snort/rules/snort.rules
  install -D -m644 ../snort.service "${pkgdir}"/usr/lib/systemd/system/snort.service
  sed -i 's#/usr/local/lib/#/usr/lib/#' "${pkgdir}/etc/snort/snort.conf"
  install -Dm644 ../logrotate "${pkgdir}"/etc/logrotate.d/snort

  # emergingthreats rules
  cp ${srcdir}/rules/* "${pkgdir}/etc/snort/rules"
}
