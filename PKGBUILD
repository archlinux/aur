# Maintainer: Llewelyn Trahaearn <woefulderelict [at] gmail [dot] com>
# Contributor: Daniel Micay <danielmicay [at] gmail [dot] com>
# Contributor: MThinkCpp <mtc [dot] maintainer [at] outlook [dot] com>

pkgbase=('libc++')
pkgname=("${pkgbase}" "${pkgbase}abi" "${pkgbase}experimental")
pkgver=3.9.1
pkgrel=1
url="http://libcxx.llvm.org/"
license=('MIT' 'custom:University of Illinois/NCSA Open Source License')
arch=('i686' 'x86_64')
depends=('gcc-libs')
makedepends=('clang' 'cmake' 'python' 'libunwind')
source=("http://llvm.org/releases/$pkgver/llvm-$pkgver.src.tar.xz"{,.sig}
        "http://llvm.org/releases/$pkgver/libcxx-$pkgver.src.tar.xz"{,.sig}
        "http://llvm.org/releases/$pkgver/libcxxabi-$pkgver.src.tar.xz"{,.sig})
noextract=("${source[@]##*/}")
sha512sums=('50cbe8ee911080f586e77861c442348701bd02e2de0c090c54c34f82ac275ecfcd712af0f41e387c33b4a6057778a4258a27554292fe68ab4af3fd9dd6d90683'
            'SKIP'
            'a5976e4096624a7307b3e43f4a22ac2dc74572226e0f57af9f3ef537a14c3cff1601b7042aef9dc40a0ee53ca76b08d72eb9c253dcf34f115d3153c302db7070'
            'SKIP'
            '4f5603f1476b759c86d4784728fbdd212c59b30dc56d787c1834bf68a9cd83071fa22658d24e5a58beb94c0c656b0e4457d7da6e3048715dd36bd68380fc336e'
            'SKIP')
validpgpkeys=(# Tom Stellard <tom@stellard.net> (.1 releases)
              # https://pgp.mit.edu/pks/lookup?op=get&search=0x8F0871F202119294
              11E521D646982372EB577A1F8F0871F202119294
              # Hans Wennborg <hans@chromium.org> (.0 releases)
              # http://releases.llvm.org/3.8.0/hans-gpg-key.asc
              B6C8F98282B944E3B0D5C2530FC3042E345AD05D)
 
prepare() {
  [[ -d llvm ]] || mkdir llvm
  bsdtar --strip-components 1 --uid 0 --gid 0 -zxf \
         ${srcdir}/${source[0]##*/} -C \
         llvm
  [[ -d llvm/projects/libcxx ]] || mkdir llvm/projects/libcxx
  bsdtar --strip-components 1 --uid 0 --gid 0 -zxf \
         ${srcdir}/${source[2]##*/} -C \
         llvm/projects/libcxx
  [[ -d llvm/projects/libcxxabi ]] || mkdir  llvm/projects/libcxxabi
  bsdtar --strip-components 1 --uid 0 --gid 0 -zxf \
         ${srcdir}/${source[4]##*/} -C \
         llvm/projects/libcxxabi
  sed -i 's/CREDITS.TXT/CREDITS/' llvm/projects/libcxx/LICENSE.TXT
  sed -i 's/CREDITS.TXT/CREDITS/' llvm/projects/libcxxabi/LICENSE.TXT
  [[ -d build ]] || mkdir build
}
 
build() {
  cd build
  CC=clang CXX=clang++ cmake \
    -G "Unix Makefiles" \
    -DLIBCXX_ENABLE_EXPERIMENTAL_LIBRARY=On \
    -DLIBCXX_INSTALL_EXPERIMENTAL_LIBRARY=Off \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    ${srcdir}/llvm
  make cxx cxx_experimental
}

package_libc++() {
  pkgdesc='A new implementation of the C++ standard library, targeting C++11.'
  depends=("libc++abi=${pkgver}-${pkgrel}")
  cd ${srcdir}/build
  make DESTDIR="${pkgdir}" install-libcxx
  install -Dm644 ${srcdir}/llvm/projects/libcxx/CREDITS.TXT "${pkgdir}/usr/share/licenses/${pkgname}/CREDITS"
  install -Dm644 ${srcdir}/llvm/projects/libcxx/LICENSE.TXT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
 
package_libc++abi() {
  pkgdesc='A new implementation of low level support for a standard C++ library'
  cd ${srcdir}/build
  make DESTDIR="${pkgdir}" install-libcxxabi
  install -Dm644 ${srcdir}/llvm/projects/libcxxabi/CREDITS.TXT "${pkgdir}/usr/share/licenses/${pkgname}/CREDITS"
  install -Dm644 ${srcdir}/llvm/projects/libcxxabi/LICENSE.TXT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
 
package_libc++experimental() {
  depends=("libc++=$pkgver-$pkgrel")
  pkgdesc='A new implementation of the C++ standard library, targeting C++11 (experimental library)'
  install -Dm644 ${srcdir}/build/lib/libc++experimental.a ${pkgdir}/usr/lib/libc++experimental.a
  install -Dm644 ${srcdir}/llvm/projects/libcxx/CREDITS.TXT "${pkgdir}/usr/share/licenses/${pkgname}/CREDITS"
  install -Dm644 ${srcdir}/llvm/projects/libcxx/LICENSE.TXT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
