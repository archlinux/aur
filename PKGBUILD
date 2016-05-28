# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=twaindsm
pkgver=2.3.1
pkgrel=1
pkgdesc="TWAIN Data Source Manager"
arch=('i686' 'x86_64')
url="http://twain.org/"
license=('LGPL2.1')
depends=('gcc-libs')
makedepends=('cmake')
source=("https://sourceforge.net/projects/twain-dsm/files/TWAIN%20DSM%202%20Source/${pkgname}-${pkgver}.source.zip"
        "standard-lib-dir.patch"
        "no-werror.patch")
md5sums=('c7787b31cae16ee572fd4d2d1c57f527'
         '54b8caf90da42d6d3fc60dd89f097544'
         '7880d330686bffad0c00b6a2731be338')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}.orig"

  patch -Np1 < "${srcdir}/standard-lib-dir.patch"
  patch -Np1 < "${srcdir}/no-werror.patch"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}.orig/TWAIN_DSM/src"

  test -d build && rm -rf build
  mkdir build
  cd build

  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}.orig/TWAIN_DSM/src/build"
  
  make install DESTDIR="${pkgdir}"

  # For some reason the people who made the TWAIN specification thought it was
  # a good idea to put everything in /usr/local on Linux. So in order to comply
  # with the spec while still having everything in Arch's usual filesystem
  # hierarchy, we are going to create a few symlinks.
  install -dm755 "${pkgdir}/usr/lib/twain"
  install -dm755 "${pkgdir}/usr/local/lib"
  for i in "${pkgdir}/usr/lib/libtwaindsm.so"*; do
    ln -s "/usr/lib/$(basename "${i}")" "${pkgdir}/usr/local/lib/$(basename "${i}")"
  done;
  ln -s "/usr/lib/twain" "${pkgdir}/usr/local/lib/twain"
}
