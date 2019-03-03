# Maintainer: Konstantin Gizdov < arch at kge dot pw >
# Contributor: Jan Kašpar < jan.kaspar at gmail dot com >
# Contributor: Alex Pearce < alex at alexpearce dot me >
pkgname=xrootd-py2
_pkgname=xrootd
provides=('xrootd' 'python2-xrootd' 'python2-pyxrootd')
conflicts=('xrootd')
pkgdesc="Software framework for fast, low latency, scalable and fault tolerant data access (Python2)."
pkgver=4.9.0
pkgrel=1
arch=('x86_64')
url="http://xrootd.org"
license=('LGPL3')
depends=('ceph' 'cppunit')
makedepends=('ceph' 'cmake')
checkdepends=('cppunit')
source=("${url}/download/v${pkgver}/xrootd-${pkgver}.tar.gz"
        fix_signness.patch)
sha256sums=('49791648bdc99ad87545f60d1808dacf926de7b843415ebdd181ccf43b2af8be'
            'f291968f0e17168330a422b43c92f1c2ec33f9c058f3310839ceeecff5e25f62')
get_py2ver () {
    python2 -c 'import sys; print(str(sys.version_info[0]) + "." + str(sys.version_info[1]))'
}

prepare() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    patch -Np1 -i "${srcdir}/fix_signness.patch"
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
          -DENABLE_TESTS=1 \
          -DXRD_PYTHON_REQ_VERSION=$(get_pyver2) \
          "${srcdir}/${_pkgname}-${pkgver}"

    # build
    make
}

check() {
    cd "${srcdir}/build/tests"

    ./common/text-runner ./XrdCephTests/libXrdCephTests.so "All Tests"

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
}
