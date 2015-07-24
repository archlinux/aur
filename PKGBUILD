# Maintainer: M0Rf30
# Contributor: Lukas Fleischer <archlinux at cryptocrack dot de>
# Contributor: Hugo Doria <hugo@archlinux.org>
# Contributor: Kessia 'even' Pinheiro <kessiapinheiro at gmail.com>
# Contributor: dorphell <dorphell@archlinux.org>
# Contributor: Gregor Ibic <gregor.ibic@intelicom.si>

pkgname=snort
pkgver=2.9.7.5
pkgrel=1
pkgdesc='A lightweight network intrusion detection system.'
arch=('i686' 'x86_64')
url='http://www.snort.org'
license=('GPL')
depends=('libdaq' 'libdnet' 'libpcap' 'openssl' 'pcre' 'zlib')
backup=('etc/snort/snort.conf'
        'etc/snort/threshold.conf'
        'etc/snort/reference.config'
        'etc/snort/classification.config'
	'etc/snort/rules/emerging.conf')
options=('!makeflags' '!libtool')
install='snort.install'
source=("https://www.snort.org/downloads/snort/${pkgname}-${pkgver}.tar.gz"
	"http://rules.emergingthreats.net/open/${pkgname}-2.9.0/emerging.rules.tar.gz"
	'snort@.service')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --sysconfdir=/etc/snort --with-libpcap-includes=/usr/include/pcap \
	      --with-daq-includes=/usr/include --with-daq-libraries=/usr/lib/daq/ \
              --disable-static-daq
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install

  mkdir -p "${pkgdir}/"{etc/rc.d,etc/snort/rules}

  install -d -m755 "${pkgdir}/var/log/snort"
  install -D -m644 etc/{*.conf*,*.map} "${pkgdir}/etc/snort/"

# init service file
  install -D -m644 ../snort@.service $pkgdir/usr/lib/systemd/system/snort@.service

  sed -i 's#/usr/local/lib/#/usr/lib/#' "${pkgdir}/etc/snort/snort.conf"

# emerginthreats rules
  echo 'include $RULE_PATH/emerging.conf' >> "${pkgdir}/etc/snort/snort.conf"
  cp ${srcdir}/rules/* "${pkgdir}/etc/snort/rules"
}

md5sums=('fd271788c0f8876be87a858a9142f202'
         'SKIP'
         '49c7e8dbde680322ff5c4e0883f2b908')
