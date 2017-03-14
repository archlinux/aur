# Maintainer: Troy Engel <troyengel+arch@gmail.com>

pkgbase=bcc
pkgname=('bcc' 'bcc-tools' 'python-bcc' 'python2-bcc')
pkgver=0.3.0
pkgrel=1
pkgdesc="BPF Compiler Collection"
arch=('x86_64')
url="https://github.com/iovisor/bcc"
license=('Apache')
conflicts=('bcc-git')
makedepends=('cmake' 'clang>=3.7.0' 'llvm>=3.7.0' 'flex' 'bison' 'python'
             'python2')
source=("https://github.com/iovisor/${pkgname}/archive/v${pkgver}.tar.gz"
        'cppex-0.3.0.patch')
sha256sums=('88f54dff96c30c6e7b45f475938eef790b1c9485f794b1ac6791c4e56007f7cc'
            'b28a2c5149394fb7402dad92e4c0552644b63dd41394569b966eceb96fc5477e')

prepare() {
  # the provided CMakeLists.txt compiles the cpp examples with a static copy
  # of libbcc, ending up with ~282megs used; we'll just install the raw *.cc
  cd "${srcdir}"
  patch -p0 < "${srcdir}/cppex-0.3.0.patch" 
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
  make
}

package_bcc() {
  pkgdesc="BPF Compiler Collection  - C library and examples"
  makedepends=('cmake' 'clang>=3.7.0' 'llvm>=3.7.0' 'flex' 'bison')
  provides=('bcc' 'libbcc')
  conflicts=('bcc-git')
  depends=('linux-headers')
  optdepends=('bcc-tools: Python utilites using the BCC library'
              'python-bcc: Python 3 bindings for BCC'
              'python2-bcc: Python 2 bindings for BCC')

  # this installs the kitchen sink
  cd "${srcdir}/${pkgbase}-${pkgver}/build"
  make DESTDIR="${pkgdir}/" install

  # these go in a split package python*-bcc
  rm -rf "${pkgdir}"/usr/lib/python*

  # these go in a split package bcc-tools
  rm -rf "${pkgdir}"/usr/share/bcc/{tools,man}
}

package_bcc-tools() {
  pkgdesc="BPF Compiler Collection - Tools"
  depends=('bcc')
  conflicts=('bcc-tools-git')
  optdepends=('python-bcc: Python 3 bindings for BCC'
              'python2-bcc: Python 2 bindings for BCC')

  cd "${srcdir}/${pkgbase}-${pkgver}/build/tools"
  make DESTDIR="${pkgdir}/" install

  cd "${srcdir}/${pkgbase}-${pkgver}/build/man"
  make DESTDIR="${pkgdir}/" install

}

package_python-bcc() {
  pkgdesc="BPF Compiler Collection - Python 3 bindings"
  makedepends=('cmake')
  depends=('bcc' 'python')
  conflicts=('python-bcc-git')

  # the C lib s already built, force a quick python3 binding build
  cd "${srcdir}/${pkgbase}-${pkgver}/build"
  cmake .. -DREVISION=${pkgver} -DPYTHON_CMD="python" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib
  make

  # now install just those bindings
  cd "${srcdir}/${pkgbase}-${pkgver}/build/src/python"
  make DESTDIR="${pkgdir}/" install
}

package_python2-bcc() {
  pkgdesc="BPF Compiler Collection - Python 2 bindings"
  makedepends=('cmake')
  depends=('bcc' 'python2')
  conflicts=('python2-bcc-git')

  # the C lib s already built, force a quick python2 binding build
  cd "${srcdir}/${pkgbase}-${pkgver}/build"
  cmake .. -DREVISION=${pkgver} -DPYTHON_CMD="python2" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib
  make

  # now install just those bindings
  cd "${srcdir}/${pkgbase}-${pkgver}/build/src/python"
  make DESTDIR="${pkgdir}/" install
}

