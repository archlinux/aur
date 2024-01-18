# Maintainer: Edgar <Edgar{at}AnotherFoxGuy.com>
# Contributor: Sven-Hendrik Haase <svenstaro@archlinux.org>

pkgname=ogre-legacy
pkgver=14.1.2
pkgrel=1
pkgdesc='Scene-oriented, flexible 3D engine written in C++ (Latest version with legacy features enabled for older games)'
arch=('x86_64')
url='http://www.ogre3d.org'
license=('custom:MIT')
depends=('freeimage' 'freetype2' 'libxaw' 'libxrandr' 'sdl2' 'glu' 'pugixml' 'zlib' 'nvidia-cg-toolkit')
makedepends=('cmake' 'doxygen' 'graphviz' 'ttf-dejavu' 'mesa' 'python' 'ninja' 'cppunit' 'swig')
conflicts=('ogre')
provides=('ogre')
install=ogre.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/OGRECave/ogre/archive/v${pkgver}.tar.gz")
optdepends=('python: python bindings')
sha512sums=('bd83d2de11e7587b34fabe776ea42ea63fef0dfd3b31f00ee38b1a707c2862ca1a30f8e6c4990039816d6013df6469aa3f7da2f15023391c2cd347b556bed36e')

prepare() {
  cd ogre-${pkgver}
  sed -i 's|set(PYTHON_SITE_PACKAGES lib/python${PYTHON_VERSION_MAJOR}.${PYTHON_VERSION_MINOR}/dist-packages/Ogre/)|set(PYTHON_SITE_PACKAGES lib/python${PYTHON_VERSION_MAJOR}.${PYTHON_VERSION_MINOR}/dist-packages/Ogre/ CACHE FILEPATH "")|' Components/Python/CMakeLists.txt
}

build() {
  cd ogre-${pkgver}

  cmake \
    -Bbuild \
    -GNinja \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DOGRE_RESOURCEMANAGER_STRICT=0 \
    -DOGRE_BUILD_TESTS=OFF \
    -DOGRE_NODELESS_POSITIONING=ON \
    -DOGRE_BUILD_PLUGIN_CG=ON \
    -DOGRE_BUILD_DEPENDENCIES=OFF \
    -DPYTHON_SITE_PACKAGES=$(python -c "import sysconfig; print(sysconfig.get_paths()[\"platlib\"]+'/Ogre/')")

  ninja -C build
  ninja -C build OgreDoc
}

package() {
  cd ogre-${pkgver}

  DESTDIR="${pkgdir}" ninja -C build install

  mkdir -p "${pkgdir}"/opt/ogre/samples
  mv "${pkgdir}"/usr/bin/SampleBrowser "${pkgdir}"/opt/ogre/samples
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}