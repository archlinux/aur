# Contributor: Yamashita Ren
# Contributor: Fredrick Brennan <admin@8chan.co>
# Contributor: Julien Machiels

pkgname=waifu2x-converter-cpp-cuda-git
_gitname=${pkgname%-cuda-git}
pkgver=r250.ca65c93
pkgrel=3
pkgdesc="Image rescaling and noise reduction using the power of convolutional neural networks, with CUDA support"
arch=('i686' 'x86_64')
url="https://github.com/tanakamura/waifu2x-converter-cpp"
license=('MIT')
depends=('cuda' 'opencl-headers' 'opencl-nvidia' 'opencv')
makedepends=('cmake' 'git')
provides=('waifu2x' 'waifu2x-converter-cpp')
conflicts=('waifu2x-git')
source=('git+https://github.com/tanakamura/waifu2x-converter-cpp.git')
md5sums=('SKIP')

pkgver() {
  cd ${_gitname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd ${_gitname}
  patch -Np1 -i ../../arch_use_usr_share_for_models.patch
  sed -i 's/g++-4.7/g++/' CMakeLists.txt
  sed -i 's/gcc-4.7/gcc/' Makefile.linux
}

build() {
  cd ${_gitname}
  cmake -D CUDA_TOOLKIT_ROOT_DIR=/opt/cuda/ .
  make
}

package() {
  cd ${_gitname}
  install -D ${_gitname} $pkgdir/usr/bin/waifu2x
  install -D libw2xc.so $pkgdir/usr/lib/libw2xc.so
  install -D ../../waifu2x.1.gz $pkgdir/usr/share/man/man1/waifu2x.1.gz
  install -D src/w2xconv.h $pkgdir/usr/include/w2xconv.h
  mkdir -p $pkgdir/usr/share/waifu2x || true
  cp -r models_rgb $pkgdir/usr/share/waifu2x
}

check() {
  cd ${_gitname}
  msg 'Running Waifu2x'\''s test suite. Since you are using CUDA, this shouldn'\''t take a while.'
  ./runtest
}
