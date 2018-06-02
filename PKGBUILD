# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Yamashita Ren
# Contributor: Fredrick Brennan <admin@8chan.co>
# Contributor: Julien Machiels

pkgname=waifu2x-converter-cpp-cuda-git
pkgver=r572.0529f44
pkgrel=1
pkgdesc="Image Super-Resolution for Anime-Style-Art. (re-implementation in C++ using OpenCV). with CUDA support (GIT Version)"
arch=('x86_64')
url='https://github.com/DeadSix27/waifu2x-converter-cpp'
license=('MIT')
depends=('opencv'
         'cuda'
         )
makedepends=('cmake'
             'git'
             'opencl-headers'
             'gcc7'
             )
provides=('waifu2x-converter-cpp'
          'waifu2x'
          )
conflicts=('waifu2x-converter-cpp'
           'waifu2x'
           )
source=('git+https://github.com/DeadSix27/waifu2x-converter-cpp.git')
sha256sums=('SKIP')

pkgver() {
  cd waifu2x-converter-cpp
  #echo $(git describe --long --tags | tr - .)
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build

  cd build
  cmake ../waifu2x-converter-cpp \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_SKIP_RPATH=ON \
    -DCUDA_NVCC_FLAGS='-std=c++11' \
    -DCUDA_HOST_COMPILER=/opt/cuda/bin/gcc \
    -DINSTALL_MODELS=ON \
    -DOPENCV_PREFIX=/usr
}

build() {
  make -C build
}

package() {
  make -C build DESTDIR=${pkgdir} install

  install -Dm644 waifu2x-converter-cpp/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
