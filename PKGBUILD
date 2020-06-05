# Maintainer: Frank Carlyle McLaughlin (frankspace) <frank@frankspace.com>

pkgname=openimagedenoise-bin
_pkgname=oidn
pkgver=1.2.0
pkgrel=1
pkgdesc='Intel(R) Open Image Denoise library, official binaries'
arch=('x86_64')
url='https://openimagedenoise.github.io'
license=('Apache')
depends=('intel-tbb' 'python' 'ispc')
source=("https://github.com/OpenImageDenoise/oidn/releases/download/v${pkgver}/oidn-${pkgver}.x86_64.linux.tar.gz")
conflicts=("openimagedenoise")
provides=("openimagedenoise")
sha256sums=("47a395c3d9795625e29d84667306f51e15105ac40b481fb70fb01d63b8443e98")

# REASON FOR THE EXISTENCE OF THIS PACKAGE:
# The Arch package fails on my older CPU, but the official binaries work.
# See:
#   https://bugs.archlinux.org/task/66779
#   https://github.com/OpenImageDenoise/oidn/issues/76

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}.x86_64.linux"

  mkdir -p "${pkgdir}/usr"

  install -D -m755 bin/denoise "${pkgdir}/usr/bin/denoise"
#   "tests" conflicts with libde265 so renaming it
#   the official Arch package just deletes it
  install -D -m755 bin/tests "${pkgdir}/usr/bin/oidntests"
  install -d "${pkgdir}/usr/share/doc/OpenImageDenoise"
  install -D -m644 doc/* "${pkgdir}/usr/share/doc/OpenImageDenoise"
  install -d "${pkgdir}/usr/include/OpenImageDenoise"
  install -D -m644 include/OpenImageDenoise/* "${pkgdir}/usr/include/OpenImageDenoise"
  install -d "${pkgdir}/usr/lib"
  install -D -m644 lib/*.* "${pkgdir}/usr/lib"
  install -d "${pkgdir}/usr/lib/cmake/OpenImageDenoise"
  install -D -m644 lib/cmake/OpenImageDenoise/* "${pkgdir}/usr/lib/cmake/OpenImageDenoise"

  ln -sf /usr/lib/libOpenImageDenoise.so.0 ${pkgdir}/usr/lib/libOpenImageDenoise.so
  ln -sf /usr/lib/libOpenImageDenoise.so.${pkgver} ${pkgdir}/usr/lib/libOpenImageDenoise.so.0

#   these are already provided by intel-tbb
  rm ${pkgdir}/usr/lib/libtbb.so.2
  rm ${pkgdir}/usr/lib/libtbbmalloc.so.2

}
