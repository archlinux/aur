# Maintainer: acxz <akashpatel2008 at yahoo dot com>
# Contributor: CodeZ <navintiwari08@gmail.com>
# Contributor: Oskar Sveinsen
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>
# Contributor: William Rea <sillywilly@gmail.com>
# Contributor: Bjorn Lindeijer <bjorn@lindeijer.nl>

pkgname=cegui
pkgver=0.8.7
pkgrel=17
pkgdesc="A free library providing windowing and widgets for graphics APIs/engines"
arch=('i686' 'x86_64')
url="http://cegui.org.uk"
license=("MIT")
depends=('glm' 'ogre')
makedepends=('git'
             'cmake'
             'pcre'
             'freetype2'
             'minizip'
             'fribidi'
             'libraqm'
             'freeglut'
             'mesa'
             'glew'
             'glfw'
             'sdl2'
             'sdl2_image'
             'sfml'
             'irrlicht'
             'boost'
             'ois'
             'directfb'
             'libepoxy'
             'expat'
             'libxml2'
             'tinyxml'
             'tinyxml2'
             'rapidxml'
             'devil'
             'freeimage'
             'silly'
             'lua51'
             'tolua++'
             'python'
             'doxygen'
             'gtk2'
             'ccache')
optdepends=('pcre'
            'freetype2'
            'minizip'
            'fribidi'
            'libraqm'
            'freeglut'
            'mesa'
            'glew'
            'glfw'
            'sdl2'
            'sdl2_image'
            'sfml'
            'irrlicht'
            'boost'
            'ois'
            'directfb'
            'libepoxy'
            'expat'
            'libxml2'
            'tinyxml'
            'tinyxml2'
            'rapidxml'
            'devil'
            'freeimage'
            'silly'
            'lua51'
            'tolua++'
            'python'
            'doxygen'
            'gtk2'
            'ccache')
_pkgver=0-8-7
source=("${pkgname}-${pkgver}::https://github.com/cegui/cegui/archive/v${_pkgver}.tar.gz"
        "FindOgre.cmake"
        "FindPkgMacros.cmake"
        "PreprocessorUtils.cmake"
        "ogre-13.patch")
sha256sums=('7be289d2d8562e7d20bd155d087d6ccb0ba62f7e99cc25d20684b8edf2ba15cd'
            '056a10504824f671dce0e062cc4dccbe21a8d3e47de67f4d5f4d08a6a427dfd3'
            '97a242b8eb874336c54d2505b71ef928e5526e1e7acaafa5a5b13ad3417998d2'
            '29baafcbf17d66e5fc04d7a86318b4292e48b27c19a10f6952c4ccec61d4796b'
            '3da912c4a054f00db0994d61c3ee8f5b26dd95244169b787b5040ed2e8aee4ba')

prepare() {
    # Ensure libraries are installed in lib
    sed -i 's/lib64/lib/g' ${srcdir}/${pkgname}-${_pkgver}/CMakeLists.txt

    cp "${srcdir}/FindOgre.cmake" "${srcdir}/FindPkgMacros.cmake" "${srcdir}/PreprocessorUtils.cmake" \
        "${srcdir}/${pkgname}-${_pkgver}/cmake"

    cd "${srcdir}/${pkgname}-${_pkgver}"
    patch -p0 < "${srcdir}/ogre-13.patch"
}

build() {
  mkdir -p "${srcdir}/${pkgname}-${_pkgver}/build"
  cd "${srcdir}/${pkgname}-${_pkgver}/build"
  sed -i '1iadd_definitions(-std=c++11)' ../application_templates/CMakeLists.txt
  sed -i '1iadd_definitions(-std=c++11)' ../samples_framework/CMakeLists.txt
  sed -i '1iadd_definitions(-std=c++11)' ../cegui/src/RendererModules/OpenGL/CMakeLists.txt
  sed -i '1iadd_definitions(-std=c++11)' ../cegui/src/RendererModules/Ogre/CMakeLists.txt
  sed -i '1iadd_definitions(-std=c++11)' ../cegui/src/ScriptModules/Python/bindings/CMakeLists.txt

  cmake -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCEGUI_BUILD_XMLPARSER_LIBXML2=OFF \
        -DCEGUI_BUILD_LUA_MODULE=OFF \
        -DCEGUI_BUILD_LUA_GENERATOR=OFF \
        -DCEGUI_BUILD_LUA_GENERATOR=OFF \
        -DCEGUI_BUILD_XMLPARSER_XERCES=OFF \
        ..

  make
}

package() {
  cd "${srcdir}/${pkgname}-${_pkgver}/build"
  make DESTDIR="${pkgdir}/" install

  install -Dm644 ../COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
