# Maintainer: D. Can Celasun <dcelasun[at]gmail[dot]com>
pkgname=voltdb
pkgver=5.8
pkgrel=1
pkgdesc="An in-memory database with pre-compiled Java stored procedures (Community Edition)"
arch=('i686' 'x86_64')
url="http://voltdb.com/"
license=('AGPL3')
depends=('python2' 'java-environment-jdk=7')
makedepends=('apache-ant' 'python2-virtualenv')
conflicts=('voltdb-enterprise')
source=("https://github.com/${pkgname}/${pkgname}/archive/${pkgname}-${pkgver}.tar.gz")
md5sums=('582a176d368c92db6b348f933edd7748')

build() {
  cd "${srcdir}"/${pkgname}-${pkgname}-${pkgver}
  
  # python2 stuff
  /usr/bin/virtualenv2 --no-site-packages voltdb_env
  source voltdb_env/bin/activate
  
  find . -type f -exec sed -i 's|^#!/usr/bin/env python\s*$|#!/usr/bin/env python2|' {} \;
  find . -type f -exec sed -i 's|^#!/usr/bin/python\s*$|#!/usr/bin/python2|' {} \;

  export PATH=/usr/lib/jvm/java-7-jdk/jre/bin:/usr/lib/jvm/java-7-jdk/jre/bin:$PATH
  
  sed -i 's/-Werror//g' "${srcdir}"/voltdb-voltdb-${pkgver}/build.py

  ant clean
  ant -Djmemcheck=NO_MEMCHECK dist
}

package() {
    mkdir -p "${pkgdir}/opt/voltdb"
    mkdir -p "${pkgdir}/usr/bin"

    mv "${srcdir}"/${pkgname}-${pkgname}-${pkgver}/{bin,bundles,doc,examples,lib,third_party,tools,voltdb,LICENSE,README,version.txt} "${pkgdir}"/opt/${pkgname}
    mv "${srcdir}"/${pkgname}-${pkgname}-${pkgver}/obj/release/*.tar.gz "${pkgdir}"/opt/${pkgname}/voltdb

    cd "${pkgdir}"/opt/${pkgname}
    find -name '*.py' -exec sed -i 's|^#!/usr/bin/env python\s*$|#!/usr/bin/env python2|' {} \;
    find -name '*.pyc' -type f -delete
    
    ln -s /opt/voltdb/bin/csvloader "${pkgdir}"/usr/bin/csvloader
    ln -s /opt/voltdb/bin/jdbcloader "${pkgdir}"/usr/bin/jdbcloader
    ln -s /opt/voltdb/bin/kafkaloader "${pkgdir}"/usr/bin/kafkaloader
    ln -s /opt/voltdb/bin/rabbitmqloader "${pkgdir}"/usr/bin/rabbitmqloader
    ln -s /opt/voltdb/bin/snapshotconvert "${pkgdir}"/usr/bin/snapshotconvert
    ln -s /opt/voltdb/bin/snapshotverifier "${pkgdir}"/usr/bin/snapshotverifier
    ln -s /opt/voltdb/bin/sqlcmd "${pkgdir}"/usr/bin/sqlcmd
    ln -s /opt/voltdb/bin/voltadmin "${pkgdir}"/usr/bin/voltadmin
    ln -s /opt/voltdb/bin/voltcompiler "${pkgdir}"/usr/bin/voltcompiler
    ln -s /opt/voltdb/bin/voltdb "${pkgdir}"/usr/bin/voltdb
}
