# $Id$
# Maintainer: Jamin Collins <jamin.collins@gmail.com>
# Contributor: Ido Rosen <ido@kernel.org>
# Contributor: Evan Teitelman <teitelmanevan@gmail.com>
# Contributor: Eric Renfro <erenfro@gmail.com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Marti Raudsepp <marti@juffo.org>
# Contributor: Sandman <the0sandman@hotmail.com>
# Contributor: raw <spam@rw23.de>
# Contributor: Dave Simons <miouhpi@gmail.com>
# Contributor: Dominik Hannen <cantares1+github@gmail.com>
# Contributor: David Anderson <dave@natulte.net>
# Contributor: Joe Julian <me@joejulian.name>
#

pkgbase='ceph-git'
pkgname=('ceph-git' 'ceph-libs-git' 'ceph-mgr-git')
pkgver=17.0.0.12069.gab6b68efe47
pkgrel=1
epoch=1
pkgdesc='Distributed, fault-tolerant storage platform delivering object, block, and file system'
arch=('x86_64')
url='http://ceph.com/'
license=('GPL')
makedepends=(
    'bash' 'bc' 'boost' 'boost-libs' 'bzip2' 'c-ares' 'cmake' 'coreutils' 'coffeescript'
    'cpio' 'cryptsetup' 'cunit' 'curl' 'cython' 'expat'
    'fcgi' 'fontconfig' 'fuse2' 'fuse3' 'fmt' 'gcc' 'gcc-libs' 'git' 'glibc' 'gmock' 'gnutls'
    'gperf' 'gperftools' 'gptfdisk' 'gtest' 'hwloc' 'inetutils' 'java-runtime'
    'jq' 'jre11-openjdk-headless' 'junit' 'keyutils' 'leveldb' 'libaio'
    'libatomic_ops' 'libcap' 'libcap-ng' 'libcroco' 'libcurl-compat'
    'libedit' 'libgudev' 'libnl' 'librabbitmq-c' 'libtool' 'util-linux'
    'libuv' 'libxml2' 'librdkafka' 'libpciaccess' 'lsb-release' 'lz4' 'ncurses'
    'nss' 'numactl' 'oath-toolkit' 'openssl' 'parted' 'pcre' 'pcre2' 'pkgconf' 'protobuf'
    'procps-ng' 'python-astroid' 'python-attrs' 'python-bcrypt'
    'python-cheroot' 'python-cherrypy' 'python-coverage' 'python-dateutil'
    'python-elasticsearch' 'python-flask' 'python-flask-restful'
    'python-google-api-python-client' 'python-google-auth'
    'python-google-auth-httplib2' 'python-grpcio' 'python-isort'
    'python-jinja' 'python-lazy-object-proxy' 'python-mccabe'
    'python-isodate' 'python-defusedxml' 'python-pkgconfig' 'python-protobuf'
    'python-lxml' 'python-xmlsec' 'python-yaml'
    'python-more-itertools' 'python-numpy' 'python-pbr' 'python-pecan'
    'python-pip' 'python-pluggy' 'python-portend' 'python-prettytable'
    'python-prometheus_client' 'python-py' 'python-pycparser'
    'python-pyjwt' 'python-pyopenssl' 'python-pytz' 'python-requests'
    'python-routes' 'python-scikit-learn' 'python-scipy'
    'python-setuptools' 'python-six' 'python-sphinx' 'python-tempora'
    'python-virtualenv' 'python-werkzeug' 'python-wrapt' 'rabbitmq'
    'sed' 'snappy' 'socat' 'systemd' 'systemd-libs' 'valgrind'
    'xfsprogs' 'xmlstarlet' 'xmlsec' 'xxhash' 'yaml-cpp' 'yasm' 'zlib'
    'ninja' 'lua' 'thrift'
)
options=('!emptydirs')
source=("git+https://github.com/ceph/ceph.git"
        "ceph.sysusers"
        "ceph-osd@.service"
        "ceph-mon@.service"
        "ceph-mds@.service")
