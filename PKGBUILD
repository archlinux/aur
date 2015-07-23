# Maintainer: Eric Berquist <eric DOT berquist AT gmail DOT com>

# derived from community/tachyon

pkgname=tachyon-opengl
_pkgname=tachyon
pkgver=0.99b6
pkgrel=1
pkgdesc="Parallel ray tracer (used as part of Visual Molecular Dynamics), OpenGL-enabled"
arch=('i686' 'x86_64')
url="http://jedi.ks.uiuc.edu/~johns/raytracer/"
license=('custom')
depends=('libgl' 'libjpeg' 'libpng')
conflicts=('tachyon')
options=(staticlibs)
source=("http://jedi.ks.uiuc.edu/~johns/raytracer/files/${pkgver}/${_pkgname}-${pkgver}.tar.gz"
       "enable-jpeg-png.patch")
sha256sums=('f4dcaf9c76a4f49310f56254390f9611c22e353947a1745a8c623e8bc8119b97'
            'ecd6ab6274879e0f971e2eba17871fffe2e24dcc9a332013a0b100ee4857cc2c')

case "$CARCH" in
  "i686") _buildtype=linux-thr-ogl ;;
  "x86_64") _buildtype=linux-64-thr-ogl ;;
esac

prepare() {
  cd ${_pkgname}
  # enable JPEG and PNG support
  patch -p0 -i ${srcdir}/enable-jpeg-png.patch
}

build() {
  cd "${srcdir}/${_pkgname}/unix"
  sed -i "s|THREADSFLAGS=-DTHR -DUSEATOMICBARRIERS|THREADSFLAGS=-DTHR -DUSEATOMICBARRIERS -DUSEGCCATOMICS|g" Make-config
  make ${_buildtype}
}

package() {
  # binary and library
  cd ${srcdir}/${_pkgname}/compile/${_buildtype}
  install -D -m 755 tachyon ${pkgdir}/usr/bin/tachyon
  install -D -m 644 libtachyon.a ${pkgdir}/usr/lib/libtachyon.a

  # headers
  cd ${srcdir}/${_pkgname}/src
  install -d ${pkgdir}/usr/include/tachyon
  install -m 644 *.h ${pkgdir}/usr/include/tachyon

  # scenes
  cd ${srcdir}/${_pkgname}/scenes
  install -d ${pkgdir}/usr/share/tachyon/scenes/imaps
  install -m 644 README *.dat *.cam *.ac ${pkgdir}/usr/share/tachyon/scenes
  install -m 644 imaps/* ${pkgdir}/usr/share/tachyon/scenes/imaps

  # license
  cd ${srcdir}/${_pkgname}
  install -D -m 644 Copyright ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
      
