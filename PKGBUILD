# Maintainer: Andrew Kozik <andrewkoz at live dot com>

_pkgbasename=net-snmp
pkgname=lib32-${_pkgbasename}
pkgver=5.9.5.2
pkgrel=1
pkgdesc='A suite of applications used to implement SNMP v1, SNMP v2c and SNMP v3 using both IPv4 and IPv6 (32-bit)'
arch=('x86_64')
url='https://www.net-snmp.org/'
license=('LicenseRef-Net-SNMP')  # COPYING lists 14 BSD-like notices (CMU/UCD, NAI, Sun, ...); not a single SPDX id
depends=(
  "${_pkgbasename}"
  'lib32-gcc-libs'
  'lib32-glibc'
  'lib32-libnl'
  'lib32-lm_sensors'
  'lib32-openssl'
  'lib32-pciutils'
)
makedepends=('git')
provides=('libnetsnmpagent.so'
          'libnetsnmphelpers.so'
          'libnetsnmpmibs.so'
          'libnetsnmp.so'
          'libnetsnmptrapd.so'
          'libsnmp.so')
options=('!emptydirs' '!makeflags')
source=("git+https://github.com/net-snmp/net-snmp.git#tag=v${pkgver}"
        'net-snmp-5.9.5.2-under-linking.patch')
sha512sums=('782892a7db0ca84ffb3d89f1568d93169bf8cef6d5790783fd2c8f72be2a5d22a0cb0964400046b3e8705a3efba365b7610672aee12e77693d391dc2861d311e'
            'f722c4dd01c9b098e15dd895156755992a3f719c1c044352bab16cc8d612e9ce3bcc1a5a44a26365600b3c6b0abe1fe1ee9209aef557a0cde1884ff2d14fbd0d')
validpgpkeys=('27CAA4A32E371383A33ED0587D5F9576E0F81533'
              '6E6718AEF1EB5C65C32D1B2A356BC0B552D53CAB'
              '8AAA779B597B405BBC329B6376CF47B8A77C5329'
              'D0F8F495DA6160C44EFFBF10F07B9D2DACB19FD6')  # Net-SNMP Administrators

# The old pcre2 backports (d3e95c8, 346b6f8, e5aadf1) conflict on v5.9.5.2 and are dropped; 7fc7edf (Linux 6.7
# /proc/net/snmp) is already in v5.9.5.2. v5.9.5.2 only supports pcre1 (pcre.h/pcre_exec), so pcre is
# disabled with --without-pcre (same as the official net-snmp binaries, which don't link libpcre).
_backports=(
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

  # https://github.com/net-snmp/net-snmp/issues/434 (patch from Debian/official net-snmp): libnetsnmptrapd under-linking
  patch -Np1 -i ../net-snmp-5.9.5.2-under-linking.patch

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
    --without-pcre \
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
