# Maintainer: Eric Berquist <eric DOT berquist AT gmail DOT com>

# derived from community/tachyon

pkgname=tachyon-opengl
_pkgname=tachyon
pkgver=0.99b6
pkgrel=2
pkgdesc="Parallel ray tracer (used as part of Visual Molecular Dynamics), OpenGL-enabled"
arch=('i686' 'x86_64')
url="http://jedi.ks.uiuc.edu/~johns/raytracer/"
license=('custom')
depends=('libgl' 'libjpeg' 'libpng')
conflicts=('tachyon')
options=(staticlibs)
source=("http://jedi.ks.uiuc.edu/~johns/raytracer/files/${pkgver}/${_pkgname}-${pkgver}.tar.gz"
        "make_arch.patch"
        "make_config.patch")
sha256sums=('f4dcaf9c76a4f49310f56254390f9611c22e353947a1745a8c623e8bc8119b97'
            '935553f4a0553505dc4db9c22635072d9cf238988e1dbeee2df52a01e0953a1a'
            'c016bb5b0bc422c11bf53e93f7f9001fd742a53ab3d49affd1354bc3990391b3')

case "$CARCH" in
  "i686") _buildtype=linux-thr-ogl ;;
  "x86_64") _buildtype=linux-64-thr-ogl ;;
esac

prepare() {
  cd "${srcdir}/${_pkgname}/unix"
  # generate position-independent code
  patch -i "${srcdir}/make_arch.patch"
  # enable JPEG and PNG support, plus GCC atomics
  patch -i "${srcdir}/make_config.patch"
}

build() {
  cd "${srcdir}/${_pkgname}/unix"
  make ${_buildtype}
}

package() {
  # binary and library
  cd "${srcdir}/${_pkgname}/compile/${_buildtype}"
  install -D -m 755 tachyon "${pkgdir}/usr/bin/tachyon"
  install -D -m 644 libtachyon.a "${pkgdir}/usr/lib/libtachyon.a"

  # headers
  cd "${srcdir}/${_pkgname}/src"
  install -d "${pkgdir}/usr/include/tachyon"
  install -m 644 *.h "${pkgdir}/usr/include/tachyon"

  # scenes
  cd "${srcdir}/${_pkgname}/scenes"
  install -d "${pkgdir}/usr/share/tachyon/scenes/imaps"
  install -m 644 README *.dat *.cam *.ac "${pkgdir}/usr/share/tachyon/scenes"
  install -m 644 imaps/* "${pkgdir}/usr/share/tachyon/scenes/imaps"

  # license
  cd "${srcdir}/${_pkgname}"
  install -D -m 644 Copyright "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
      
