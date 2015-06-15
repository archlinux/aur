# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=jxrlib-git
pkgver=1.1.r39.e3a873b
pkgrel=1
pkgdesc='Open source implementation of jpegxr (Git version)'
arch=('i686' 'x86_64')
license=('GPL')
url='https://jxrlib.codeplex.com/'
makedepends=('git')
provides=('jxrlib')
conflicts=('jxrlib')
source=('git+https://git01.codeplex.com/jxrlib')
sha1sums=('SKIP')

pkgver() {
  cd jxrlib
  _ver="$(cat Makefile | grep -m1 JXR_VERSION | grep -o "[[:digit:]]*" | xargs)"
  echo -e "${_ver// /.}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd jxrlib
  make SHARED=1
}

package() {
  make -C jxrlib SHARED=1 DIR_INSTALL="${pkgdir}/usr" install

  # fix the prefix in libjxr.pc
  sed "s|${pkgdir}||g" -i "${pkgdir}/usr/lib/pkgconfig/libjxr.pc"
}
