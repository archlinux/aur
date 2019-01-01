# Maintainer: Anthony Ruhier <anthony.ruhier@gmail.com>
# net-snmp with lmsensors compiled

_pkgname=net-snmp
pkgname=net-snmp-lmsensors
pkgver=5.8
pkgrel=2
pkgdesc="A suite of applications used to implement SNMP v1, SNMP v2c and SNMP v3 using both IPv4 and IPv6, with lm-sensors support"
arch=('i686' 'x86_64')
url="http://www.net-snmp.org/"
license=('BSD')
depends=('libnl' 'libnsl' 'openssl' 'pciutils')
makedepends=('python2-setuptools' 'lm_sensors')
optdepends=('perl-term-readkey: for snmpcheck application'
            'perl-tk: for snmpcheck and tkmib applications'
            'python2: for the python modules')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
options=('!emptydirs' '!makeflags')
source=(http://downloads.sourceforge.net/${_pkgname}/${_pkgname}-${pkgver}.tar.gz{,.asc}
        snmpd.service snmptrapd.service)
sha1sums=('78f70731df9dcdb13fe8f60eb7d80d7583da4d2c'
          'SKIP'
          '84e32c54d32e6b608747054e04a3ddfe6d6638cc'
          '0244e91c7baa0abebfb5c0560e8ce04c966c5992')
validpgpkeys=('8AAA779B597B405BBC329B6376CF47B8A77C5329'
              '27CAA4A32E371383A33ED0587D5F9576E0F81533'
              'D0F8F495DA6160C44EFFBF10F07B9D2DACB19FD6')  # Net-SNMP Administrators

prepare() {
  cd ${_pkgname}-${pkgver}
  autoreconf -i
}

build() {
  cd ${_pkgname}-${pkgver}
  PYTHONPROG=/usr/bin/python2 ./configure --prefix=/usr \
    --sysconfdir=/etc --sbindir=/usr/bin \
    --mandir=/usr/share/man \
    --enable-ucd-snmp-compatibility \
    --enable-ipv6 \
    --with-python-modules \
    --with-default-snmp-version="3" \
    --with-sys-contact="root@localhost" \
    --with-sys-location="Unknown" \
    --with-logfile="/var/log/snmpd.log" \
    --with-mib-modules="host misc/ipfwacc ucd-snmp/diskio tunnel ucd-snmp/dlmod ucd-snmp/lmsensorsMib" \
    --with-ldflags="-lsensors" \
    --with-persistent-directory="/var/net-snmp"
  make NETSNMP_DONT_CHECK_VERSION=1
}

package() {
  cd ${_pkgname}-${pkgver}
  sed -i -e "s:install --basedir=\$\$dir:install --basedir=\$\$dir --root=${pkgdir}:" Makefile
  make DESTDIR="${pkgdir}" INSTALL_PREFIX="${pkgdir}" INSTALLDIRS=vendor install
  install -D -m644 "${srcdir}/snmpd.service" "${pkgdir}/usr/lib/systemd/system/snmpd.service"
  install -D -m644 "${srcdir}/snmptrapd.service" "${pkgdir}/usr/lib/systemd/system/snmptrapd.service"
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
