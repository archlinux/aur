#
# PKGBUILD: v1541commander
#
# Maintainer: uffe Jakobsen <_uffe_-at-_uffe_-_dot_-_org>
#

pkgname=v1541commander
pkgver=1.0
pkgrel=1
pkgdesc="virtual 1541 disk commander that allows you to create and modify D64 disk images (for the Commodore 1541 floppy drive)."
arch=('i686' 'x86_64')
url="https://github.com/excess-c64/v1541commander"
license=('custom') # see LICENSE.txt
depends=()
source=(
        ${pkgname}-v${pkgver}.tar.gz::https://github.com/excess-c64/${pkgname}/archive/v${pkgver}.tar.gz
        lib1541img-v1.0.tar.gz::https://github.com/excess-c64/lib1541img/archive/v1.0.tar.gz
        zimk.tar.gz::https://github.com/Zirias/zimk/archive/31500ca556f258ab2d37d75fb8de5506cbdd5840.tar.gz
       )
md5sums=('a47887bd4eb570e07339400ce494182e' "4fb415b69b23fbd79c0c77bb8a7cb91c" "b7a17162aeb953fb938c4ea4597f8fd8")

#
prepare()
{
  # lib1541img
  cd "${srcdir}/lib1541img-${pkgver}"
  # hack - but will work for now....
  rmdir zimk
  ln -s ../zimk-31500ca556f258ab2d37d75fb8de5506cbdd5840/ zimk
  # v1541commander
  cd "${srcdir}/${pkgname}-${pkgver}"
  # hack - but will work for now....
  rmdir zimk
  ln -s ../zimk-31500ca556f258ab2d37d75fb8de5506cbdd5840/ zimk
  patch -p0 < ${srcdir}/../v1541commander.mk.patch
}

#
build()
{
  # lib1541img
  LIB1541IMG_SRC="${srcdir}/lib1541img-${pkgver}"
  cd "${LIB1541IMG_SRC}"
  make
  # v1541commander
  cd "${srcdir}/${pkgname}-${pkgver}"
  # hack - but will work for now....
  #make 1541img_CFLAGS="-I${LIB1541IMG_SRC}/include" 1541img_CXXFLAGS="-I${LIB1541IMG_SRC}/include" 1541img_LINK="${LIB1541IMG_SRC}/obj/x86_64-pc-linux-gnu/release/src/lib/1541img/*.o"
  make prefix=/usr/local DESTDIR="${pkgdir}" CFLAGS="-I${LIB1541IMG_SRC}/include" CXXFLAGS="-I${LIB1541IMG_SRC}/include" LDFLAGS="${LIB1541IMG_SRC}/obj/x86_64-pc-linux-gnu/release/src/lib/1541img/*.o"
}

#
package()
{
  LIB1541IMG_SRC="${srcdir}/lib1541img-${pkgver}"
  cd "${srcdir}/${pkgname}-${pkgver}"
  # hack - but will work for now....
  make prefix=/usr/local DESTDIR="${pkgdir}" CFLAGS="-I${LIB1541IMG_SRC}/include" CXXFLAGS="-I${LIB1541IMG_SRC}/include" LDFLAGS="${LIB1541IMG_SRC}/obj/x86_64-pc-linux-gnu/release/src/lib/1541img/*.o" install
}

#
# EOF
#
