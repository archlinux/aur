# Mantainer: Pellegrino Prevete <cGVsbGVncmlub3ByZXZldGVAZ21haWwuY29tCg== | base -d>

pkgname='python2-audit'
pkgver=2.8.5
pkgrel=8
pkgdesc='Userspace components of the audit framework'
url='https://people.redhat.com/sgrubb/audit'
arch=('x86_64')
makedepends=('krb5' 'libcap-ng' 'libldap' 'swig' 'linux-headers' 'python2')
license=('GPL')
options=('emptydirs')
source=(audit-${pkgver}.tar.gz::https://people.redhat.com/sgrubb/audit/audit-${pkgver}.tar.gz
'fno-common.patch'
'gcc10.patch')
sha512sums=('7d416aaa21c1a167f8e911ca82aecbaba804424f3243f505066c43ecc4a62a34feb2c27555e99d3268608404793dccca0f828c63670e3aa816016fb493f8174a'
'4d491ef7dacb23049993a87be7ddbb89657472df3082bb43f68b867d88804cdd74a543a7e0be4d9ad2554ee76def6982ee14a69224a2f4c67f66ab550239e6fe'
'78e32c05b6896d37bacf0938954fbce7486a528dabd55421f1715438fe489171f9157059050abdcb3f673258aa28b4a11f643ddb7824f3499a195dbbe634f101')

prepare() {
  cd audit-${pkgver}
  sed 's|/var/run/auditd.pid|/run/auditd.pid|' -i init.d/auditd.service

  # https://github.com/linux-audit/audit-userspace/issues/123
  #patch --forward --strip=1 --input="${srcdir}/gcc10.patch"

  # https://bugs.gentoo.org/show_bug.cgi\?id\=706734
  patch --forward --strip=1 --input="${srcdir}/fno-common.patch"
}

build() {
  cd audit-${pkgver}
  export PYTHON=/usr/bin/python2
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib/audit \
    --enable-gssapi-krb5=yes \
    --enable-systemd=yes \
    --with-libcap-ng=yes \
    #--without-python3
  make
  [ -n "${SOURCE_DATE_EPOCH}" ] && touch -h -d @$SOURCE_DATE_EPOCH bindings/swig/python/audit.py
}

package_python2-audit() {
  depends=('python2' 'audit')
  pkgdesc+=' (python 2.X bindings)'
  export PYTHON=/usr/bin/python2
  cd audit-${pkgver}
  make -C bindings DESTDIR="${pkgdir}" INSTALL='install -p' install
  rm -rf ${pkgdir}/usr/lib/python3*
  rm -rf ${pkgdir}/usr/lib/golang
}


# vim: ts=2 sw=2 et:
