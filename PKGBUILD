# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>
pkgname=appleseed
pkgrel=1
pkgver=2.0.0
_pkgver=${pkgver}-beta
pkgdesc="physically-based global illumination rendering engine primarily designed for animation and visual effects. "
arch=(x86_64)
url="http://appleseedhq.net"
license=('MIT')
provides=('appleseed')
conflicts=('appleseed-git')
depends=(python2 qt4 'seexpr>=2.11' boost openexr opencolorio openimageio openshadinglanguage xerces-c zlib)
makedepends=(cmake)
options=()
source=("https://github.com/${pkgname}hq/${pkgname}/archive/${_pkgver}.tar.gz"
        dir.patch
        )
md5sums=('25030249df1403daf7b38359b2edf593'
         '3da34be53a016d68ff8abfebaed1dd4e')

CMAKE_FLAGS="-DUSE_EXTERNAL_EXR=ON \
              -DUSE_EXTERNAL_OCIO=ON \
              -DUSE_EXTERNAL_OIIO=ON \
              -DUSE_EXTERNAL_OSL=ON \
              -DUSE_EXTERNAL_PNG=ON \
              -DUSE_EXTERNAL_XERCES=ON \
              -DUSE_EXTERNAL_ZLIB=ON \
              -DUSE_EXTERNAL_SEEXPR=ON \
              -DUSE_STATIC_BOOST=OFF \
              -DUSE_STATIC_OCIO=OFF \
              -DUSE_STATIC_OIIO=OFF \
              -DUSE_STATIC_OSL=OFF \
              -DWITH_DISNEY_MATERIAL=ON \
              -DWARNINGS_AS_ERRORS=OFF"

#pkgver() {
#  cd ${pkgname}-${_pkgver}
#  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
#}

prepare() {
  cd ${pkgname}-${_pkgver}
  grep -q avx /proc/cpuinfo && CMAKE_FLAGS="${CMAKE_FLAGS} -DUSE_AVX=ON"
  grep -q avx2 /proc/cpuinfo && CMAKE_FLAGS="${CMAKE_FLAGS} -DUSE_AVX2=ON"
  grep -q sse4_2 /proc/cpuinfo && CMAKE_FLAGS="${CMAKE_FLAGS} -DUSE_SSE42=ON"
  patch -Np1 -i ../dir.patch
}
build() {
  cd ${pkgname}-${_pkgver}
  mkdir -p build
  cd build
  cmake -DCMAKE_BUILD_TYPE=Ship -DCMAKE_INSTALL_PREFIX=/opt/appleseed ${CMAKE_FLAGS} ..
  make
}

package() {
  cd ${pkgname}-${_pkgver}/build
  make DESTDIR=${pkgdir} install
  install -D -m644 "../LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
