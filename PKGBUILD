# Maintainer: Armin K. <krejzi at email dot com>

pkgname=libclc-svn
_pkgname=libclc
pkgver=224991
pkgrel=1
pkgdesc="Library requirements of the OpenCL C programming language"
arch=('any')
url="http://libclc.llvm.org/"
license=('MIT')
makedepends=('clang' 'subversion' 'python2')
options=('staticlibs')
source=("${_pkgname}::svn+http://llvm.org/svn/llvm-project/libclc/trunk")
md5sums=(SKIP)
provides=('libclc')
replaces=('libclc')
conflicts=('libclc')

pkgver() {
  cd "${srcdir}/libclc"
  svnversion | tr -d [A-z]
}

prepare() {
  cd "${srcdir}/libclc"

  # http://www.pcc.me.uk/pipermail/libclc-dev/2014-December/000794.html
  sed -i "s:metadata ::g" r600/lib/workitem/get_work_dim.ll
}

build() {
  cd "${srcdir}/libclc"

  sed -i 's/"python < $in >/sys.executable + " < $in >/g' configure.py

  python2 ./configure.py --prefix=/usr
  make
}

package() {
  cd "${srcdir}/libclc"

  make install DESTDIR="${pkgdir}"
  install -Dm644 LICENSE.TXT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

