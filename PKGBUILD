# Maintainer: Vladimir Krivopalov <vladimir.krivopalov@gmail.com>

# Main package information
pkgname=scylla-git
pkgver=r12846.3077416ec
pkgrel=1
pkgdesc="Scylla is an open source NoSQL drop-in replacement for Apache Cassandra with fast throughput and low latency"
arch=('x86_64')
url="http://www.scylladb.com/"
license=('AGPL')

# Dependencies
depends=('hwloc' 'systemd' 'collectd' 'python-yaml' 'python2-yaml' 'python-urwid'
            'pciutils' 'python-pyparsing' 'python2-requests' 'util-linux'
            'python-pyudev' 'python-setuptools' 'boost' 'boost-libs')

makedepends=('git' 'gcc' 'antlr3-cpp-headers-git' 'libyaml' 'yaml-cpp'
                'lz4' 'zlib' 'snappy' 'jsoncpp' 'gnutls' 'ninja'
                'ragel' 'libaio' 'crypto++' 'xfsprogs' 'jre8-openjdk-headless'
                'numactl' 'libpciaccess' 'libxml2' 'thrift-0.10.0' 'lksctp-tools'
                'protobuf' 'libunwind' 'systemtap' 'make' 'libtool' 'cmake')
# Relations
provides=('scylla')
conflicts=('scylla')

# Others
backup=('etc/scylla/scylla.yaml'
        'etc/scylla/cassandra-rackdc.properties'
        'etc/scylla.d/housekeeping.cfg'
        'etc/sysconfig/scylla-server'
        'etc/collectd.d/scylla.conf'
        'etc/scylla.d/cpuset.conf'
        'etc/scylla.d/dev-mode.conf'
        'etc/scylla.d/io.conf')
install=.install
changelog=
source=('git+https://github.com/scylladb/scylla.git'
    'git+https://github.com/scylladb/scylla-ami.git'
    'git+https://github.com/scylladb/scylla-swagger-ui.git'
    'git+https://github.com/scylladb/seastar.git'
    'git+https://github.com/scylladb/fmt.git'
    'git+https://github.com/scylladb/dpdk.git'
    'git+https://github.com/scylladb/c-ares.git'
)

md5sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/${pkgname%-git}"
    git submodule update --init --recursive
}

build() {
    cd "$srcdir/${pkgname%-git}"
    # Workaround for https://lists.archlinux.org/pipermail/arch-dev-public/2013-April/024776.html
    # Since DPDK doesn't build well with _FORTIFY_SOURCE=2 
    unset CPPFLAGS
    ./configure.py --mode=release --enable-dpdk
    ninja -j`nproc --all` build/release/scylla build/release/iotune
    cp dist/common/systemd/scylla-server.service.in build/scylla-server.service
    sed -i -e "s#@@SYSCONFDIR@@#${_sysconfdir}/sysconfig#g" build/scylla-server.service
}

# Directory prefixes
_bindir=/usr/bin
_sysconfdir=/etc
_sysctldir=/etc/sysctl.d
_docdir=/usr/share/doc
_unitdir=/usr/lib/systemd/system
_libdir=/usr/lib/scylla
_sharedstatedir=/var/lib

package() {
    mkdir -p "${pkgdir}${_bindir}"
    mkdir -p "${pkgdir}${_sysconfdir}/sysconfig/"
    mkdir -p "${pkgdir}${_sysconfdir}/security/limits.d/"
    mkdir -p "${pkgdir}${_sysconfdir}/collectd.d/"
    mkdir -p "${pkgdir}${_sysconfdir}/scylla/"
    mkdir -p "${pkgdir}${_sysconfdir}/scylla.d/"
    mkdir -p "${pkgdir}${_sysctldir}"
    mkdir -p "${pkgdir}${_docdir}/scylla/"
    mkdir -p "${pkgdir}${_unitdir}"
    mkdir -p "${pkgdir}${_libdir}"

    cd "$srcdir/${pkgname%-git}"
    install -m644 dist/common/sysconfig/scylla-server "${pkgdir}${_sysconfdir}/sysconfig/"
    install -m644 dist/common/limits.d/scylla.conf "${pkgdir}${_sysconfdir}/security/limits.d/"
    install -m644 dist/common/collectd.d/scylla.conf "${pkgdir}${_sysconfdir}/collectd.d/"
    install -m644 dist/common/scylla.d/*.conf "${pkgdir}${_sysconfdir}/scylla.d/"
    install -m644 dist/common/sysctl.d/*.conf "${pkgdir}${_sysctldir}"
    install -d -m755 "${pkgdir}${_sysconfdir}/scylla"
    install -m644 conf/scylla.yaml "${pkgdir}${_sysconfdir}/scylla/"
    install -m644 conf/cassandra-rackdc.properties "${pkgdir}${_sysconfdir}/scylla/"
    install -m644 build/*.service "${pkgdir}${_unitdir}"
    install -m644 dist/common/systemd/*.service  "${pkgdir}${_unitdir}"
    install -m644 dist/common/systemd/*.timer "${pkgdir}${_unitdir}"
    install -m755 dist/common/scripts/* "${pkgdir}${_libdir}"
    install -m755 seastar/scripts/posix_net_conf.sh  "${pkgdir}${_libdir}"
    install -m755 seastar/scripts/perftune.py  "${pkgdir}${_libdir}"
    install -m755 seastar/dpdk/usertools/dpdk-devbind.py "${pkgdir}${_libdir}"
    install -m755 build/release/scylla "${pkgdir}${_bindir}"
    install -m755 build/release/iotune "${pkgdir}${_bindir}"
    install -m755 dist/common/bin/scyllatop "${pkgdir}${_bindir}"
    install -m755 scylla-blocktune "${pkgdir}${_libdir}"
    install -m755 scylla-housekeeping "${pkgdir}${_libdir}"
    install -m644 conf/housekeeping.cfg "${pkgdir}${_sysconfdir}/scylla.d/"
    install -d -m755 "${pkgdir}${_docdir}/scylla"
    install -m644 README.md "${pkgdir}${_docdir}/scylla/"
    install -m644 README-DPDK.md "${pkgdir}${_docdir}/scylla/"
    install -m644 NOTICE.txt "${pkgdir}${_docdir}/scylla/"
    install -m644 ORIGIN "${pkgdir}${_docdir}/scylla/"
    install -d -m755 "${pkgdir}${_docdir}/scylla/licenses/"
    install -m644 licenses/* "${pkgdir}${_docdir}/scylla/licenses/"
    install -d -m755 "${pkgdir}${_sharedstatedir}/scylla/"
    install -d -m755 "${pkgdir}${_sharedstatedir}/scylla/data"
    install -d -m755 "${pkgdir}${_sharedstatedir}/scylla/commitlog"
    install -d -m755 "${pkgdir}${_sharedstatedir}/scylla/coredump"
    install -d -m755 "${pkgdir}${_sharedstatedir}/scylla-housekeeping"
    install -d -m755 "${pkgdir}${_libdir}/swagger-ui"
    cp -r swagger-ui/dist "${pkgdir}${_libdir}/swagger-ui"
    install -d -m755 "${pkgdir}${_libdir}/api"
    cp -r api/api-doc "${pkgdir}${_libdir}/api"
    cp -r tools/scyllatop "${pkgdir}${_libdir}/scyllatop"
    cp -r scylla-housekeeping "${pkgdir}${_libdir}/scylla-housekeeping"
    cp -P dist/common/sbin/*  "${pkgdir}${_bindir}"
}
