# Maintainer: Amish <contact at via dot aur>
# Contributor: M0Rf30
# Contributor: Lukas Fleischer <archlinux at cryptocrack dot de>
# Contributor: Hugo Doria <hugo@archlinux.org>
# Contributor: Kessia 'even' Pinheiro <kessiapinheiro at gmail.com>
# Contributor: dorphell <dorphell@archlinux.org>
# Contributor: Gregor Ibic <gregor.ibic@intelicom.si>

pkgname=snort-nfqueue
_pkgname=snort
pkgver=2.9.11.1
pkgrel=1
pkgdesc='A lightweight network intrusion detection system.'
arch=('i686' 'x86_64')
url='http://www.snort.org'
license=('GPL')
provides=('snort')
conflicts=('snort')
depends=('libdaq-nfqueue' 'libdnet' 'libnetfilter_queue' 'libpcap' 'openssl' 'pcre' 'pulledpork' 'zlib')
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
source=("https://www.snort.org/downloads/snort/${_pkgname}-${pkgver}.tar.gz"
        'snort.conf'
        'homenet.conf'
        'local.rules'
        'logrotate'
	'snort.service')
sha256sums=('9f6b3aeac5a109f55504bd370564ac431cb1773507929dc461626898f33f46cd'
            '2c5994e2442f6e4c881e00d6c619aab80f90ac4481b9bff5d3bea43953438d52'
            'b65d8d8e37f686244dfb7293b1ea378f1dfd8141c14dbaf5e83dba9440152808'
            'ec4d81936b3905ba980ee694ae77ad15d5adda45c9f87fa0c27adc38f11bca08'
            '4df93871c41f94d688a6c8b9762fa221a703b54d309ee1436c90eebbd3fb8c9d'
            'b904ed172ea0c1a4eeaddb30745aadb8db21e333eb9faaf93400ce3db166f90d')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  ./configure --prefix=/usr --sysconfdir=/etc/snort --with-libpcap-includes=/usr/include/pcap \
	      --with-daq-includes=/usr/include --with-daq-libraries=/usr/lib/daq/ \
              --enable-zlib --disable-static-daq
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install

  install -d -m750 "${pkgdir}/var/log/snort/old"
  chmod 750 "${pkgdir}/var/log/snort"
  chown -R 29:29 "${pkgdir}/var/log/snort"
  install -d -m755 "${pkgdir}"/etc/snort/{dynamic,}rules
  install -D -m644 etc/{*.conf*,*.map} "${pkgdir}/etc/snort/"
  install -D -m644 ../snort.conf ../homenet.conf "${pkgdir}/etc/snort/"
  install -D -m644 ../local.rules "${pkgdir}/etc/snort/rules/"
  touch "${pkgdir}/etc/snort/rules/snort.rules"
  chmod 644 "${pkgdir}/etc/snort/rules/snort.rules"
  install -D -m644 ../snort.service "${pkgdir}/usr/lib/systemd/system/snort.service"
  sed -i 's#/usr/local/lib/#/usr/lib/#' "${pkgdir}/etc/snort/snort.conf"
  install -Dm644 ../logrotate "${pkgdir}/etc/logrotate.d/snort"
}
