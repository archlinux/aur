# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=twaindsm
pkgver=2.4.2
pkgrel=1
pkgdesc="TWAIN Data Source Manager"
arch=('i686' 'x86_64')
url="http://twain.org/"
license=('LGPL2.1')
depends=('gcc-libs')
makedepends=('cmake')
source=("https://github.com/twain/twain-dsm/raw/master/Releases/dsm_020402/tarball/twaindsm_${pkgver}.orig.tar.gz"
        "no-werror.patch")
md5sums=('8f9c9b9a13a3225c6e5828a0561a826f'
         '7880d330686bffad0c00b6a2731be338')

prepare() {
  cd "${srcdir}/TWAIN_DSM/src"

  # Someone thought it was a good idea to distribute CMake build artifacts
  rm -rf CMakeCache.txt CMakeFiles

  patch -Np3 < "${srcdir}/no-werror.patch"
}

build() {
  cd "${srcdir}/TWAIN_DSM/src"

  test -d build && rm -rf build
  mkdir build
  cd build

  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "${srcdir}/TWAIN_DSM/src/build"

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
