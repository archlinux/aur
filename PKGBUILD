# Contributor: PedroHLC <root@pedrohlc.com>
# Contributor: J. Peter Mugaas <jpmugaas@suddenlink.net>
# Contributor: wirx6 <wirx654@gmail.com>
# based on: https://github.com/Alexpux/MINGW-packages/blob/master/mingw-w64-vulkan-headers/PKGBUILD

_realname=Vulkan-Headers
pkgbase=mingw-w64-vulkan-headers
pkgname=("mingw-w64-vulkan-headers")
pkgver=1.1.96
pkgrel=1
pkgdesc='Vulkan header files (mingw-w64)'
arch=('any')
url="https://www.khronos.org/vulkan/"
groups=("mingw-w64-vulkan-devel")
license=('Apache')
depends=("mingw-w64-crt")
makedepends=("mingw-w64-cmake" "git")
_commit=f54e45b92374b99de8556cacffc3602a03187b68
source=(git+https://github.com/KhronosGroup/Vulkan-Headers.git#commit=${_commit})
sha256sums=('SKIP')
options=(!strip !buildflags staticlibs)

_build() {
  [[ -d ${srcdir}/build-$1 ]] && rm -rf ${srcdir}/build-$1
  mkdir -p ${srcdir}/build-$1 && cd ${srcdir}/build-$1

  $1-w64-mingw32-cmake \
    -DCMAKE_BUILD_TYPE=Release \
    ../Vulkan-Headers

  make
}

build() {
  _build i686
  _build x86_64
}

_package() {
  cd ${srcdir}/build-$1
  make DESTDIR="${pkgdir}" install

  install -Dm644 "${srcdir}/Vulkan-Headers/LICENSE.txt" "${pkgdir}/usr/$1-w64-mingw32/share/licenses/vulkan-headers/LICENSE"
}

package() {
  _package i686
  _package x86_64
}
