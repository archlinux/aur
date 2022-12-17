# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# From AUR phing
# Contributor: Benjamin A. Shelton <zancarius@gmail.com>
# Source: https://github.com/zancarius/archlinux-pkgbuilds

# I couldn't get AUR phing to work. php_basedir error. I fixed that and came up with a better way to enable extension phar without enabling it systemwide.

set -u
_pkgname='phing'
pkgname="php-${_pkgname}-bin"
pkgver='2.17.4'
pkgrel='1'
pkgdesc='PHP project build system based on Apache Ant'
arch=('any')
#url='http://pear.phing.info'
#url='https://github.com/phingofficial/phing'
url='https://www.phing.info/'
license=('LGPL')
depends=('php')
provides=("${_pkgname}=${pkgver}" "php-${_pkgname}=${pkgver}")
conflicts=("${_pkgname}" "php-${_pkgname}")
options=('!strip')
_verwatch=('http://pear.phing.info/feed.xml' '\s\+<title>phing \([0-9\.]\+\) (stable)</title>.*' 'f')
source=("${url}/get/${_pkgname}-${pkgver}.phar")
sha256sums=('dd066c9794099055f9678468bccb70d842c2a7c665e31899b0806291a909e3be')

package() {
  set -u
  # While it's rude to enable phar.so systemwide, it's necessary because phing calls many things that use phar.
  # However it's not necessary because phing calls many other things that require other modules. You must provide for those so provide for phar too.
  #install -Dpm0644 <(echo $'extension=phar.so') "${pkgdir}/etc/php/conf.d/phar.ini"
  install -Dpm0755 "${srcdir}/${_pkgname}-${pkgver}.phar" "${pkgdir}/usr/bin/${_pkgname}.phar"

  # Command line launchers
  local _phing="#!/usr/bin/bash
# Installed by ${_pkgname}-${pkgver} PKGBUILD from Arch Linux AUR
# https://aur.archlinux.org/
%1
php -d 'open_basedir=NULL' -d 'phar.readonly=0' -d 'extension=phar.so' %2 \\
  '/usr/bin/${_pkgname}.phar' \"\$@\"
"

  local _phing1="${_phing//%1/}" # Almost as much trouble as The Cat in the Hat Thing1 and Thing2
        _phing1="${_phing1// %2/}"

  local _cr=$'\n'
  local _phing2="${_phing//%1/extracmd=\"\$1\"${_cr}shift}"
        _phing2="${_phing2// %2/ \$\{extracmd\}}"

  # Command line launchers
  install -d "${pkgdir}/usr/bin/"
  echo "${_phing1}" > "${pkgdir}/usr/bin/${_pkgname}"; chmod 755 "${pkgdir}/usr/bin/${_pkgname}"
  echo "${_phing2}" > "${pkgdir}/usr/bin/${_pkgname}.sh"; chmod 755 "${pkgdir}/usr/bin/${_pkgname}.sh"

  set +u
}
set +u
