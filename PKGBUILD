# Maintainer: Vladimir Krivopalov <vladimir.krivopalov@gmail.com>

# Main package information
pkgname=scylla-tools
pkgver=2.1.1
pkgrel=1
pkgdesc="Tools to be used with ScyllaDB, such as cqlsh, nodetool and others"
arch=('any')
url="http://www.scylladb.com/"
license=('Apache')

# Dependencies
depends=('scylla-jmx' 'jre8-openjdk-headless' 'python2' 'python2-yaml')

makedepends=('apache-ant' 'jdk8-openjdk')

# Relations
provides=('scylla-tools')
conflicts=('cassandra')

changelog=
source=("git+https://github.com/scylladb/scylla-tools-java.git#tag=scylla-${pkgver}")
md5sums=('SKIP')

build() {
    cd "$srcdir/${pkgname}-java"
    env LANG=en_US.UTF-8 ant jar
    sed -i -e 's@#!/usr/bin/env python$@#!/usr/bin/env python2@' tools/bin/filter_cassandra_attributes.py
}

# Directory prefixes
_bindir=/usr/bin
_sysconfdir=/etc
_datadir=/usr/share

# Other macros
origin_version=3.0.8

package() {
    mkdir -p "${pkgdir}${_bindir}"
    mkdir -p "${pkgdir}${_sysconfdir}/bash_completion.d"
    mkdir -p "${pkgdir}${_datadir}"

    cd "$srcdir/${pkgname}-java"
    cd pylib && python2 setup.py install --no-compile --root "${pkgdir}"
    cd -

    install -m644 dist/common/nodetool-completion "${pkgdir}${_sysconfdir}/bash_completion.d"
    install -d -m755 "${pkgdir}${_sysconfdir}/scylla/cassandra"
    install -m644 conf/cassandra-env.sh "${pkgdir}${_sysconfdir}/scylla/cassandra/"
    install -m644 conf/logback.xml "${pkgdir}${_sysconfdir}/scylla/cassandra/"
    install -m644 conf/logback-tools.xml "${pkgdir}${_sysconfdir}/scylla/cassandra/"
    install -m644 conf/jvm.options "${pkgdir}${_sysconfdir}/scylla/cassandra/"
    install -d -m755 "${pkgdir}${_datadir}/scylla/cassandra/"
    install -m644 dist/common/cassandra.in.sh "${pkgdir}${_datadir}/scylla/cassandra/"
    install -m755 bin/nodetool "${pkgdir}${_bindir}"
    install -m755 bin/sstableloader "${pkgdir}${_bindir}"
    install -m755 bin/scylla-sstableloader "${pkgdir}${_bindir}"
    install -m755 bin/cqlsh "${pkgdir}${_bindir}"
    install -m755 bin/cqlsh.py "${pkgdir}${_bindir}"
    install -m755 tools/bin/filter_cassandra_attributes.py "${pkgdir}${_bindir}"
    install -m755 tools/bin/cassandra_attributes.py "${pkgdir}${_bindir}"
    install -m755 tools/bin/cassandra-stress "${pkgdir}${_bindir}"
    install -m755 tools/bin/cassandra-stressd "${pkgdir}${_bindir}"
    install -m755 tools/bin/sstabledump "${pkgdir}${_bindir}"
    install -m755 tools/bin/sstablelevelreset "${pkgdir}${_bindir}"
    install -m755 tools/bin/sstablemetadata "${pkgdir}${_bindir}"
    install -m755 tools/bin/sstablerepairedset "${pkgdir}${_bindir}"
    install -d -m755 "${pkgdir}${_datadir}/scylla/cassandra/lib/"
    install -m644 lib/*.jar "${pkgdir}${_datadir}/scylla/cassandra/lib/"
    install -m644 lib/*.zip "${pkgdir}${_datadir}/scylla/cassandra/lib/"
    install -d -m755 "${pkgdir}${_docdir}/scylla/cassandra/licenses/"
    install -m644 lib/licenses/* "${pkgdir}${_docdir}/scylla/cassandra/licenses/"

    install -m644 "build/apache-cassandra-${origin_version}-SNAPSHOT.jar" "${pkgdir}${_datadir}/scylla/cassandra"
    install -m644 "build/apache-cassandra-thrift-${origin_version}-SNAPSHOT.jar" "${pkgdir}${_datadir}/scylla/cassandra"
    install -m644 "build/scylla-tools-${origin_version}-SNAPSHOT.jar" "${pkgdir}${_datadir}/scylla/cassandra"
    install -m644 build/tools/lib/stress.jar "${pkgdir}${_datadir}/scylla/cassandra"

    cd ${pkgdir}
    ln -s "${_datadir}/scylla/cassandra/apache-cassandra-${origin_version}-SNAPSHOT.jar" "${pkgdir}${_datadir}/scylla/cassandra/apache-cassandra.jar"
}
