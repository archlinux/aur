# Maintainer: Pellegrino Prevete <cGVsbGVncmlub3ByZXZldGVAZ21haWwuY29tCg== | base -d>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Christian Rebischke <Chris.Rebischke@archlinux.org>
# Contributor: Daniel Micay <danielmicay@gmail.com>
# Contributor: <kang@insecure.ws>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Connor Behan <connor.behan@gmail.com>
# Contributor: henning mueller <henning@orgizm.net>

_pkgbase=audit
pkgbase="python2-${_pkgbase}"
pkgname="python2-$_pkgbase"
pkgver=3.0.8
pkgrel=1
pkgdesc='Userspace components of the audit framework'
url='https://people.redhat.com/sgrubb/audit'
arch=(x86_64)
makedepends=(glibc krb5 libcap-ng libldap linux-headers python2 swig )
license=(GPL2 LGPL2.1)
options=(debug emptydirs)
source=("https://people.redhat.com/sgrubb/${_pkgbase}/${_pkgbase}-${pkgver}.tar.gz"
        $_pkgbase-3.0.8-config_paths.patch)
sha512sums=('8379bf425d68381d182300e628e42de8460d2f3e15b2395e10880f94b9989656852a50a9bece75b632ec8a04c40c9e666ff4c9d6b25ace3a8f50d2011506afab'
            'bc699123f810abcf9300728bf61d7fcfcc83677b75fbeb713fb24cc11b2f9edf687661aab70766acde7c3c41c6a62f8e0a54cdfb49d1c7ce2246b67fbe3feec5')
b2sums=('38a35a7540e608127cfc54a2de2cb12df8c29e778799ca53318824c84565a67b7ea131f9bba455fa469ce9139a27908738f571a6e383ce9a3274f70c09d27ec7'
        '50be1b4f76ace20d8d14b4c57a9bb69daa3da35fd654aca8730bc287682fe38f1c1917b37469fb087daf9f309ffc15cca15f54166ece0a055f540c2604778fc6')

prepare() {
  # replace the use of /sbin with /usr/bin in configs
  patch -Np1 -d $_pkgbase-$pkgver -i ../$_pkgbase-3.0.8-config_paths.patch
}

build() {
  cd $_pkgbase-$pkgver
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
  # prevent excessive overlinking due to libtool
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
  [ -n "${SOURCE_DATE_EPOCH}" ] && touch -h -d @$SOURCE_DATE_EPOCH bindings/swig/python/audit.py
}

package_python2-audit() {
  depends=('python2' "${_pkgbase}")
  backup=(
    etc/libaudit.conf
    etc/audit/audit-stop.rules
    etc/audit/auditd.conf
    etc/audit/audisp-remote.conf
    etc/audit/zos-remote.conf
    etc/audit/plugins.d/af_unix.conf
    etc/audit/plugins.d/au-remote.conf
    etc/audit/plugins.d/audispd-zos-remote.conf
    etc/audit/plugins.d/syslog.conf
  )
  pkgdesc+=' (python 2.X bindings)'
  export PYTHON=/usr/bin/python2
  cd audit-${pkgver}
  make -C bindings DESTDIR="${pkgdir}" INSTALL='install -p' install
  rm -rf ${pkgdir}/usr/lib/python3*
  rm -rf ${pkgdir}/usr/lib/golang
}


# vim: ts=2 sw=2 et:
