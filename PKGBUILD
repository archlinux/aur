# Contributor: luigoalma <at gmail>
# Contributor: PedroHLC <root@pedrohlc.com>
# Contributor: J. Peter Mugaas <jpmugaas@suddenlink.net>
# Contributor: wirx6 <wirx654@gmail.com>
# based of https://git.archlinux.org/svntogit/packages.git/tree/trunk/PKGBUILD?h=packages/vulkan-icd-loader @ 837304b

pkgname=mingw-w64-vulkan-icd-loader
_pkgname=Vulkan-Loader
pkgver=1.1.114
pkgrel=1
pkgdesc="Vulkan Installable Client Driver (ICD) Loader (mingw-w64)"
arch=(any)
url="https://www.khronos.org/vulkan/"
groups=("mingw-w64-vulkan-devel")
license=('APACHE')
makedepends=(mingw-w64-cmake mingw-w64-vulkan-headers python-lxml)
depends=(mingw-w64-crt)
options=(!buildflags staticlibs !strip !emptydirs)
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/KhronosGroup/${_pkgname}/archive/v${pkgver}.tar.gz"
        "001-build-fix.patch"
        "002-proper-def-files-for-32bit.patch"
        "003-generate-pkgconfig-files.patch")
sha256sums=('b5dd14f51f80de38d93dbf25b6a0232e3621507b97122a30534d39a82d89fa6f'
            '64ef57d8551a0b33f63aa98a06c276d5e8e24d9b4ff27347baa8fcb2a39c1295'
            '0182a4c25214fd63290396a23d162dd1e523232a5746e77bec2de1616de31c59'
            '5c189b3f76fa53ad12077cd8932423a0cf385f9464cdde60ba711589ccde19ad')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  # From the PedroHLC's aur package mingw-w64-vulkan-loader
  # which is based of https://github.com/Alexpux/MINGW-packages/blob/master/mingw-w64-vulkan-loader/PKGBUILD
  patch -p1 -i "${srcdir}/001-build-fix.patch"
  patch -p1 -i "${srcdir}/002-proper-def-files-for-32bit.patch"
  patch -p1 -i "${srcdir}/003-generate-pkgconfig-files.patch"
  cd loader
  sed -i'' -E 's/#include <([^>]+)>/#include <\L\1>/g' *.h *.c
  sed -i'' -E 's/target_link_libraries\(([^\)]+)\)/target_link_libraries\(\L\1\)/g' CMakeLists.txt
  # revert back just the vulkan::headers caused by previous sed
  sed -i'' -E 's/vulkan::headers/Vulkan::Headers/g' CMakeLists.txt

  # Added also this because __declspec(thread) was being ultimately ignored,
  # making a non-tls variable of a tls variable.
  # Replaced with __thread instead, of which at least works mingw-w64-gcc with thread model of "posix".
  # Links libwinpthread in this case as effect but doesn't lose the tls properties of the variable.
  # Untested on gcc compiled with a thread model of "win32".
  sed -i'' -E 's/#define THREAD_LOCAL_DECL __declspec\(thread\)/#define THREAD_LOCAL_DECL __thread/g' vk_loader_platform.h
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  export LDFLAGS="-static-libgcc -static -Wl,--enable-stdcall-fixup" # -static to staticly apply libssp and libwinpthread
  export CFLAGS="-Wno-unused-function"
  export CXXFLAGS=$CFLAGS
  export CPPFLAGS=$CFLAGS
  for _arch in ${_architectures}; do
    mkdir build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake \
      -DCMAKE_SHARED_LIBRARY_PREFIX_C="" \
      -DCMAKE_SHARED_LIBRARY_PREFIX_CXX="" \
      -DBUILD_TESTS=Off \
      -DCMAKE_BUILD_TYPE=Release \
      ..
    make
    popd
  done
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  for _arch in ${_architectures}; do
    pushd build-${_arch}
    make DESTDIR="${pkgdir}" install
    popd
    install -Dm644 "LICENSE.txt" "${pkgdir}/usr/${_arch}/share/licenses/vulkan-loader/LICENSE"

    ${_arch}-strip --strip-unneeded "${pkgdir}/usr/${_arch}/bin/"*.dll
    ${_arch}-strip -g "${pkgdir}/usr/${_arch}/lib/"*.a
  done
}
