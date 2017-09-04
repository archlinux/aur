# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=openr2
pkgname=${_pkgname}-git
pkgver=r281.a0bf085
pkgrel=1
pkgdesc='Library that implements the MFC/R2 and DTMF/R2 signalling over E1 lines'
arch=('i686' 'x86_64')
url='http://www.libopenr2.org/'
license=('GPL' 'LGPL')
depends=('glibc') #dahdi only used for r2test (needs zaptel driver)
makedepends=('git' 'cmake')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/moises-silva/openr2"
        'fix_version_lib_dir.patch')
sha256sums=('SKIP'
            '402468b8877bff575c307f2f5c16ea3330a4d416b1f2e1ac42c341b7b8df4b5a')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  echo r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  patch -uNp2 -r- -i ../fix_version_lib_dir.patch
}

build() {
  cd "${srcdir}/${_pkgname}"
  [ -d build ] && rm -fr build
  mkdir build
  cd build
  export CFLAGS="-Wno-unused-const-variable"
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${srcdir}/${_pkgname}"/build
  make DESTDIR="${pkgdir}" install 
}
