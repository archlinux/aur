# Maintainer: D. Can Celasun <dcelasun[at]gmail[dot]com>
pkgname=voltdb
pkgver=5.2.2
pkgrel=1
pkgdesc="An in-memory database with pre-compiled Java stored procedures (Community Edition)"
arch=('i686' 'x86_64')
url="http://voltdb.com/"
license=('AGPL3')
depends=('python2' 'java-environment')
makedepends=('apache-ant' 'python2-virtualenv')
conflicts=('voltdb-enterprise')
source=("https://github.com/${pkgname}/${pkgname}/archive/${pkgname}-${pkgver}.tar.gz")
md5sums=('d7ec786c8bda25c5d47b32850daf30fe')

build() {
  cd "${srcdir}"/${pkgname}-${pkgname}-${pkgver}
  
  # python2 stuff
  /usr/bin/virtualenv2 --no-site-packages voltdb_env
  source voltdb_env/bin/activate
  
  find -name '*.py' -exec sed -i 's|^#!/usr/bin/env python\s*$|#!/usr/bin/env python2|' {} \;

  ant clean
  ant -Djmemcheck=NO_MEMCHECK dist
}

package() {
    mkdir -p "${pkgdir}/opt/voltdb"
    mkdir -p "${pkgdir}/usr/bin"
    
    tar -xzvf "${srcdir}"/${pkgname}-${pkgname}-${pkgver}/obj/release/${pkgname}-${pkgver}.tar.gz -C "${pkgdir}"/opt/${pkgname}
    
    mv "${pkgdir}"/opt/${pkgname}/${pkgname}-${pkgver}/* "${pkgdir}"/opt/${pkgname}
    
    rm -rf "${pkgdir}"/opt/${pkgname}/${pkgname}-${pkgver}
    
    cd "${pkgdir}"/opt/${pkgname}
    find -name '*.py' -exec sed -i 's|^#!/usr/bin/env python\s*$|#!/usr/bin/env python2|' {} \;
    find bin -exec sed -i 's|^#!/usr/bin/env python\s*$|#!/usr/bin/env python2|' {} \;
    
    ln -s /opt/voltdb/bin/csvloader "${pkgdir}"/usr/bin/csvloader
    ln -s /opt/voltdb/bin/jdbcloader "${pkgdir}"/usr/bin/jdbcloader
    ln -s /opt/voltdb/bin/kafkaloader "${pkgdir}"/usr/bin/kafkaloader
    ln -s /opt/voltdb/bin/sqlcmd "${pkgdir}"/usr/bin/sqlcmd
    ln -s /opt/voltdb/bin/voltadmin "${pkgdir}"/usr/bin/voltadmin
    ln -s /opt/voltdb/bin/voltcompiler "${pkgdir}"/usr/bin/voltcompiler
    ln -s /opt/voltdb/bin/voltdb "${pkgdir}"/usr/bin/voltdb
}
