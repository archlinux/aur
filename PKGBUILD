# Maintainer: Oystein Sture <oysstu at protonmail com>
# Contributor: Sven-Hendrik Haase <svenstaro@archlinux.org>
pkgname=ogre-next2
pkgver=2.3.3
pkgrel=3
pkgdesc='Scene-oriented, flexible 3D engine written in C++'
arch=('x86_64')
url='http://www.ogre3d.org'
license=('MIT')
depends=('freetype2' 'libxaw' 'libxrandr' 'rapidjson'
         'zziplib' 'sdl2' 'glu' 'tinyxml' 'zlib' 'openvr')
makedepends=('cmake' 'doxygen' 'graphviz' 'ttf-dejavu' 'mesa' 'ninja' 'cppunit'
             'vulkan-headers' 'shaderc')
provides=("ogre-next=${pkgver}")
conflicts=("ogre-next")
install=ogre-next2.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/OGRECave/ogre-next/archive/v${pkgver}.tar.gz"
        "mesa-gl3.patch::https://github.com/OGRECave/ogre-next/pull/469.patch"
        "stlallocator-explicit.patch")
sha512sums=('52ed2d2a3375c0d35f0dc695b986514484ad1d47966c5c18351d3b09913123b2487b9729738c6b8b1219c1a992a8c8509a2303e097a6eb26497e152a14d48830'
            '2253b5de3ea267f5e126d9204720d6b4f3f312fa32e3b10e16328120a893d64ef52a9d603e04c192c76f203b6b252de97cf77d24d61cebaf46b9dce7079eaab2'
            '60574232dff359b232b97ab1095c26d271f6841921202c441e751505c9b7a7dd157b4852ff30018de54af828361e1f0bfcd39967baa7d99e2623b13ab619d94e')

prepare() {
  cd ogre-next-${pkgver}
  patch -p1 < ${srcdir}/mesa-gl3.patch
  patch -p1 < ${srcdir}/stlallocator-explicit.patch
}

build() {
  cd ogre-next-${pkgver}

  cmake \
    -Bbuild \
    -GNinja \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DOGRE_USE_NEW_PROJECT_NAME=ON \
    -DOGRE_CONFIG_ENABLE_JSON=ON \
    -DOGRE_CONFIG_THREADS=1 \
    -DOGRE_CONFIG_THREAD_PROVIDER="std" \
    -DOGRE_BUILD_COMPONENT_PLANAR_REFLECTIONS=ON \
    -DOGRE_BUILD_COMPONENT_PROPERTY=OFF \
    -DOGRE_BUILD_COMPONENT_SCENE_FORMAT=ON \
    -DOGRE_BUILD_COMPONENT_HLMS_UNLIT=ON \
    -DOGRE_BUILD_TESTS=OFF \
    -DOGRE_INSTALL_SAMPLES_SOURCE=OFF \
    -DOGRE_BUILD_SAMPLES2=OFF

  ninja -C build
}

package() {
  cd ogre-next-${pkgver}
  DESTDIR="${pkgdir}" ninja -C build install
  install -Dm644 Docs/License.html "${pkgdir}"/usr/share/licenses/${pkgname}/License.html
}

# vim:set ts=2 sw=2 et:
