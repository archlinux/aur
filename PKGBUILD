# Maintainer: Vladimir Krivopalov <vladimir.krivopalov@gmail.com>

# Main package information
pkgname=scylla-jmx
pkgver=2.0.2
pkgrel=1
pkgdesc="Scylla JMX server implements the Apache Cassandra JMX interface for compatibility with tooling such as nodetool."
arch=('any')
url="http://www.scylladb.com/"
license=('AGPL')

# Dependencies
depends=('scylla' 'jre8-openjdk-headless')
makedepends=('maven' 'systemd' 'jdk8-openjdk')

# Relations
provides=('scylla-jmx')

install=.install
changelog=
source=("git+https://github.com/scylladb/scylla-jmx.git#tag=scylla-${pkgver}") 
md5sums=('SKIP')

build() {
    cd "$srcdir/${pkgname}"
    mvn -B install
    mkdir build
    cp dist/common/systemd/scylla-jmx.service.in build/scylla-jmx.service
}

# Directory prefixes
_sysconfdir=/etc
_unitdir=/usr/lib/systemd/system
_sharedstatedir=/var/lib

package() {
    mkdir -p "${pkgdir}${_sysconfdir}/sysconfig/"
    mkdir -p "${pkgdir}${_unitdir}"

    cd "$srcdir/${pkgname}"
    install -m644 dist/common/sysconfig/scylla-jmx "${pkgdir}${_sysconfdir}/sysconfig/"
    install -m644 build/*.service "${pkgdir}${_unitdir}"
    install -d -m755 "${pkgdir}${_sharedstatedir}/scylla/"
    install -d -m755 "${pkgdir}${_sharedstatedir}/scylla/jmx/"
    install -d -m755 "${pkgdir}${_sharedstatedir}/scylla/jmx/symlinks/"
    install -m644 target/scylla-jmx-1.0.jar "${pkgdir}${_sharedstatedir}/scylla/jmx/"
    install -m755 scripts/scylla-jmx "${pkgdir}${_sharedstatedir}/scylla/jmx/"
    ln -sf /usr/bin/java "${pkgdir}${_sharedstatedir}/scylla/jmx/symlinks/scylla-jmx"
}
