# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor : xav <xav at ethertricks dot net>

set -u
pkgname='sflowtool'
pkgver='3.37'
pkgrel='1'
pkgdesc='CLI utility and scripts for analyzing sFlow data'
arch=('i686' 'x86_64')
url='http://www.inmon.com/technology/sflowTools.php'
license=('custom')
optdepends=('perl: scripts support')
makedepends=('automake')
#_verwatch=('http://www.inmon.com/technology/sflowTools.php' ".*/${pkgname}-\([0-9\.]\+\)\.tar\.gz" 'l')
_giturl="https://github.com/sflow/${pkgname}"
_verwatch=("${_giturl}/releases" "${_giturl#*github.com}/archive/v\(.*\)\.tar\.gz" 'l')
source=("${pkgname}-${pkgver}.tar.gz::${_giturl}/archive/v${pkgver}.tar.gz"
        #"http://www.inmon.com/bin/${pkgname}-${pkgver}.tar.gz"
        'http://www.inmon.com/bin/sflowutils.tar.gz'
        'LICENSE')
sha256sums=('5435f767e6379bf8994b2260e0c5feba434fc55cbe2ceee5036cd8b07be74385'
            '45f6a0f96bdb6a1780694b9a4ef9bbd2fd719b9f7f3355c6af1427631b311d56'
            '863b86b7a4fc7632cfc3f9ead7e76f6e7751aca8b64030ff97b3b46f991c6482')

prepare() {
  set -u
  cd "${pkgname}-${pkgver}"
  sed -i -e 's:^#!/bin/awk:#!/usr/bin/awk:g' '../utils/ipTrafficMatrix' '../utils/ipTopTalkers'
  if [ ! -s 'configure' ]; then
    aclocal
    autoconf
    automake --add-missing
  fi
  ./configure --prefix='/usr' --mandir='/usr/share/man'
  set +u
}

build() {
  set -u
  cd "${pkgname}-${pkgver}"
  make -s # -j "$(nproc)" # not big enough for nproc
  set +u
}

package(){
  set -u
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -d "${pkgdir}/usr/share/${pkgname}"/{utils,contrib}
  cp -pR "${srcdir}/utils" "${srcdir}/contrib" "${pkgdir}/usr/share/${pkgname}/"
  install -Dpm644 "${srcdir}/README" -t "${pkgdir}/usr/share/${pkgname}/"
  install -Dpm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  sed -i -e 's:\r::g' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  set +u
  # Ensure there are no forbidden paths. Place at the end of package() and comment out as you find or need exceptions. (git-aurcheck)
  ! test -d "${pkgdir}/bin" || { echo "Line ${LINENO} Forbidden: /bin"; false; }
  ! test -d "${pkgdir}/sbin" || { echo "Line ${LINENO} Forbidden: /sbin"; false; }
  ! test -d "${pkgdir}/lib" || { echo "Line ${LINENO} Forbidden: /lib"; false; }
  ! test -d "${pkgdir}/share" || { echo "Line ${LINENO} Forbidden: /share"; false; }
  ! test -d "${pkgdir}/usr/sbin" || { echo "Line ${LINENO} Forbidden: /usr/sbin"; false; }
  ! test -d "${pkgdir}/usr/local" || { echo "Line ${LINENO} Forbidden: /usr/local"; false; }
  ! grep -lr "/sbin" "${pkgdir}" || { echo "Line ${LINENO} Forbidden: /sbin"; false; }
  ! grep -lr "/usr/tmp" "${pkgdir}" || { echo "Line ${LINENO} Forbidden: /usr/tmp"; false; }
  # Don't know how to fix these.
  #! grep -lr "/usr/local" "${pkgdir}" || { echo "Line ${LINENO} Forbidden: /usr/local"; false; }
  # The one left is related to the above problem
  #! pcre2grep -Ilr "(?<!usr)/bin" "${pkgdir}" || { echo "Line ${LINENO} Forbidden: /bin"; false; }
}

set +u
