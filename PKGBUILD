_pkgbasename=net-snmp
pkgname=lib32-${_pkgbasename}
pkgver=5.8
pkgrel=1
pkgdesc="A suite of applications used to implement SNMP v1, SNMP v2c and SNMP v3 using both IPv4 and IPv6"
arch=('x86_64')
url="http://www.net-snmp.org/"
license=('BSD')
depends=("${_pkgbasename}" 'lib32-openssl' 'lib32-libnl' 'lib32-pciutils')
makedepends=('python2-setuptools')
options=('!emptydirs' '!makeflags')
source=(http://downloads.sourceforge.net/${_pkgbasename}/${_pkgbasename}-${pkgver}.tar.gz{,.asc})
sha256sums=('97dc25077257680815de44e34128d365c76bd839' 'SKIP')
validpgpkeys=('8AAA779B597B405BBC329B6376CF47B8A77C5329'
              '27CAA4A32E371383A33ED0587D5F9576E0F81533'
              'D0F8F495DA6160C44EFFBF10F07B9D2DACB19FD6')  # Net-SNMP Administrators

prepare() {
  cd ${_pkgbasename}-${pkgver}
  autoreconf -i
}

build() {
  cd ${_pkgbasename}-${pkgver}
  CFLAGS="-m32" CPPFLAGS="-m32" PYTHONPROG=/usr/bin/python2 ./configure --prefix=/usr \
     --libdir=/usr/lib32 \
    --enable-ucd-snmp-compatibility \
    --enable-ipv6 \
    --disable-embedded-perl \
    --disable-perl-cc-checks \
    --without-perl-modules \
    --without-python-modules \
    --with-default-snmp-version="3" \
    --with-sys-contact="root@localhost" \
    --with-sys-location="Unknown" \
    --with-logfile="/var/log/snmpd.log" \
    --with-mib-modules="host misc/ipfwacc ucd-snmp/diskio tunnel ucd-snmp/dlmod" \
    --with-persistent-directory="/var/net-snmp"
  make NETSNMP_DONT_CHECK_VERSION=1
}

package() {
  cd ${_pkgbasename}-${pkgver}
  sed -i -e "s:install --basedir=\$\$dir:install --basedir=\$\$dir --root=${pkgdir}:" Makefile
  make DESTDIR="${pkgdir}" INSTALL_PREFIX="${pkgdir}" INSTALLDIRS=vendor install
  rm -rf "${pkgdir}"/usr/{include,bin,sbin,share}
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
