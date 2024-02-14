# Maintainer: Jacopo Nespolo <$lowercase_first_name at movimento dash centrale dot it>
# Contributor: loqs
pkgname=mfem-glvis
_pkgname=glvis
pkgver=4.2
pkgrel=1
pkgdesc="A lightweight tool for accurate and flexible finite element visualization"
arch=("x86_64")
url="https://glvis.org"
license=('BSD-3-Clause')
depends=(libpng freetype2 sdl2 mfem glew gcc-libs libglvnd fontconfig glibc)
makedepends=(cmake glm libxi ninja tinyxxd)
source=(https://github.com/GLVis/$_pkgname/archive/v$pkgver/${_pkgname}-${pkgver}.tar.gz)
md5sums=('a228c65c285e7a66e38b1ec2f2812842')

prepare() {
    # "Fix installation with CMake on non-APPLE platforms"
    sed -i '/GLVIS_APP_ICON/,+20d' $_pkgname-$pkgver/CMakeLists.txt
}

build() {
  cmake \
    -S "$_pkgname-$pkgver" \
    -B build \
    -G Ninja \
    -D CMAKE_BUILD_TYPE:STRING=Release \
    -D CMAKE_INSTALL_PREFIX:STRING=/usr \
    -D GLVIS_USE_LIBTIFF=OFF \
    -D GLVIS_USE_LIBPNG=ON \
    -Wno-dev

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build -v

  install \
      -v \
      -Dm 644 \
      ${_pkgname}-${pkgver}/LICENSE \
      -t "${pkgdir}/usr/share/licenses/${_pkgname}"
}
