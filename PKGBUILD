# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Alex "grevus" Lobtsov <alex@lobtsov.com>

# This is built and tested for command line usage. Any other usage such as httpd is unknown.

# There are two source variations.
#   From http://pear.phing.info/ come the small versions which are about 500KB.
#   From https://www.phing.info/ comes the large versions which range from 3MB to 23MB.
#   The names are the same.
#   All versions are missing essential build components like configure.m4 and build.xml.
# Version 2.8.2 contains the vendor folder, dropped in later versions. Size drops from 23MB to 5MB.
# Even using old sources and knowing there are two variations, I can't tell that the original AUR php-phing version ever built.

# At this time building the phar file from the sources seems impossible.
# Many build files are missing. The vendor folder can be found in 2.8.2 tarball but this isn't enough.
# I see zend in the vendor folders so building the phar may not ever be fully open source.

# Won't compile all of phpoffice. That's probably why they recommend composer, so they can install custom editions.
# phpoffice depends on phing + Phing_d51PearPkg2Task
# ... which depends on pear-pear-packagefilemanager2
# ... which depends on a file that isn't found.

# Fortunately this works no worse than the phar version in php-phing-bin.

set -u
_pkgname='phing'
pkgname="php-${_pkgname}"
pkgver='2.17.4'
pkgrel='1'
pkgdesc='PHP project build system based on Apache Ant'
arch=('any')
#url='http://pear.phing.info'
#url='https://github.com/phingofficial/phing'
url='https://www.phing.info/'
license=('LGPL')
depends=('php')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
options=('!strip')
_verwatch=('http://pear.phing.info/feed.xml' '\s\+<title>phing \([0-9\.]\+\) (stable)</title>.*' 'f')
_srcdir="phing-${pkgver}"
source=("${_srcdir}.tgz::https://github.com/phingofficial/phing/archive/${pkgver}.tar.gz")
#source=("phing-large-${pkgver}.tgz::http://www.phing.info/get/${_pkgname}-${pkgver}.tgz")
# Trying to compile phpoffice. This would become an addon. php-phing-foo
#source+=('git://github.com/domain51/Phing_d51PearPkg2Task.git')
md5sums=('9eb60c57580418c13fe09f38da1b78e0')
sha256sums=('2bac33efd4bb2f2beb24eb95f19903064658a4ad0207e4851c49b0b01fc91aec')

prepare() {
  set -u
  # Rearrange the the small version to look like the large version
  if [ -d 'classes' ]; then
    local _dirs=(*/)
    mkdir "${_pkgname}-${pkgver}"
    mv "${_dirs[@]}" "${_pkgname}-${pkgver}"
    find -maxdepth 1 -type 'f' -exec mv '{}' "${_pkgname}-${pkgver}" ';'
    cd "${_pkgname}-${pkgver}"
    mv 'etc' 'classes/phing/'
  else
    cd "${_pkgname}-${pkgver}"
    mkdir -p '.classes/phing'
    mv * '.classes/phing'
    mv '.classes' 'classes'
    mv 'classes/phing'/{bin,*.md,LICENSE} .
  fi
  # They aren't executable without a hashbang!
  find -type f -exec chmod 644 '{}' ';'

  #local IFS=$'\n'
  #sed -i -e 's:phing/:/usr/share/webapps/phing/:g' `grep -rl 'phing/' 'classes'` 'bin/phing.php'

  # This was the previous build. I can't find any source version (small,large,git,svn) that has the required configure.m4 or Makefile to allow this to work.
  #phpize
  #./configure --prefix=/usr
  set +u
}

build() {
  set -u
  #make
  set +u
}

package() {
  set -u
  cd "${_pkgname}-${pkgver}"
  #make INSTALL_ROOT="${pkgdir}" install

  # While it's rude to enable phar.so systemwide, it's necessary because phing calls many things that use phar.
  # However it's not necessary because phing calls many other things that require other modules. You must provide for those so provide for phar too.
  #install -Dpm0644 <(echo $'extension=phar.so') "${pkgdir}/etc/php/conf.d/phar.ini"
  install -d "${pkgdir}/usr/share/webapps/phing/"
  mv classes "${pkgdir}/usr/share/webapps/phing/"
  install -Dpm644 'bin/phing.php' "${pkgdir}/usr/share/webapps/phing/bin/phing.phar"

  # Someday, an addon
  #mv "${srcdir}/Phing_d51PearPkg2Task/src/phing/tasks/ext"/* "${pkgdir}/usr/share/webapps/phing/classes/phing/tasks/ext/"

  # Command line launchers
  local _phing="#!/usr/bin/bash
# Installed by ${_pkgname}-${pkgver} PKGBUILD from Arch Linux AUR
# https://aur.archlinux.org/
%1
php -d 'open_basedir=NULL' -d 'phar.readonly=0' -d 'extension=phar.so' %2 \\
  '/usr/share/webapps/${_pkgname}/bin/${_pkgname}.phar' \"\$@\"
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
