# Maintainer: CreamSodass <greatvaluecreamsoda@gmail.com>

pkgname=vapoursynth-plugin-vship-cuda-git
pkgrel=4
pkgver=5.0.1.4.gdc0f1ba
pkgdesc="Plugin for Vapoursynth: vship for nvidia gpus (GIT version)"
arch=('x86_64')
url='https://codeberg.org/Line-fr/Vship'
license=('MIT')
depends=('cuda')
makedepends=('git')
optdepends=('vapoursynth: vapoursynth plugin usage')
provides=("vapoursynth-plugin-vship" "libvship")
conflicts=("vapoursynth-plugin-vship" "libvship")
source=("vship::git+https://codeberg.org/Line-fr/Vship.git")
sha256sums=('SKIP')

build() {
  cd "$srcdir/vship"
  export PATH="/opt/cuda/bin:$PATH"

  nvcc -x cu src/VshipLib.cpp \
    -t "$(nproc)" \
    -ccbin "${CXX:-g++}" \
    -std=c++17 \
    -I include \
    -arch=all \
    --shared \
    -Xcompiler "${CXXFLAGS} -fPIC" \
    -O3 \
    -o libvship.so
}

pkgver() {
  cd "${srcdir}/vship"
  # Generate pkgver like: v3.0.0.0.g7cd1d4f
  git describe --tags --long | sed 's/^v//;s/-/./g'
}

package(){
  cd "vship"
  install -Dm755 libvship.so "$pkgdir/usr/lib/libvship.so"
  install -d "$pkgdir/usr/lib/vapoursynth"
  ln -s /usr/lib/libvship.so "$pkgdir/usr/lib/vapoursynth/libvship.so"

  install -Dm644 src/VshipAPI.h "$pkgdir/usr/include/VshipAPI.h"
  install -Dm644 src/VshipColor.h "$pkgdir/usr/include/VshipColor.h"
}
