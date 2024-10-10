# Maintainer: Samuel Fernando Mesa Giraldo <samuelmesa@linuxmail.org>
# Contributor: James Duley <jagduley gmail>
# Contributor: A. Weiss <adam [at] archlinux.us>

pkgname=osgearth
pkgver=3.5
pkgrel=1
pkgdesc="A terrain rendering toolkit for OpenSceneGraph"
arch=('i686' 'x86_64')
url='https://osgearth.org'
license=('LGPL')
depends=('openscenegraph' 'gdal' 'minizip' 'qt5-base' 'rocksdb' 'duktape' 'rapidjson' 'draco' 'protobuf')
makedepends=('cmake')
provides=('osgearth')
source=("https://github.com/gwaldron/osgearth/archive/${pkgname}-${pkgver}.tar.gz" "fix_rapidjson.patch")
md5sums=('40d99071dfaef77d7da103cbed6d194c'
         '9da9dba182e6a182e0baaa55b588aa35')

prepare() {
  cd ${srcdir}/${pkgname}-${pkgname}-${pkgver}
  patch --forward --strip=1 --input="${srcdir}/fix_rapidjson.patch"
  git clone https://github.com/Esri/lerc.git src/third_party/lerc
  cd src/third_party/lerc
  git checkout 19542a00b9a8b5c1089f74239e5859e02e403212
}

build() {
  cd ${srcdir}/${pkgname}-${pkgname}-${pkgver}

  #Build
  if [[ -d "build" ]]; then
    (rm -rf build)
  fi

  mkdir build
  cd build

  cmake \
  -DLIB_POSTFIX= \
  -Dosg_OPENGL_PROFILE=GLCORE \
  -DOpenGL_GL_PREFERENCE=GLVND \
  -DCMAKE_INSTALL_PREFIX=/usr \
  ..

  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgname}-${pkgver}/build
  make DESTDIR=$pkgdir install
  
  install -d ${pkgdir}/usr/share/osgearth
  install -d ${pkgdir}/usr/share/osgearth/test
  install -d ${pkgdir}/usr/share/osgearth/data
  cp -rfv ${srcdir}/${pkgname}-${pkgname}-${pkgver}/tests/* ${pkgdir}/usr/share/osgearth/test
  cp -rfv ${srcdir}/${pkgname}-${pkgname}-${pkgver}/data/* ${pkgdir}/usr/share/osgearth/data
}
