# Maintainer: Benjamin Chretien <chretien at lirmm dot fr>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Vladimir Ermakov <vooon341@gmail.com>

pkgname=gazebo
pkgver=3.0.0
pkgrel=2
pkgdesc="A multi-robot simulator for outdoor environments"
arch=('i686' 'x86_64')
url="http://gazebosim.org/"
license=('Apache')
# See: http://www.gazebosim.org/user_guide/installation__requirements.html
depends=('boost>=1.40.0' 'curl>=4.0' 'freeglut' 'freeimage>=3.0'
         'intel-tbb>=3.0' 'libltdl>=2.4.2' 'libtar>=1.2' 'libxml2>=2.7.7'
         'ogre-1.8' 'protobuf>=2.3.0' 'qt4' 'sdformat'
         'tinyxml>=2.6.2')
optdepends=('bullet>=2.82: Bullet support'
            'simbody>=3.3: simbody support'
            'libdart>=3.0: dart support'
            'cegui-0.7>=0.7.5: Design custom graphical interfaces'
            'ffmpeg>=0.8.3: Playback movies on textured surfaces'
            'urdfdom: Load URDF files'
            'gdal: digital elevation terrains support')
makedepends=('cmake' 'doxygen' 'pkg-config>=0.26')
install="${pkgname}.install"
source=(http://gazebosim.org/assets/distributions/${pkgname}-${pkgver}.tar.bz2)
md5sums=('c90e962c91494bdb5283873fa15e6d82')
provides=('gazebo')
conflicts=('gazebo')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  find . -type f -exec sed -i 's|include <gdal/|include <|g' {} \;

  # Create build directory
  mkdir -p build && cd build

  # Adapt paths for Ogre 1.8
  export PKG_CONFIG_PATH="/opt/OGRE-1.8/lib/pkgconfig:$PKG_CONFIG_PATH"

  # Run CMake. We skip unit tests.
  cmake .. -DCMAKE_BUILD_TYPE="Release" \
           -DCMAKE_INSTALL_PREFIX=/usr \
           -DENABLE_TESTS_COMPILATION:BOOL=False

  # Compile Gazebo
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  make DESTDIR="${pkgdir}" install

  # Add paths for OGRE-1.8
  echo "export LD_LIBRARY_PATH=\$LD_LIBRARY_PATH:/opt/OGRE-1.8/lib" >> ${pkgdir}/usr/share/gazebo/setup.sh
  echo "export LD_LIBRARY_PATH=\$LD_LIBRARY_PATH:/opt/OGRE-1.8/lib" >> ${pkgdir}/usr/share/gazebo-3.0/setup.sh
}

# vim:set ts=2 sw=2 et:
