# Maintainer: Laurent Carlier <lordheavym@gmail.com>

pkgname=libclc-git
pkgver=492.20180226
pkgrel=1
groups=('mesagit')
pkgdesc="Library requirements of the OpenCL C programming language (git version)"
arch=('i686' 'x86_64')
url="http://libclc.llvm.org/"
license=('MIT')
provides=('libclc')
replaces=('libclc-amdgpu-git')
conflicts=('libclc-amdgpu-git')
makedepends=('clang-svn' 'git' 'python2')
options=('staticlibs')
source=('libclc::git+http://llvm.org/git/libclc.git')
md5sums=(SKIP)

pkgver() {
  cd libclc

  echo $(git rev-list --count master).$(date +%Y%m%d)
}

build() {
  cd libclc
  
  sed -i 's/"python < $in >/sys.executable + " < $in >/g' configure.py
#  sed -i 's/python < $in >/python2 < $in >/g' configure.py
  python2 ./configure.py --prefix=/usr
  sed -i 's/-fno-plt//g' Makefile
  make
}

package() {
  cd libclc
  
  make install DESTDIR="$pkgdir"
  install -Dm644 LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
