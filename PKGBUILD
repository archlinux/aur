# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor : xav <xav at ethertricks dot net>

set -u
pkgname='sflowtool'
pkgver='5.08'
pkgrel='1'
pkgdesc='CLI utility and scripts for analyzing sFlow data'
arch=('i686' 'x86_64')
url='http://www.inmon.com/technology/sflowTools.php'
license=('custom')
optdepends=('perl: scripts support')
makedepends=('automake')
#_verwatch=('http://www.inmon.com/technology/sflowTools.php' ".*/${pkgname}-\([0-9\.]\+\)\.tar\.gz" 'l')
_giturl="https://github.com/sflow/${pkgname}"
#_verwatch=("${_giturl}/releases" "${_giturl#*github.com}/archive/v\(.*\)\.tar\.gz" 'l') #rss
_verwatch=("${_giturl}/releases.atom" '\s\+<title>sflowtool\sversion\s\([^<]\+\)</title>.*' 'f') #rss
source=("${pkgname}-${pkgver}.tar.gz::${_giturl}/archive/v${pkgver}.tar.gz"
        #"http://www.inmon.com/bin/${pkgname}-${pkgver}.tar.gz"
        'http://www.inmon.com/bin/sflowutils.tar.gz'
        'LICENSE')
md5sums=('582acf5322694b74b0a13d6cbc0f6a1c'
         '644ef83ca05c9446ebce60302a03a33b'
         'd3dc05048a11e4ca3b5a7940d0552d07')
sha256sums=('70a1930e1a99077c0cf92d4205c744aaeaadb794927bae8b98463075432b4a8a'
            '45f6a0f96bdb6a1780694b9a4ef9bbd2fd719b9f7f3355c6af1427631b311d56'
            '863b86b7a4fc7632cfc3f9ead7e76f6e7751aca8b64030ff97b3b46f991c6482')

build() {
  set -u
  cd "${pkgname}-${pkgver}"
  if [ ! -s 'Makefile' ]; then
    sed -e 's:^#!/bin/awk:#!/usr/bin/awk:g' -i '../utils/ipTrafficMatrix' '../utils/ipTopTalkers'
    if [ ! -s 'configure' ]; then
      aclocal
      autoconf
      automake --add-missing
    fi
    ./configure --prefix='/usr' --mandir='/usr/share/man'
  fi
  make -s
  set +u
}

package(){
  set -u
  cd "${pkgname}-${pkgver}"
  make -j1 DESTDIR="${pkgdir}" install
  install -d "${pkgdir}/usr/share/${pkgname}"/{utils,contrib}
  cp -pR "${srcdir}/utils" "${srcdir}/contrib" "${pkgdir}/usr/share/${pkgname}/"
  install -Dpm644 "${srcdir}/README" -t "${pkgdir}/usr/share/${pkgname}/"
  install -Dpm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  sed -e 's:\r::g' -i "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  set +u
}

set +u
