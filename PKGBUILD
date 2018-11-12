# Maintainer:  Elrondo <elrond94 [at] hotmail [dot] com>
# Contributor: Llewelyn Trahaearn <woefulderelict [at] gmail [dot] com>
# Contributor: Daniel Micay <danielmicay [at] gmail [dot] com>
# Contributor: MThinkCpp <mtc [dot] maintainer [at] outlook [dot] com>

pkgbase=libc++-nocheck
_pkgrealname=libc++
pkgname=(${_pkgrealname}{,abi,experimental}-nocheck)
pkgdesc='Same as libc++ but with no checks'
pkgver=7.0.0
pkgrel=1
url="https://libcxx.llvm.org/"
license=('MIT' 'custom:University of Illinois/NCSA Open Source License')
arch=('i686' 'x86_64')
depends=('gcc-libs')
makedepends=('clang' 'cmake' 'ninja' 'python' 'libunwind')
provides=('libc++')
conflicts=('libc++')
source=("https://releases.llvm.org/$pkgver/llvm-$pkgver.src.tar.xz"
        "https://releases.llvm.org/$pkgver/libcxx-$pkgver.src.tar.xz"
        "https://releases.llvm.org/$pkgver/libcxxabi-$pkgver.src.tar.xz")
noextract=("${source[@]##*/}")
sha512sums=('bdc9b851c158b17e1bbeb7ac5ae49821bfb1251a3826fe8a3932cd1a43f9fb0d620c3de67150c1d9297bf0b86fa917e75978da29c3f751b277866dc90395abec'
            '5ebf8418bc9d311c1744c257ab7a26cf2436a64a47451905df70ec64b12d25ec33acf99e1b9d552fd54ed850bed8f53dffde2ea20292ecd9976eaa31f144caf5'
            '95aa8f60477739e6d6eb6ba1e32c98928e1b8104d18d659336cf7f1c5bfd1ed505015077dfbe39329c0c9d2b5b428d853e5652b0106c0cde317d2d013ebd1cf0')
# see https://releases.llvm.org/download.html
 
prepare() {
  [[ -d llvm ]] || mkdir llvm
  bsdtar --strip-components 1 --uid 0 --gid 0 -zxf \
         ${srcdir}/${source[0]##*/} -C \
         llvm
  [[ -d llvm/projects/libcxx ]] || mkdir llvm/projects/libcxx
  bsdtar --strip-components 1 --uid 0 --gid 0 -zxf \
         ${srcdir}/${source[1]##*/} -C \
         llvm/projects/libcxx
  [[ -d llvm/projects/libcxxabi ]] || mkdir  llvm/projects/libcxxabi
  bsdtar --strip-components 1 --uid 0 --gid 0 -zxf \
         ${srcdir}/${source[2]##*/} -C \
         llvm/projects/libcxxabi
  sed -i 's/CREDITS.TXT/CREDITS/' llvm/projects/libcxx/LICENSE.TXT
  sed -i 's/CREDITS.TXT/CREDITS/' llvm/projects/libcxxabi/LICENSE.TXT
  [[ -d build ]] || mkdir build
}
 
build() {
  cd build
  cmake \
    -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_C_COMPILER=clang \
    -DCMAKE_CXX_COMPILER=clang++ \
    -DLIBCXX_ENABLE_EXPERIMENTAL_LIBRARY=On \
    -DLIBCXX_INSTALL_EXPERIMENTAL_LIBRARY=Off \
    ${srcdir}/llvm
  ninja cxx cxx_experimental
}

package_libc++-nocheck() {
  pkgdesc='LLVM C++ standard library.'
  depends=("libc++abi-nocheck=${pkgver}-${pkgrel}")
  provides=('libc++')
  conflicts=('libc++')
  cd ${srcdir}/build
  DESTDIR="${pkgdir}" ninja install-libcxx

  # Remove ABI headers.
  rm "${pkgdir}/usr/include/c++/v1/cxxabi.h"
  rm "${pkgdir}/usr/include/c++/v1/__cxxabi_config.h"

  # Remove experimental headers.
  rm -rf "${pkgdir}/usr/include/c++/v1/experimental"

  # License.
  install -Dm644 ${srcdir}/llvm/projects/libcxx/CREDITS.TXT "${pkgdir}/usr/share/licenses/${pkgname}/CREDITS"
  install -Dm644 ${srcdir}/llvm/projects/libcxx/LICENSE.TXT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
 
package_libc++abi-nocheck() {
  pkgdesc='Low level support for the LLVM C++ standard library.'
  provides=('libc++abi')
  conflicts=('libc++abi')
  cd ${srcdir}/build
  DESTDIR="${pkgdir}" ninja install-libcxxabi
  install -Dm644 ${srcdir}/build/include/c++/v1/cxxabi.h "${pkgdir}/usr/include/c++/v1/cxxabi.h"
  install -Dm644 ${srcdir}/build/include/c++/v1/__cxxabi_config.h "${pkgdir}/usr/include/c++/v1/__cxxabi_config.h"
  install -Dm644 ${srcdir}/llvm/projects/libcxxabi/CREDITS.TXT "${pkgdir}/usr/share/licenses/${pkgname}/CREDITS"
  install -Dm644 ${srcdir}/llvm/projects/libcxxabi/LICENSE.TXT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
 
package_libc++experimental-nocheck() {
  depends=("libc++=$pkgver-$pkgrel")
  pkgdesc='LLVM C++ experimental library.'
  provides=('libc++experimental')
  conflicts=('libc++experimental')
  install -Dm644 ${srcdir}/build/lib/libc++experimental.a ${pkgdir}/usr/lib/libc++experimental.a
  install -Dm644 -t ${pkgdir}/usr/include/c++/v1/experimental ${srcdir}/build/include/c++/v1/experimental/*
  install -Dm644 ${srcdir}/llvm/projects/libcxx/CREDITS.TXT "${pkgdir}/usr/share/licenses/${pkgname}/CREDITS"
  install -Dm644 ${srcdir}/llvm/projects/libcxx/LICENSE.TXT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
