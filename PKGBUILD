# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Yamashita Ren
# Contributor: Fredrick Brennan <admin@8chan.co>
# Contributor: Julien Machiels

pkgname=waifu2x-converter-cpp-cuda-git
pkgver=r463.f2cbb2e
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
}

build() {
  cd build
  cmake ../waifu2x-converter-cpp \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_SKIP_RPATH=ON \
    -DCUDA_CUDA_LIBRARY=/opt/cuda/lib64/stub/libcuda.so \
    -DCUDA_NVCC_FLAGS='-std=c++11' \
    -DINSTALL_MODELS=ON \
    -DOVERRIDE_OPENCV=ON \
    -DOPENCV_PREFIX=/usr

  make
}

package() {
  make -C build DESTDIR=${pkgdir} install

  install -Dm644 waifu2x-converter-cpp/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
