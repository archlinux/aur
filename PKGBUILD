# Maintainer: Konstantin Gizdov < arch at kge dot pw >
# Contributor: Jan Kašpar < jan.kaspar at gmail dot com >
# Contributor: Alex Pearce < alex at alexpearce dot me >
_pkgname=xrootd
pkgname="${_pkgname}4"
pkgdesc="Software framework for fast, low latency, scalable and fault tolerant data access."
pkgver=4.12.6
pkgrel=3
arch=('x86_64')
url="https://xrootd.slac.stanford.edu/"
license=('LGPL3')
depends=('ceph' 'curl' 'libxml2' 'openssl' 'perl' 'python')
makedepends=('cmake' 'systemd')
checkdepends=('cppunit')
provides=('xrootd')
conflicts=('xrootd')
source=("${url}/download/v${pkgver}/${_pkgname}-${pkgver}.tar.gz"
        'stat_ver.patch'
        'cxx17.patch')
sha256sums=('1a9056ab7aeeaafa586ea77e442960c71d233c9ba60c7f9db9262c1410954ac4'
            '9e8e17ea1a6a07a4d636d07c397fcfde5a6a398fea2fbb89a763044a481698af'
            'ad423ea5c78c89e4f048da5c0ffd0fe263a3005e6de638077fbd770de89603eb')

get_pyver () {
    python -c 'import sys; print(str(sys.version_info[0]) + "." + str(sys.version_info[1]))'
}

prepare () {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    patch -Np1 -i "${srcdir}/cxx17.patch"
    patch -Np1 -i "${srcdir}/stat_ver.patch"
}

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"

    # configure
    mkdir -p "${srcdir}/build"
    cd "${srcdir}/build"

    CFLAGS="${CFLAGS}" \
    CXXFLAGS="${CXXFLAGS}" \
    LDFLAGS="${LDFLAGS}" \
    cmake -DCMAKE_BUILD_TYPE:STRING=Release \
          -DCMAKE_INSTALL_LIBDIR:PATH=lib \
          -DCMAKE_INSTALL_PREFIX:PATH=/usr \
          -DCMAKE_CXX_STANDARD="17" \
          -DENABLE_TESTS=1 \
          -DXRD_PYTHON_REQ_VERSION=$(get_pyver) \
          "${srcdir}/${_pkgname}-${pkgver}"

    # build
    make
}

check() {
    cd "${srcdir}/build/tests"

    # Check has significantly changed, to-be-updated
    # ./common/text-runner ./XrdCephTests/libXrdCephTests.so "All Tests"

    ##
    # This requires a running XRootD server with multiIP DNS forwarder and local disk servers
    # only run this if you have configured the env correctly,
    # examples in https://github.com/xrootd/xrootd-test-suite
    # sample environment can be configured like so:
    # export XRDTEST_MAINSERVERURL=metaman.xrd.test
    # or export XRDTEST_MAINSERVERURL=http://xrootd.cern.ch/
    # export XRDTEST_DISKSERVERURL=srv1.xrd.test
    # or export XRDTEST_DISKSERVERURL=http://xrootd.cern.ch/
    # export XRDTEST_DATAPATH=/tests/test-files/
    # export XRDTEST_LOCALFILE=/data/a048e67f-4397-4bb8-85eb-8d7e40d90763.dat
    # or export XRDTEST_LOCALFILE=/tmp/accwe.root
    # export XRDTEST_REMOTEFILE=${XRDTEST_MAINSERVERURL}${XRDTEST_DATAPATH}/a048e67f-4397-4bb8-85eb-8d7e40d90763.dat
    # or export XRDTEST_MULTIIPSERVERURL=multiip.xrd.test
    # ./common/text-runner ./XrdClTests/libXrdClTests.so "All Tests"
}

package() {
    cd "${srcdir}/build"
    make DESTDIR="${pkgdir}" install
    # drop unneeded test bin & lib
    rm "${pkgdir}/usr/bin/text-runner"
    rm "${pkgdir}/usr/lib/libXrdClTests.so"
    install -d "${pkgdir}/usr/lib/cmake/XRootD"
    mv "${pkgdir}/usr/share/xrootd/cmake/XRootDConfig.cmake" "${pkgdir}/usr/lib/cmake/XRootD"/
    rm -rf "${pkgdir}/usr/share/xrootd/cmake"
    ln -s "/usr/lib/cmake" "${pkgdir}/usr/share/xrootd/cmake"
}
