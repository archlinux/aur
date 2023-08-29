# Maintainer: Pellegrino Prevete (dvorak) <cGVsbGVncmlub3ByZXZldGVAZ21haWwuY29tCg== | base -d>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Christian Rebischke <Chris.Rebischke@archlinux.org>
# Contributor: Daniel Micay <danielmicay@gmail.com>
# Contributor: <kang@insecure.ws>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Connor Behan <connor.behan@gmail.com>
# Contributor: henning mueller <henning@orgizm.net>

_py="python2"
_pkg=audit
pkgname="${_py}-${_pkg}"
pkgver=3.0.8
pkgrel=1
pkgdesc="Userspace components of the ${_pkg} framework"
_ns="sgrubb"
url="https://people.redhat.com/${_ns}/${_pkg}"
arch=(x86_64)
makedepends=(
  glibc
  krb5
  libcap-ng
  libldap
  linux-headers
  "${_py}"
  swig )
license=(GPL2 LGPL2.1)
options=(debug emptydirs)
source=("${url}/${_pkg}-${pkgver}.tar.gz"
        "${_pkg}-${pkgver}-config_paths.patch")
sha512sums=(
  '8379bf425d68381d182300e628e42de8460d2f3e15b2395e10880f94b9989656852a50a9bece75b632ec8a04c40c9e666ff4c9d6b25ace3a8f50d2011506afab'
  'bc699123f810abcf9300728bf61d7fcfcc83677b75fbeb713fb24cc11b2f9edf687661aab70766acde7c3c41c6a62f8e0a54cdfb49d1c7ce2246b67fbe3feec5')
b2sums=(
  '38a35a7540e608127cfc54a2de2cb12df8c29e778799ca53318824c84565a67b7ea131f9bba455fa469ce9139a27908738f571a6e383ce9a3274f70c09d27ec7'
  '50be1b4f76ace20d8d14b4c57a9bb69daa3da35fd654aca8730bc287682fe38f1c1917b37469fb087daf9f309ffc15cca15f54166ece0a055f540c2604778fc6')

prepare() {
  # replace the use of /sbin with /usr/bin in configs
  patch -Np1 \
        -d "${_pkg}-${pkgver}" \
        -i "../${_pkg}-${pkgver}-config_paths.patch"
  # https://github.com/swig/swig/issues/1699
  sed -i "20i %immutable audit_rule_data::buf;" \
         "${_pkg}-${pkgver}/bindings/swig/src/auditswig.i"
}

build() {
  local _configure_opts=(
    --prefix=/usr
    --sbindir=/usr/bin
    --sysconfdir=/etc
    "--libexecdir=/usr/lib/${_pkg}"
    --enable-gssapi-krb5=yes
    --enable-systemd=yes
    --with-libcap-ng=yes
    --without-python3)

  cd "${_pkg}-${pkgver}"
  export PYTHON="/usr/bin/${_py}"
  ./configure "${_configure_opts[@]}"
  # prevent excessive overlinking due to libtool
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
  [ -n "${SOURCE_DATE_EPOCH}" ] && \
    touch -h -d @$SOURCE_DATE_EPOCH \
                "bindings/swig/python/${_pkg}.py"
}

package_python2-audit() {
  depends=(
    "${_py}"
    "${_pkg}")
  backup=(
    "etc/lib${_pkg}.conf"
    "etc/${_pkg}/${_pkg}-stop.rules"
    "etc/${_pkg}/${_pkg}d.conf"
    "etc/${_pkg}/audisp-remote.conf"
    "etc/${_pkg}/zos-remote.conf"
    "etc/${_pkg}/plugins.d/af_unix.conf"
    "etc/${_pkg}/plugins.d/au-remote.conf"
    "etc/${_pkg}/plugins.d/audispd-zos-remote.conf"
    "etc/${_pkg}/plugins.d/syslog.conf"
  )
  pkgdesc+=' (python 2.X bindings)'
  export PYTHON="/usr/bin/${_py}"
  cd "${_pkg}-${pkgver}"
  make -C bindings \
       DESTDIR="${pkgdir}" \
       INSTALL='install -p' \
       install
  rm -rf "${pkgdir}/usr/lib/python3"*
  rm -rf "${pkgdir}/usr/lib/golang"
}

# vim: ts=2 sw=2 et:
