# Maintainer: robertfoster
# Contributor: Amish <contact at via dot aur>
# Contributor: Lukas Fleischer <archlinux at cryptocrack dot de>
# Contributor: Hugo Doria <hugo@archlinux.org>
# Contributor: Kessia 'even' Pinheiro <kessiapinheiro at gmail.com>
# Contributor: dorphell <dorphell@archlinux.org>
# Contributor: Gregor Ibic <gregor.ibic@intelicom.si>
# Contributor: Netboy3

pkgname=snort
_pkgname=snort3
_openappid=26425
pkgver=3.1.50.0
pkgrel=1
pkgdesc='A lightweight network IDS /IPS with OpenAppID support.'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64' 'arm')
url='https://www.snort.org'
license=('GPL')
depends=('gperftools' 'hwloc' 'hyperscan' 'libdaq' 'libdnet' 'libmnl' 'libpcap' 'libunwind' 'luajit' 'lz4' 'openssl' 'pcre' 'pulledpork' 'xz' 'zlib')
makedepends=('cmake' 'pkgconf')
backup=('etc/snort/snort.lua'
        'etc/snort/snort_defaults.lua'
        'etc/snort/local.lua'
        'etc/snort/homenet.lua'
        'etc/snort/rules/local.rules'
        'etc/snort/rules/snort.rules'
        'etc/snort/lists/default.blocklist'
        'etc/snort/lists/default.allowlist'
        'etc/logrotate.d/snort')
install='snort.install'
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/snort3/snort3/archive/refs/tags/${pkgver}.tar.gz"
  "snort-openappid-${_openappid}.tar.gz::https://snort.org/downloads/openappid/${_openappid}"
  'local.lua'
  'snort.logrotate'
  'snort.sysusers'
  'snort.tmpfiles'
  'snort.service')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  ./configure_cmake.sh --prefix=/usr --enable-tcmalloc --with-daq-libraries=/usr/lib/daq/ --disable-static-daq
  make -C build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make -C build DESTDIR="${pkgdir}" install

  mv "${pkgdir}"{/usr,}/etc
  install -D -m644 "${srcdir}"/local.lua "${pkgdir}"/etc/snort
  install -D -m644 "${srcdir}"/snort.logrotate "${pkgdir}"/etc/logrotate.d/snort
  install -D -m644 "${srcdir}"/snort.tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/snort.conf
  install -D -m644 "${srcdir}"/snort.sysusers "${pkgdir}"/usr/lib/sysusers.d/snort.conf
  install -D -m644 "${srcdir}"/snort.service "${pkgdir}"/usr/lib/systemd/system/snort.service
  install -D -m644 /dev/null "${pkgdir}"/etc/snort/rules/snort.rules
  install -D -m644 /dev/null "${pkgdir}"/etc/snort/lists/default.blocklist
  install -D -m644 /dev/null "${pkgdir}"/etc/snort/lists/default.allowlist
  echo "HOME_NET = [[ 10.0.0.0/8 172.16.0.0/12 192.168.0.0/16 ]]" > "${pkgdir}"/etc/snort/homenet.lua
  echo -e '#pulledpork will put rules here in snort.rules\n#alert icmp any any -> any any ( msg:"ICMP Traffic Detected"; sid:10000001; metadata:policy security-ips alert; )' >"${pkgdir}"/etc/snort/rules/local.rules
  chmod 0644 "${pkgdir}"/etc/snort/{homenet.lua,rules/{local,snort}.rules}

  # OpenAppID files
  install -d -m755 "${pkgdir}"/usr/lib/openappid/custom/{libs,lua,port}
  cp -a --no-preserve=ownership -t "${pkgdir}"/usr/lib/openappid/ "${srcdir}"/odp

}

sha256sums=('983497578587c5b1291994608fef70700d7f251461e79ac897751bba57cc56b5'
            '8513877ce2264bb22119d911c2cf11f73735c866e2ca0d061c35eef6740d51f9'
            '2e60695f90e7cb3f1faad5aa90b3ad351f2175268fb31d6fa9601f11fca22d1c'
            'a8a7684a676da5cd55c2b5ab012dac3d14c5a6c62f6e37c4913ba1dbe506088e'
            'ae3245c5de527fb487c459f2f4a9c78803ae6341e9c81b9a404277679cdee051'
            'bc4a02d184601faba5cd0f6cb454097a3b04a0c8fe56f5f8b36d24513484faa2'
            'e1ff858e2cb062d76f72757746c4f87410151b06221255ca827b7279fee0d5df')
