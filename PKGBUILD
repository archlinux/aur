# Contributor: PedroHLC <root@pedrohlc.com>
# Contributor: J. Peter Mugaas <jpmugaas@suddenlink.net>
# Contributor: wirx6 <wirx654@gmail.com>
# based on: https://github.com/Alexpux/MINGW-packages/blob/master/mingw-w64-vulkan-loader/PKGBUILD

_realname=Vulkan-Loader
pkgname=("mingw-w64-vulkan-loader")
pkgver=1.1.92
pkgrel=1
pkgdesc='Vulkan Installable Client Driver (ICD) Loader (mingw-w64)'
arch=('any')
url="https://www.khronos.org/vulkan/"
groups=("mingw-w64-vulkan-devel")
license=('Apache')
depends=("mingw-w64-vulkan-headers")
makedepends=("mingw-w64-cmake"
             "mingw-w64-vulkan-headers"
             "mingw-w64-python3"
             "git")
_commit=a29f808461116a33caed15529fc10a0285dd3d70
source=(git+https://github.com/KhronosGroup/Vulkan-Loader.git#commit=${_commit}
        001-build-fix.patch
        002-proper-def-files-for-32bit.patch
        003-generate-pkgconfig-files.patch)
options=(!strip !buildflags staticlibs)
sha256sums=('SKIP'
            '64ef57d8551a0b33f63aa98a06c276d5e8e24d9b4ff27347baa8fcb2a39c1295'
            '9fa83968486c97a2c79295dadd6be5cba4382d5083caa6fa73ce78e9f80be8be'
            '5c189b3f76fa53ad12077cd8932423a0cf385f9464cdde60ba711589ccde19ad')

prepare() {
  cd ${srcdir}/${_realname}
  patch -p1 -i ${srcdir}/001-build-fix.patch
  patch -p1 -i ${srcdir}/002-proper-def-files-for-32bit.patch
  patch -p1 -i ${srcdir}/003-generate-pkgconfig-files.patch
}

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
