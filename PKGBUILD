# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Yamashita Ren
# Contributor: Fredrick Brennan <admin@8chan.co>
# Contributor: Julien Machiels

pkgname=waifu2x-converter-cpp-cuda-git
pkgver=r544.13569fd
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
source=('git+https://github.com/DeadSix27/waifu2x-converter-cpp.git'
        'cuda9.patch'
        )
sha256sums=('SKIP'
            'd3aa1d31e4aadef946a3a93faf65bc54761e402a39abb19dfdd3420d7cc2b114'
            )

pkgver() {
  cd waifu2x-converter-cpp
  #echo $(git describe --long --tags | tr - .)
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build

  # https://github.com/DeadSix27/waifu2x-converter-cpp/issues/35
  cd waifu2x-converter-cpp
  patch -p1 -i "${srcdir}/cuda9.patch"
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
    -DOPENCV_PREFIX=/usr

  make
}

package() {
  make -C build DESTDIR=${pkgdir} install

  install -Dm644 waifu2x-converter-cpp/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
