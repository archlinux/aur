# Mantainer: Pellegrino Prevete <cGVsbGVncmlub3ByZXZldGVAZ21haWwuY29tCg== | base -d>

pkgbase=audit
pkgname=('audit' 'python2-audit')
pkgver=2.8.5
pkgrel=7
pkgdesc='Userspace components of the audit framework'
url='https://people.redhat.com/sgrubb/audit'
arch=('x86_64')
makedepends=('krb5' 'libcap-ng' 'libldap' 'swig' 'linux-headers' 'python2')
license=('GPL')
options=('emptydirs')
source=(${pkgbase}-${pkgver}.tar.gz::https://people.redhat.com/sgrubb/audit/${pkgbase}-${pkgver}.tar.gz)
sha512sums=('7d416aaa21c1a167f8e911ca82aecbaba804424f3243f505066c43ecc4a62a34feb2c27555e99d3268608404793dccca0f828c63670e3aa816016fb493f8174a')

prepare() {
  cd ${pkgbase}-${pkgver}
  sed 's|/var/run/auditd.pid|/run/auditd.pid|' -i init.d/auditd.service
}

build() {
  cd ${pkgbase}-${pkgver}
  export PYTHON=/usr/bin/python2
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib/audit \
    --enable-gssapi-krb5=yes \
    --enable-systemd=yes \
    --with-libcap-ng=yes \
    --without-python3
  make
  [ -n "${SOURCE_DATE_EPOCH}" ] && touch -h -d @$SOURCE_DATE_EPOCH bindings/swig/python/audit.py
}

package_audit() {
  depends=('krb5' 'libcap-ng')
  provides=('libaudit.so' 'libauparse.so')
  backup=(
    etc/libaudit.conf
    etc/audit/audit-stop.rules
    etc/audit/auditd.conf
    etc/audisp/audispd.conf
    etc/audisp/audisp-remote.conf
    etc/audisp/zos-remote.conf
    etc/audisp/plugins.d/af_unix.conf
    etc/audisp/plugins.d/audispd-zos-remote.conf
    etc/audisp/plugins.d/au-remote.conf
    etc/audisp/plugins.d/syslog.conf
  )

  cd ${pkgbase}-${pkgver}
  make DESTDIR="${pkgdir}" INSTALL='install -p' install

  cd "${pkgdir}"
  install -d -m 0700 var/log/audit
  rm -rf etc/rc.d \
    etc/sysconfig \
    usr/lib/audit \
    usr/lib/python*

  sed -ri 's|/sbin|/usr/bin|' \
    etc/audit/*.conf \
    etc/audisp/plugins.d/*.conf \
    usr/lib/systemd/system/auditd.service

  chmod 644 usr/lib/systemd/system/auditd.service
}

package_python2-audit() {
  depends=('python2' 'audit')
  pkgdesc+=' (python 2.X bindings)'
  export PYTHON=/usr/bin/python2
  cd ${pkgbase}-${pkgver}
  make -C bindings DESTDIR="${pkgdir}" INSTALL='install -p' install
}

# vim: ts=2 sw=2 et:
