# Contributor: PedroHLC <root@pedrohlc.com>
# Contributor: J. Peter Mugaas <jpmugaas@suddenlink.net>
# Contributor: wirx6 <wirx654@gmail.com>
# based on: https://github.com/Alexpux/MINGW-packages/blob/master/mingw-w64-vulkan-headers/PKGBUILD

_realname=Vulkan-Headers
pkgbase=mingw-w64-vulkan-headers
pkgname=("mingw-w64-vulkan-headers")
pkgver=1.1.92
pkgrel=1
pkgdesc='Vulkan header files (mingw-w64)'
arch=('any')
url="https://www.khronos.org/vulkan/"
groups=("mingw-w64-vulkan-devel")
license=('Apache')
depends=("mingw-w64-crt")
makedepends=("mingw-w64-cmake" "mingw-w64-gcc" "git")
_commit=114c3546e195819bd53a34b39f5194b2989a5b12
source=(git+https://github.com/KhronosGroup/Vulkan-Headers.git#commit=${_commit})
sha256sums=('SKIP')
options=(!strip !buildflags staticlibs)

_build() {
  [[ -d ${srcdir}/build-$1 ]] && rm -rf ${srcdir}/build-$1
  mkdir -p ${srcdir}/build-$1 && cd ${srcdir}/build-$1

  CFLAGS+=" -D__STDC_FORMAT_MACROS" \
  CPPFLAGS+=" -D__STDC_FORMAT_MACROS" \
  CXXFLAGS+=" -D__USE_MINGW_ANSI_STDIO -D__STDC_FORMAT_MACROS -fpermissive" \
  MSYS2_ARG_CONV_EXCL="-DCMAKE_INSTALL_PREFIX=" \
  /usr/$1-w64-mingw32/bin/cmake \
    -G"MSYS Makefiles" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr/$1-w64-mingw32 \
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

  install -Dm644 "${srcdir}/Vulkan-Headers/LICENSE.TXT" "${pkgdir}/usr/$1-w64-mingw32/share/licenses/vulkan-headers/LICENSE"
}

package() {
  _package i686
  _package x86_64
}
