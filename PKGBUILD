# Maintainer: D. Can Celasun <dcelasun[at]gmail[dot]com>
pkgname=voltdb-enterprise
_pkgname=voltdb-ent
pkgver=5.2.2
pkgrel=1
pkgdesc="An in-memory database with pre-compiled Java stored procedures (Enterprise Edition)"
arch=('i686' 'x86_64')
url="http://voltdb.com/"
license=('proprietary')
depends=('python2' 'java-environment')
conflicts=('voltdb')
source=(LICENSE)
install=${pkgname}.install
md5sums=('3215b6fd0649bdc4d988b7b934139851')

_vpkg=LINUX-voltdb-ent-${pkgver}.tar.gz

build() {
  msg "You need a full copy of the program in order to install it"
  msg "Searching for ${_vpkg} in dir: \"$startdir\""
  pkgpath="$startdir"
  if [[ ! -f "${pkgpath}/${_vpkg}" ]]; then
    error "Package not found, please type absolute path to ${_vpkg} (/home/joe):"
    read pkgpath
    if [[ ! -f "${pkgpath}/${_vpkg}" ]]; then
      error "Unable to package." && return 1
    fi
  fi
  msg "Found package, unpacking..."
  tar xf "${pkgpath}/${_vpkg}" -C "${srcdir}"


  cd "${srcdir}"/${_pkgname}-${pkgver}
  
  find -name '*.py' -exec sed -i 's|^#!/usr/bin/env python\s*$|#!/usr/bin/env python2|' {} \;
  find bin/* -exec sed -i 's|^#!/usr/bin/env python\s*$|#!/usr/bin/env python2|' {} \;
}

package() {
    mkdir -p "${pkgdir}/opt/voltdb"
    mkdir -p "${pkgdir}/usr/bin"
    mkdir -p "${pkgdir}/usr/share/licenses/voltdb"
    
    mv "${srcdir}"/${_pkgname}-${pkgver}/* "${pkgdir}"/opt/voltdb
    
    ln -s /opt/voltdb/bin/csvloader "${pkgdir}"/usr/bin/csvloader
    ln -s /opt/voltdb/bin/dragent "${pkgdir}"/usr/bin/dragent
    ln -s /opt/voltdb/bin/jdbcloader "${pkgdir}"/usr/bin/jdbcloader
    ln -s /opt/voltdb/bin/kafkaloader "${pkgdir}"/usr/bin/kafkaloader
    ln -s /opt/voltdb/bin/sqlcmd "${pkgdir}"/usr/bin/sqlcmd
    ln -s /opt/voltdb/bin/voltadmin "${pkgdir}"/usr/bin/voltadmin
    ln -s /opt/voltdb/bin/voltcompiler "${pkgdir}"/usr/bin/voltcompiler
    ln -s /opt/voltdb/bin/voltdb "${pkgdir}"/usr/bin/voltdb
    ln -s /opt/voltdb/bin/voltdb3 "${pkgdir}"/usr/bin/voltdb3
    
    install -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/voltdb/LICENSE"
}
