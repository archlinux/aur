# Maintainer: Jacopo Nespolo <$lowercase_first_name at movimento dash centrale dot it>
pkgname=mfem-glvis
_pkgname=glvis
pkgver=4.2
pkgrel=1
pkgdesc="A lightweight tool for accurate and flexible finite element visualization"
arch=("x86_64")
url="https://glvis.org"
license=('BSD-3-Clause')
depends=(mfem openmpi libglvnd sdl2 glew libpng freetype2 fontconfig gcc-libs glibc)
makedepends=(cmake glm libxi ninja tinyxxd)
_repo=https://github.com/GLVis/glvis
source=(${_pkgname}-${pkgver}.tar.gz::${repo}/archive/refs/tags/v${pkgver}.tar.gz)
md5sums=('a228c65c285e7a66e38b1ec2f2812842')

prepare() {
    # Backporting upstream commit 92bab4c 
    # "Fix installation with CMake on non-APPLE platforms"
    cd $_pkgname-$pkgver
    echo -e "318a319\n>   if (APPLE)\n339a341\n>   endif (APPLE)" | patch CMakeLists.txt
}

build() {
  cmake \
    -S "$_pkgname-$pkgver" \
    -B build \
    -D CMAKE_BUILD_TYPE:STRING=Release \
    -D CMAKE_INSTALL_PREFIX:STRING=/usr \
    -D GLVIS_USE_LIBTIFF=OFF \
    -D GLVIS_USE_LIBPNG=ON

  local N_CORES=$(grep "core id" /proc/cpuinfo | uniq | wc -l)
  cmake --build build --parallel $N_CORES
}

package() {
  ln -s build/glvis build/GLVis
  ls build
  DESTDIR="${pkgdir}" cmake --build build --target install -v

  install \
      -v \
      -Dm 644 \
      ${_pkgname}-${pkgver}/LICENSE \
      -t "${pkgdir}/usr/share/licenses/${_pkgname}"
}
