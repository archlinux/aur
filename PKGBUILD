# Maintainer: Troy Engel <troyengel+arch@gmail.com>

pkgbase=bcc
pkgname=('bcc' 'bcc-tools' 'python-bcc' 'python2-bcc')
pkgver=0.1.7
pkgrel=1
pkgdesc="BPF Compiler Collection"
arch=('x86_64')
url="https://github.com/iovisor/bcc"
license=('Apache')
conflicts=('bcc-git')
source=("https://github.com/iovisor/${pkgname}/archive/v${pkgver}.tar.gz"
        "cmake_version-cmake.patch"
        "src_python_CMakeLists-txt.patch")
sha256sums=('c8416778324de818c02dd33f33a6a0b9ad0fc941ee88ad002a09919ecaaccd16'
           'SKIP'
           'SKIP')

prepare() {
  cd "${srcdir}/${pkgbase}-${pkgver}"
  # these two are already fixed in git, 0.1.8 release should have them
  patch -p0 < "${srcdir}/cmake_version-cmake.patch"
  patch -p0 < "${srcdir}/src_python_CMakeLists-txt.patch"
}

build() {
  # make sure repetitive builds are clean
  [[ -d "${srcdir}/${pkgbase}-${pkgver}/build" ]] && \
    rm -rf "${srcdir}/${pkgbase}-${pkgver}/build"
  mkdir "${srcdir}/${pkgbase}-${pkgver}/build"
  cd "${srcdir}/${pkgbase}-${pkgver}/build"

  # we don't care which python here for the core C library
  cmake .. -DREVISION=${pkgver} \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib
  make -j$(grep -c ^process /proc/cpuinfo)
}

package_bcc() {
  pkgdesc="BPF Compiler Collection  - C library and examples"
  makedepends=('cmake' 'clang>=3.7.0' 'llvm>=3.7.0' 'flex' 'bison')
  provides=('bcc' 'libbcc')
  conflicts=('bcc-git')
  optdepends=('bcc-tools: Python utilites using the BCC library'
              'python-bcc: Python 3 bindings for BCC'
              'python2-bcc: Python 2 bindings for BCC')

  # everything except the python bindings
  cd "${srcdir}/${pkgbase}-${pkgver}/build"
  make DESTDIR="${pkgdir}/" install
  rm -rf "${pkgdir}"/usr/lib/python*
}

package_bcc-tools() {
  pkgdesc="BPF Compiler Collection - Tools"
  depends=('bcc')
  optdepends=('python-bcc: Python 3 bindings for BCC'
              'python2-bcc: Python 2 bindings for BCC')

  # https://github.com/iovisor/bcc/issues/291
  mkdir -p "${pkgdir}/usr/share/${pkgbase}"
  cp -a "${srcdir}/${pkgbase}-${pkgver}/tools" \
    "${pkgdir}/usr/share/${pkgbase}/"

  # these conflict with perf-tools for now as well
  mkdir -p "${pkgdir}/usr/share/${pkgbase}/man"
  cp -a "${srcdir}/${pkgbase}-${pkgver}/man/man8" \
    "${pkgdir}/usr/share/${pkgbase}/man/"
}

package_python-bcc() {
  pkgdesc="BPF Compiler Collection - Python 3 bindings"
  makedepends=('cmake')
  depends=('bcc' 'python')

  # the C lib s already built, force a quick python3 binding build
  cd "${srcdir}/${pkgbase}-${pkgver}/build"
  cmake .. -DREVISION=${pkgver} -DPYTHON_CMD="python" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib
  make -j$(grep -c ^process /proc/cpuinfo)

  # now install just those bindings
  cd "${srcdir}/${pkgbase}-${pkgver}/build/src/python"
  make DESTDIR="${pkgdir}/" install
}

package_python2-bcc() {
  pkgdesc="BPF Compiler Collection - Python 2 bindings"
  makedepends=('cmake')
  depends=('bcc' 'python2')

  # the C lib s already built, force a quick python2 binding build
  cd "${srcdir}/${pkgbase}-${pkgver}/build"
  cmake .. -DREVISION=${pkgver} -DPYTHON_CMD="python2" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib
  make -j$(grep -c ^process /proc/cpuinfo)

  # now install just those bindings
  cd "${srcdir}/${pkgbase}-${pkgver}/build/src/python"
  make DESTDIR="${pkgdir}/" install
}

