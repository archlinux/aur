# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
# Contributor: Luchesar V. ILIEV <luchesar%2eiliev%40gmail%2ecom>
# Contributor: Anders Bergh <anders@archlinuxppc.org>
# Contributor: Armin K. <krejzi at email dot com>
# Contributor: Christian Babeux <christian.babeux@0x80.ca>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Roberto Alsina <ralsina@kde.org>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Tomas Lindquist Olsen <tomas@famolsen.dk>
# Contributor: Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>

pkgname=lib32-llvm-git
_pkgname='llvm'
pkgdesc="Collection of modular and reusable compiler and toolchain technologies (32-bit, git)"
pkgver=9.0.0_r313674.af7314b3179
pkgrel=1
arch=('x86_64')
url='https://llvm.org/'
license=('custom:University of Illinois/NCSA Open Source License')
makedepends=(
  'cmake'
  'gcc-multilib'
  'git'
  'lib32-libffi'
  'lib32-libxml2'
  'lib32-zlib'
  'ninja'
  'python')
depends=(
  'lib32-gcc-libs'
  'lib32-libffi'
  'lib32-libxml2'
  'lib32-ncurses'
  'lib32-zlib')
provides=(
  'lib32-clang'
  'lib32-clang-git'
  'lib32-clang-svn'
  'lib32-llvm-libs'
  'lib32-llvm-libs-git'
  'lib32-llvm-libs-svn'
  'lib32-llvm-svn')
conflicts=(
  'lib32-clang'
  'lib32-clang-git'
  'lib32-clang-svn'
  'lib32-llvm'
  'lib32-llvm-libs'
  'lib32-llvm-libs-git'
  'lib32-llvm-libs-svn'
  'lib32-llvm-svn')
# this is always the latest svn so debug info can be useful
options=('staticlibs' '!strip')

source=("${_pkgname}::git+https://github.com/llvm/llvm-project.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}/${_pkgname}"

    # This will almost match the output of `llvm-config --version` when the
    # LLVM_APPEND_VC_REV cmake flag is turned on. The only difference is
    # dash being replaced with underscore because of Pacman requirements.
    local _pkgver=$(awk -F 'MAJOR |MINOR |PATCH |SUFFIX |)' \
            'BEGIN { ORS="." ; i=0 } \
             /set\(LLVM_VERSION_/ { print $2 ; i++ ; if (i==2) ORS="" } \
             END { print "\n" }' \
             CMakeLists.txt)_r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
    echo "${_pkgver//svn}"
}

prepare() {
    mkdir -p "${srcdir}/build"
}

build() {
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd "${srcdir}/build"
  cmake -G Ninja \
    -DLLVM_ENABLE_PROJECTS='clang' \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DPYTHON_EXECUTABLE=/usr/bin/python \
    -DLLVM_LIBDIR_SUFFIX=32 \
    -DCMAKE_C_FLAGS:STRING=-m32 \
    -DCMAKE_CXX_FLAGS:STRING=-m32 \
    -DLLVM_TARGET_ARCH:STRING=i686 \
    -DLLVM_CONFIG="/usr/bin/llvm-config32" \
    -DLLVM_HOST_TRIPLE=$CHOST \
    -DLLVM_DEFAULT_TARGET_TRIPLE="i686-pc-linux-gnu" \
    -DLLVM_BUILD_LLVM_DYLIB=ON \
    -DLLVM_LINK_LLVM_DYLIB=ON \
    -DLLVM_ENABLE_BINDINGS=OFF \
    -DLLVM_ENABLE_RTTI=ON \
    -DLLVM_ENABLE_FFI=ON \
    -DLLVM_BUILD_TESTS=ON \
    -DLLVM_BUILD_DOCS=OFF \
    -DLLVM_ENABLE_SPHINX=OFF \
    -DLLVM_ENABLE_DOXYGEN=OFF \
    -DFFI_INCLUDE_DIR=$(pkg-config --variable=includedir libffi) \
    -DLLVM_BINUTILS_INCDIR=/usr/include \
    "../${_pkgname}/${_pkgname}"

  ninja all
}

check() {
  cd "${srcdir}/build"
  ninja check
}

package() { 
  cd "${srcdir}/build"

  DESTDIR="$pkgdir" ninja install

  # Fix permissions of static libs
  chmod -x "$pkgdir"/usr/lib32/*.a

  mv "$pkgdir/usr/bin/llvm-config" "$pkgdir/usr/lib32/llvm-config"
  mv "$pkgdir/usr/include/llvm/Config/llvm-config.h" \
    "$pkgdir/usr/lib32/llvm-config-32.h"

  rm -rf "$pkgdir"/usr/{bin,include,libexec,share/{doc,man,llvm,opt-viewer,scan-build,scan-view,clang}}
      
  # Needed for multilib (https://bugs.archlinux.org/task/29951)
  # Header stub is taken from Fedora
  install -d "$pkgdir/usr/include/llvm/Config"
  mv "$pkgdir/usr/lib32/llvm-config-32.h" "$pkgdir/usr/include/llvm/Config/"

  # mv "$pkgdir/usr/lib32/llvm-config" "$pkgdir/usr/bin/llvm-config32"

  install -d "$pkgdir/usr/lib32"

  # Symlink LLVMgold.so from /usr/lib/bfd-plugins
  # https://bugs.archlinux.org/task/28479
  install -d "$pkgdir/usr/lib32/bfd-plugins"
  ln -s ../LLVMgold.so "$pkgdir/usr/lib32/bfd-plugins/LLVMgold.so"

  install -D -m 0644 "${srcdir}/${_pkgname}/${_pkgname}/LICENSE.TXT" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}