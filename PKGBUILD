# Maintainer: Gavin Lloyd <gavinhungry@gmail.com>

pkgname=fatelf-utils
pkgver=111.5e7e594b70fa
pkgrel=3
pkgdesc='Utils for FatELF universal binaries for Linux'
arch=('i686' 'x86_64')
url='https://www.icculus.org/fatelf'
license=('custom')
makedepends=('cmake')
source=('hg+https://hg.icculus.org/icculus/fatelf')
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}"/fatelf
  echo $(hg identify -n).$(hg identify -i)
}

build() {
  cd "${srcdir}"/fatelf
  CFLAGS+=" -O0"
  cmake .
  make
}

package() {
  cd "${srcdir}"/fatelf

  sed -i 's|/usr/local|/usr|g' cmake_install.cmake
  make DESTDIR="${pkgdir}" install

  for FILE in docs/*.txt; do
    install -Dm644 "$FILE" "${pkgdir}"/usr/share/doc/fatelf/$(basename $FILE)
  done

  install -Dm644 LICENSE.txt "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
