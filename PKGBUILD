# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: EndlessEden
# Contributor: Artem Vorotnikov <artem@vorotnikov.me>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>

pkgname=ogre-git
pkgver=14.3.2.r0.g05286bd
pkgrel=2
pkgdesc="Scene-oriented, flexible 3D engine written in C++"
arch=(x86_64 i686)
url="https://www.ogre3d.org/"
license=(MIT)
depends=(freetype2 libxaw libxrandr sdl2 glu pugixml zlib bullet python assimp qt5-base
         libxt gcc-libs libglvnd libx11
         )
makedepends=(git cmake doxygen graphviz ttf-dejavu mesa ninja cppunit swig)
optdepends=('cppunit: unit testing')
provides=(ogre ogre-docs)
conflicts=(ogre ogre-docs)
source=("git+https://github.com/OGRECave/ogre.git")
sha512sums=('SKIP')

pprepare() {
  cd ogre
  sed -i 's|set(PYTHON_SITE_PACKAGES lib/python${PYTHON_VERSION_MAJOR}.${PYTHON_VERSION_MINOR}/dist-packages/Ogre/)|set(PYTHON_SITE_PACKAGES lib/python${PYTHON_VERSION_MAJOR}.${PYTHON_VERSION_MINOR}/dist-packages/Ogre/ CACHE FILEPATH "")|' Components/Python/CMakeLists.txt
}

pkgver() {
  cd ogre
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  local _flags=(
    -DOGRE_BUILD_TESTS=OFF
    -DOGRE_BUILD_DEPENDENCIES=OFF
    -DPYTHON_SITE_PACKAGES=$(python -c "import sysconfig; print(sysconfig.get_paths()[\"platlib\"]+'/Ogre/')")
    -DOGRE_BUILD_PLUGIN_CG:BOOL=OFF
    -DOGRE_BUILD_PLUGIN_FREEIMAGE:BOOL=OFF
  )

  cmake -B build -S "ogre" -Wno-dev -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    "${_flags[@]}"

  cmake --build build

  ninja -C build
  ninja -C build OgreDoc
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install

  mkdir -p "${pkgdir}"/opt/ogre/samples
  mv "${pkgdir}"/usr/bin/SampleBrowser "${pkgdir}"/opt/ogre/samples
  #mv "${pkgdir}"/usr/bin/Test_* "${pkgdir}"/opt/ogre/samples
  install -Dm644 ogre/LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