sha512sums=('SKIP'
            '4354001c1abd9a0c385ba7bd529e3638fb6660b6a88d4e49706d4ac21c81b8e829303a20fb5445730bdac18c4865efb10bc809c1cd56d743c12aa9a52e160049'
            '39acff4ecc8ad445fa7a2ace9e5ea1ab52cc1fcceb2a91e6a6e80554782751cc6d692e436b1932847f8369ac5a50d60604f988cc5266857023c3233da3ff2a58'
            'bd5e4e80f2d4503598177bce9a9939434f9015f7e6582708d55a1552f022dbf9185bd99623d281d622bf61a129d4ef818615dd5a573adff1d800b4c5a960364e'
            'bfaea76402f4e136a0ee2088647380dcf895922a7693e8b10c2ab178265ca2b9622f87eced61d6fa6d929a31c92db2eb5ca62add53d349bb3b083aa1356c8663')

# -fno-plt causes linker errors (undefined reference to internal methods)
# https://tracker.ceph.com/issues/40745
# similar issue: https://bugs.archlinux.org/task/54845
# https://github.com/intel/media-driver/commit/d95d8f7ab7ac94a2e0f4ee6a4b4794898dc2d3b7
# as of today (2019-07-12) the upstream maintainers do not consider this a bug in their code
# (IMHO rightfully so) and thus we strip the option here
export CFLAGS="${CFLAGS/-fno-plt/}"
export CXXFLAGS="${CXXFLAGS/-fno-plt/}"

pkgver() {
    cd "${srcdir}/${pkgbase%%-git}"
    #printf "%s" "$(git describe --long --tags | sed 's/v//; s/-/./g')"
    git describe --long --tags | sed 's/^v//; s/-/./g'
}

prepare() {
    cd "${srcdir}/${pkgbase%%-git}"
    git submodule update --init --recursive
}

build() {
    cd "${srcdir}/${pkgbase%%-git}"

    export CFLAGS+=" ${CPPFLAGS}"
    export CXXFLAGS+=" ${CPPFLAGS}"
    export PYTHON_VERSION="$(python --version | awk '{print $2}')"
    export PYTHON_INCLUDE_DIR="$(python -c "from sysconfig import get_path; print(get_path('include'))")"
    export CMAKE_WARN_UNUSED_CLI=no

    # list of options w/ defaults: cmake -LH src/ceph
    cmake \
        -B build \
        -GNinja \
        -DCMAKE_BUILD_TYPE='RelWithDebInfo' \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_SYSCONFDIR=/etc \
        -DCMAKE_INSTALL_SBINDIR=/usr/bin \
        -DCMAKE_INSTALL_LIBDIR=/usr/lib \
        -DCEPH_SYSTEMD_ENV_DIR=/etc/default \
        -DCMAKE_INSTALL_LIBEXECDIR=/usr/lib \
        -DCMAKE_VERBOSE_MAKEFILE=ON \
        -DENABLE_GIT_VERSION=ON \
        -DWITH_PYTHON3="${PYTHON_VERSION}" \
        -DWITH_BABELTRACE=OFF \
        -DWITH_LTTNG=OFF \
        -DWITH_OPENLDAP=OFF \
        -DWITH_RDMA=OFF \
        -DWITH_OCF=OFF \
        -DWITH_DPDK=OFF \
        -DWITH_SPDK=OFF \
        -DWITH_CEPHFS=ON \
        -DWITH_CEPHFS_JAVA=ON \
        -DWITH_CEPHFS_SHELL=ON \
        -DWITH_FUSE=ON \
        -DWITH_LZ4=ON \
        -DWITH_XFS=ON \
        -DWITH_MGR=ON \
        -DWITH_MGR_DASHBOARD_FRONTEND=ON \
        -DDASHBOARD_FRONTEND_LANGS="ALL" \
        -DWITH_RADOSGW=ON \
        -DWITH_RADOSGW_BEAST_OPENSSL=ON \
        -DWITH_RADOSGW_AMQP_ENDPOINT=OFF \
        -DWITH_SYSTEMD=ON \
        -DWITH_SYSTEM_BOOST=ON \
        -DWITH_SYSTEM_GTEST=OFF \
        -DWITH_SYSTEM_NPM=OFF \
        -DENABLE_SHARED=ON \
        -DWITH_TESTS=ON \
        -Wno-dev

    cd build
    ninja
}

