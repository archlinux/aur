# Contributor: PedroHLC <root@pedrohlc.com>
# Contributor: J. Peter Mugaas <jpmugaas@suddenlink.net>
# Contributor: wirx6 <wirx654@gmail.com>
# based on: https://github.com/Alexpux/MINGW-packages/blob/master/mingw-w64-vulkan-loader/PKGBUILD

_realname=Vulkan-Loader
pkgname=("mingw-w64-vulkan-loader")
pkgver=1.1.96
pkgrel=1
pkgdesc='Vulkan Installable Client Driver (ICD) Loader (mingw-w64)'
arch=('any')
url="https://www.khronos.org/vulkan/"
groups=("mingw-w64-vulkan-devel")
license=('Apache')
depends=("mingw-w64-vulkan-headers")
makedepends=("mingw-w64-cmake"
             "mingw-w64-vulkan-headers"
             "python"
             "git")
_commit=32d33e965089f3e3721a3c0834633e50b45ea903
source=(git+https://github.com/KhronosGroup/Vulkan-Loader.git#commit=${_commit})
options=(!strip !buildflags staticlibs)
sha256sums=('SKIP')

_build() {
  [[ -d ${srcdir}/build-$1 ]] && rm -rf ${srcdir}/build-$1
  mkdir -p ${srcdir}/build-$1 && cd ${srcdir}/build-$1

  $1-w64-mingw32-cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_TESTS=OFF \
    ../${_realname}
  make
}

build() {
  _build i686
  _build x86_64
}

_package() {
  cd ${srcdir}/build-$1
  make DESTDIR="${pkgdir}" install

  install -Dm644 "${srcdir}/${_realname}/LICENSE.txt" "${pkgdir}/usr/$1-w64-mingw32/share/licenses/vulkan-loader/LICENSE"
  $1-w64-mingw32-strip -g "$pkgdir"/usr/$1-w64-mingw32/lib/*.a
}

package() {
  _package i686
  _package x86_64
}
