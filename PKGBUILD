# Maintainer: Andrew Kozik <andrewkoz at live dot com>

_pkgbasename=net-snmp
pkgname=lib32-${_pkgbasename}
pkgver=5.9.4
pkgrel=3
pkgdesc='A suite of applications used to implement SNMP v1, SNMP v2c and SNMP v3 using both IPv4 and IPv6 (32-bit)'
arch=('x86_64')
url='http://www.net-snmp.org/'
license=('BSD')
depends=(${_pkgbasename} 'lib32-libnsl' 'lib32-libpcap' 'lib32-lm_sensors' 'lib32-openssl' 'lib32-pciutils' 'lib32-pcre' 'lib32-pcre2')
makedepends=('git' 'python-setuptools')
provides=('libnetsnmpagent.so'
          'libnetsnmphelpers.so'
          'libnetsnmpmibs.so'
          'libnetsnmp.so'
          'libnetsnmptrapd.so'
          'libsnmp.so')
options=('!emptydirs' '!makeflags')
source=("git+https://github.com/net-snmp/net-snmp.git#tag=v${pkgver}")
sha512sums=('c88ff9d81a683dbe5ff2c34c1e8c9e579b67aef1d74153275a1dc4ff7991cdc1611d01acc2d5691ae3cf6acd980807fb1a5309f91470ae2f67fbbc175b3e34e1')
validpgpkeys=('27CAA4A32E371383A33ED0587D5F9576E0F81533'
              '6E6718AEF1EB5C65C32D1B2A356BC0B552D53CAB'
              '8AAA779B597B405BBC329B6376CF47B8A77C5329'
              'D0F8F495DA6160C44EFFBF10F07B9D2DACB19FD6')  # Net-SNMP Administrators

_backports=(
  # add pcre2 support
  'd3e95c87b32397815f6d5bcfc844259f2552697a'
  # Improve pcre2 support
  '346b6f8959513320e5b674fd670c49ba2cd43af5'
  # if-mib/data_access/interface.c: plug a leak with pcre2
  'e5aadf1e78c624a8e4147d4b70a7795497a50e73'

  # Add Linux 6.7 compatibility parsing /proc/net/snmp
  '7fc7edf676c527a0cfb661f9000a3d22738cf8e6'
)

_reverts=(
)

prepare() {
  cd "${_pkgbasename}"

  local _c _l
  for _c in "${_backports[@]}"; do
    if [[ "${_c}" == *..* ]]; then _l='--reverse'; else _l='--max-count=1'; fi
    git log --oneline "${_l}" "${_c}"
    git cherry-pick --mainline 1 --no-commit "${_c}"
  done
  for _c in "${_reverts[@]}"; do
    if [[ "${_c}" == *..* ]]; then _l='--reverse'; else _l='--max-count=1'; fi
    git log --oneline "${_l}" "${_c}"
    git revert --mainline 1 --no-commit "${_c}"
  done

  autoreconf -i
}

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG="i686-pc-linux-gnu-pkg-config"

  cd "${_pkgbasename}"

  ./configure \
    --host=i686-pc-linux-gnu \
    --prefix='/usr' \
    --libdir='/usr/lib32' \
    --sysconfdir='/etc' \
    --sbindir='/usr/bin' \
    --mandir='/usr/share/man' \
    --enable-blumenthal-aes \
    --enable-ipv6 \
    --enable-ucd-snmp-compatibility \
    --disable-embedded-perl \
    --disable-perl-cc-checks \
    --without-perl-modules \
    --without-python-modules \
    --with-default-snmp-version='3' \
    --with-sys-contact='root@localhost' \
    --with-sys-location='Unknown' \
    --with-logfile='/var/log/snmpd.log' \
    --with-mib-modules='host misc/ipfwacc ucd-snmp/diskio tunnel ucd-snmp/dlmod ucd-snmp/lmsensorsMib' \
    --with-persistent-directory='/var/net-snmp'
  make NETSNMP_DONT_CHECK_VERSION=1
}

package() {
  cd "${_pkgbasename}"

  sed -i -e "s:install --basedir=\$\$dir:install --basedir=\$\$dir --root=${pkgdir}:" Makefile
  make DESTDIR="${pkgdir}" INSTALL_PREFIX="${pkgdir}" INSTALLDIRS=vendor install
  # Remove conflicting files
  rm -rf "${pkgdir}"/{etc,usr/{share,lib,include,bin}}
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
