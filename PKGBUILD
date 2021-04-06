# Maintainer: robertfoster
# Contributor: Lukas Fleischer <archlinux at cryptocrack dot de>
# Contributor: Hugo Doria <hugo@archlinux.org>
# Contributor: Kessia 'even' Pinheiro <kessiapinheiro at gmail.com>
# Contributor: dorphell <dorphell@archlinux.org>
# Contributor: Gregor Ibic <gregor.ibic@intelicom.si>
# Contributor: Netboy3

pkgname=snort
pkgver=2.9.17.1
pkgrel=1
pkgdesc='A lightweight network intrusion detection system.'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64' 'arm')
url='http://www.snort.org'
license=('GPL')
depends=('dbus' 'libdaq' 'libdnet' 'libgcrypt' 'libgpg-error' 'libnghttp2' 'libnl' 'libpcap' 'luajit' 'lz4' 'openssl' 'pcre' 'xz' 'zlib')
makedepends=('libtirpc')
backup=('etc/snort/snort.conf'
  'etc/snort/threshold.conf'
  'etc/snort/reference.config'
  'etc/snort/classification.config'
  'etc/snort/rules/emerging.conf')
options=('!makeflags' '!libtool')
install='snort.install'
source=("https://www.snort.org/downloads/snort/${pkgname}-${pkgver}.tar.gz"
  "http://rules.emergingthreats.net/open/${pkgname}-2.9.0/emerging.rules.tar.gz"
  'snort@.service'
)

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr \
    --sysconfdir=/etc/snort \
    --with-libpcap-includes=/usr/include/pcap \
    --with-daq-includes=/usr/include \
    --with-daq-libraries=/usr/lib/daq/ \
    --disable-static-daq \
    CPPFLAGS="$CPPFLAGS -I/usr/include/tirpc/"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install

  mkdir -p "${pkgdir}/"{etc/rc.d,etc/snort/rules}

  install -d -m755 "${pkgdir}/var/log/snort"
  install -D -m644 etc/{*.conf*,*.map} "${pkgdir}/etc/snort/"
  cd "${srcdir}/${pkgname}-${pkgver}"

  # init service file
  install -D -m644 ../snort@.service $pkgdir/usr/lib/systemd/system/snort@.service

  sed -i 's#/usr/local/lib/#/usr/lib/#' "${pkgdir}/etc/snort/snort.conf"

  # emerginthreats rules
  echo 'include $RULE_PATH/emerging.conf' >>"${pkgdir}/etc/snort/snort.conf"
  cp ${srcdir}/rules/* "${pkgdir}/etc/snort/rules"
}

sha256sums=('303d3d5dc5affecfeaad3a331d3163f901d48d960fdd6598cb55c6d1591eed82'
            'SKIP'
            '0b7c4e5dfbfe53d2258c54129a6fcd1e6a476a8d4259d5ad7372f6229fb30605')
