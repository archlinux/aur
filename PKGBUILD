# Maintainer: Troy Engel <troyengel+arch@gmail.com>
# Contributor: Manuel Mendez <mmendez534@gmail.com>

pkgbase=bcc-git
pkgname=('bcc-git' 'bcc-tools-git' 'python-bcc-git' 'python2-bcc-git')
pkgver=v0.1.7.r88.f50ca1f
pkgrel=1
pkgdesc="BPF Compiler Collection - latest git code"
arch=('x86_64')
url="https://github.com/iovisor/bcc"
license=('Apache')
provides=('bcc')
conflicts=('bcc')
makedepends=('cmake' 'clang>=3.7.0' 'llvm>=3.7.0' 'flex' 'bison' 'python'
             'python2')
source=('bcc-git::git+https://github.com/iovisor/bcc')
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgbase}"
  printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
  # make sure repetitive builds are clean
  [[ -d "${srcdir}/${pkgbase}/build" ]] && \
    rm -rf "${srcdir}/${pkgbase}/build"
  mkdir "${srcdir}/${pkgbase}/build"
  cd "${srcdir}/${pkgbase}/build"

  # we don't care which python here for the core C library
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib
  make
}

package_bcc-git() {
  pkgdesc="BPF Compiler Collection  - C library and examples"
  makedepends=('cmake' 'clang>=3.7.0' 'llvm>=3.7.0' 'flex' 'bison')
  provides=('bcc' 'libbcc')
  conflicts=('bcc' 'libbcc')
  optdepends=('bcc-tools-git: Python utilites using the BCC library'
              'python-bcc-git: Python 3 bindings for BCC'
              'python2-bcc-git: Python 2 bindings for BCC')

  # this installs the kitchen sink
  cd "${srcdir}/${pkgbase}/build"
  make DESTDIR="${pkgdir}/" install

  # these go in a split package python*-bcc
  rm -rf "${pkgdir}"/usr/lib/python*

  # these go in a split package bcc-tools
  rm -rf "${pkgdir}"/usr/share/bcc/{tools,man}
}

package_bcc-tools-git() {
  pkgdesc="BPF Compiler Collection - Tools"
  depends=('bcc-git')
  provides=('bcc-tools')
  conflicts=('bcc-tools')
  optdepends=('python-bcc-git: Python 3 bindings for BCC'
              'python2-bcc-git: Python 2 bindings for BCC')

  cd "${srcdir}/${pkgbase}/build/tools"
  make DESTDIR="${pkgdir}/" install

  cd "${srcdir}/${pkgbase}/build/man"
  make DESTDIR="${pkgdir}/" install

}

package_python-bcc-git() {
  pkgdesc="BPF Compiler Collection - Python 3 bindings"
  makedepends=('cmake')
  depends=('bcc-git' 'python')
  provides=('python-bcc')
  conflicts=('python-bcc')

  # the C lib s already built, force a quick python3 binding build
  cd "${srcdir}/${pkgbase}/build"
  cmake .. -DPYTHON_CMD="python" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib
  make

  # now install just those bindings
  cd "${srcdir}/${pkgbase}/build/src/python"
  make DESTDIR="${pkgdir}/" install
}

package_python2-bcc-git() {
  pkgdesc="BPF Compiler Collection - Python 2 bindings"
  makedepends=('cmake')
  depends=('bcc-git' 'python2')
  provides=('python2-bcc')
  conflicts=('python2-bcc')

  # the C lib is already built, force a quick python2 binding build
  cd "${srcdir}/${pkgbase}/build"
  cmake .. -DPYTHON_CMD="python2" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib
  make

  # now install just those bindings
  cd "${srcdir}/${pkgbase}/build/src/python"
  make DESTDIR="${pkgdir}/" install
}