package_ceph-libs-git() {
    depends=('boost-libs' 'curl' 'glibc' 'keyutils' 'libutil-linux' 'bzip2' 'lz4' 'nss'
             'oath-toolkit' 'python' 'snappy' 'systemd-libs' 'fmt')
    provides=('ceph-libs')
    conflicts=('ceph-libs')

    cd "${srcdir}/${pkgbase%%-git}/build"

    # main install
    DESTDIR="${pkgdir}" ninja install

    # remove stuff that goes into the ceph and ceph-mgr packages
    rm -rf "${pkgdir}"/usr/lib/{ceph/mgr,systemd,sysusers.d,tmpfiles.d}
    rm -rf "${pkgdir}/usr/share"
    rm -rf "${pkgdir}/usr/sbin"
    rm -rf "${pkgdir}/usr/bin"
    rm -rf "${pkgdir}/etc"
    rm -rf "${pkgdir}/var"
}

package_ceph-git() {
    depends=("ceph-libs-git=${pkgver}-${pkgrel}"
             'boost-libs' 'curl' 'fuse2' 'fuse3' 'fmt' 'glibc' 'gperftools' 'java-runtime'
             'keyutils' 'leveldb' 'libaio' 'libutil-linux' 'librdkafka'
             'lsb-release' 'ncurses'
             'nss' 'oath-toolkit' 'python' 'python-bcrypt' 'python-setuptools'
             'python-prettytable' 'python-cmd2' 'python-dateutil' 'snappy' 'sudo' 'systemd-libs'
             'python-flask' 'python-pecan' 'python-pyopenssl' 'python-requests' 'python-werkzeug' 'xfsprogs'
             'python-yaml' 'python-pyaml')
    provides=('ceph')
    conflicts=('ceph')

    cd "${srcdir}/${pkgbase%%-git}/build"

    # main install
    DESTDIR="${pkgdir}" ninja install

    # fix sbin dir (cmake opt seems to have no effect)
    mv "${pkgdir}"/usr/sbin/* "${pkgdir}/usr/bin/"
    rm -rf "${pkgdir}/usr/sbin"

    # remove stuff that is in the ceph-libs package
    find "${pkgdir}/usr/lib" -maxdepth 1 -type f -delete
    find "${pkgdir}/usr/lib" -maxdepth 1 -type l -delete
    find "${pkgdir}/usr/lib/ceph" -maxdepth 1 -type f -delete
    find "${pkgdir}/usr/lib/ceph" -maxdepth 1 -type l -delete
    # could possibly just rm -rf "${pkgdir}"/usr/lib/ceph
    rm -rf "${pkgdir}"/usr/lib/{ceph/{compressor,crypto,denc,erasure-code,librbd},rados-classes}
    rm -rf "${pkgdir}"/usr/lib/python*
    rm -rf "${pkgdir}/usr/include"

    # remove stuff that is in the ceph-mgr package
    rm -rf "${pkgdir}"/usr/{bin/ceph-mgr,share/ceph/mgr,lib/systemd/system/ceph-mgr*}

    # remove _test_ binaries from the package, not needed
    find "${pkgdir}/usr/bin" -maxdepth 1 -type f -iname 'ceph_test_*' -delete

    # install tmpfiles.d and sysusers.d stuff
    install -Dm644 "${srcdir}/${pkgbase%%-git}/systemd/ceph.tmpfiles.d" \
        "${pkgdir}/usr/lib/tmpfiles.d/${pkgbase}.conf"
    install -Dm644 "${srcdir}/ceph.sysusers" \
        "${pkgdir}/usr/lib/sysusers.d/${pkgbase}.conf"

    __common

    # fix bash completions path
    install -d -m 755 "${pkgdir}/usr/share/bash-completion"
    mv "${pkgdir}"/{etc/bash_completion.d,usr/share/bash-completion/completions}

    # fix EnvironmentFile location in systemd service files
    sed -i 's|/etc/sysconfig/|/etc/conf.d/|g' "${pkgdir}"/usr/lib/systemd/system/*.service

    # prepare some paths and set correct permissions
    install -D -d -m750 -o   0 -g 340 "${pkgdir}/etc/ceph"
    install -D -d -m750 -o 340 -g 340 "${pkgdir}/var/log/ceph"
    install -D -d -m750 -o 340 -g 340 "${pkgdir}/var/lib/ceph"
    install -D -d -m750 -o 340 -g 340 "${pkgdir}/var/lib/ceph/bootstrap-mds"
    install -D -d -m750 -o 340 -g 340 "${pkgdir}/var/lib/ceph/bootstrap-osd"
    install -D -d -m750 -o 340 -g 340 "${pkgdir}/var/lib/ceph/bootstrap-rgw"
    install -D -d -m750 -o 340 -g 340 "${pkgdir}/var/lib/ceph/mon"
    install -D -d -m750 -o 340 -g 340 "${pkgdir}/var/lib/ceph/osd"

    # https://bugs.archlinux.org/task/68439
    install -D -d -m750 -o   0 -g   0 "${pkgdir}/etc/logrotate.d"
    install -D    -m644 -o   0 -g   0 ../src/logrotate.conf "${pkgdir}/etc/logrotate.d/ceph"
}

package_ceph-mgr-git() {
    depends=("ceph-git=${pkgver}-${pkgrel}" "ceph-libs-git=${pkgver}-${pkgrel}"
             'bash' 'boost-libs' 'coffeescript' 'curl' 'gperftools' 'nodejs' 'nss'
             'python' 'python-cherrypy' 'python-flask-restful' 'python-pecan'
             'python-pyjwt' 'python-routes' 'python-jsonpatch' 'python-more-itertools' 'python-numpy'
             'python-scipy' 'python-six')
    optdepends=('python-influxdb: influx module'
                'python-kubernetes: rook module'
                'python-prometheus_client: prometheus module'
                'python-remoto: ssh module')
    provides=('ceph-mgr')
    conflicts=('ceph-mgr')

    cd "${srcdir}/${pkgbase%%-git}/build"

    # main install
    DESTDIR="${pkgdir}" ninja install

    # fix sbin dir (cmake opt seems to have no effect)
    mv "${pkgdir}"/usr/sbin/* "${pkgdir}/usr/bin/"
    rm -rf "${pkgdir}/usr/sbin"

    # remove everything except mgr related stuff, rest is in ceph/ceph-libs
    rm -rf "${pkgdir}"/usr/lib/{ceph/{compressor,crypto,erasure-code},rados-classes}
    rm -rf "${pkgdir}/usr/include"
    find "${pkgdir}/usr/bin" -maxdepth 1 -type f -not -name 'ceph-mgr' -delete
    find "${pkgdir}"/usr/lib/systemd/system -maxdepth 1 -type f -not -iname 'ceph-mgr*' -delete
    find "${pkgdir}"/usr/lib -maxdepth 1 -type f -delete
    find "${pkgdir}"/usr/lib -maxdepth 1 -type l -delete
    rm -rf "${pkgdir}"/etc
    rm -rf "${pkgdir}"/var
    rm -rf "${pkgdir}"/usr/lib/{ceph,sysusers.d,tmpfiles.d}
    rm -rf "${pkgdir}"/usr/lib/python*
    rm -rf "${pkgdir}"/usr/share/{bash-completion,doc,java,man}

    __common

    # fix EnvironmentFile location in systemd service files
    sed -i 's|/etc/sysconfig/|/etc/conf.d/|g' "${pkgdir}"/usr/lib/systemd/system/*.service

    # prepare some paths and set correct permissions
    install -D -d -m750 -o 340 -g 340 "${pkgdir}/var/lib/ceph/mgr"
}

__common() {
    # remove debian init script
    rm -rf "${pkgdir}/etc/init.d"

    # remove drop.ceph.com ssh stuff
    rm -f "${pkgdir}"/usr/share/ceph/id_rsa_drop.ceph.com
    rm -f "${pkgdir}"/usr/share/ceph/id_rsa_drop.ceph.com.pub
    rm -f "${pkgdir}"/usr/share/ceph/known_hosts_drop.ceph.com
}
