# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>

pkgname=('llvm10' 'llvm10-libs')
pkgver=10.0.1
pkgrel=2
arch=('x86_64')
url="https://llvm.org/"
license=('custom:Apache 2.0 with LLVM Exception')
makedepends=('cmake' 'ninja' 'libffi' 'libedit' 'ncurses' 'libxml2'
             'python-sphinx' 'python-recommonmark' 'python-setuptools')
options=('staticlibs')
source=("https://github.com/llvm/llvm-project/releases/download/llvmorg-$pkgver/llvm-$pkgver.src.tar.xz"
        "llvm-config.h"
        "benchmark-register-fix.patch")
sha256sums=('c5d8e30b57cbded7128d78e5e8dad811bff97a8d471896812f57fa99ee82cdf3'
            '597dc5968c695bbdbb0eac9e8eb5117fcd2773bc91edf5ec103ecffffab8bc48'
            '6ea7fec524215f021bf4507da67247707c87640c9ec2b3314a71d1aa9c043158')
validpgpkeys+=('B6C8F98282B944E3B0D5C2530FC3042E345AD05D') # Hans Wennborg <hans@chromium.org>
validpgpkeys+=('474E22316ABF4785A88C6E8EA2C794A986419D8A') # Tom Stellard <tstellar@redhat.com>

prepare() {
  cd "$srcdir/llvm-$pkgver.src"
  patch -Np1 -i ../benchmark-register-fix.patch

  mkdir build
}

build() {
  cd "$srcdir/llvm-$pkgver.src/build"

  cmake .. -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/opt/llvm10 \
    -DLLVM_HOST_TRIPLE=$CHOST \
    -DLLVM_BUILD_LLVM_DYLIB=ON \
    -DLLVM_LINK_LLVM_DYLIB=ON \
    -DLLVM_INSTALL_UTILS=ON \
    -DLLVM_ENABLE_RTTI=ON \
    -DLLVM_ENABLE_FFI=ON \
    -DLLVM_EXPERIMENTAL_TARGETS_TO_BUILD=AVR \
    -DLLVM_BUILD_TESTS=OFF \
    -DLLVM_BUILD_DOCS=OFF \
    -D LLVM_INCLUDE_DOCS=OFF \
    -D LLVM_ENABLE_OCAMLDOC=OFF \
    -DSPHINX_WARNINGS_AS_ERRORS=OFF \
    -DLLVM_BINUTILS_INCDIR=/opt/llvm10/include
  ninja all
}

package_llvm10() {
  pkgdesc="Collection of modular and reusable compiler and toolchain technologies"
  depends=('llvm10-libs' 'perl')
  optdepends=('python-setuptools: for using lit (LLVM Integrated Tester)')

  cd "$srcdir/llvm-$pkgver.src/build"

  DESTDIR="$pkgdir" ninja install

  # Include lit for running lit-based tests in other projects
  pushd ../utils/lit
  python3 setup.py install --root="$pkgdir" -O1
  popd

  # The runtime libraries go into llvm-libs
  mv -f "$pkgdir"/opt/llvm10/lib/lib{LLVM,LTO,Remarks}*.so* "$srcdir"
  mv -f "$pkgdir"/opt/llvm10/lib/LLVMgold.so "$srcdir"

  if [[ $CARCH == x86_64 ]]; then
    # Needed for multilib (https://bugs.archlinux.org/task/29951)
    # Header stub is taken from Fedora
    mv "$pkgdir/opt/llvm10/include/llvm/Config/llvm-config"{,-64}.h
    cp "$srcdir/llvm-config.h" "$pkgdir/opt/llvm10/include/llvm/Config/llvm-config.h"
  fi

  cp -rf "$pkgdir"/usr/{bin,lib} "$pkgdir/opt/llvm10"
  rm -rf "$pkgdir"/usr

  install -Dm644 ../LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_llvm10-libs() {
  pkgdesc="LLVM runtime libraries"
  depends=('gcc-libs' 'zlib' 'libffi' 'libedit' 'ncurses' 'libxml2')

  install -d "$pkgdir/opt/llvm10/lib"
  cp -P \
    "$srcdir"/lib{LLVM,LTO,Remarks}*.so* \
    "$srcdir"/LLVMgold.so \
    "$pkgdir/opt/llvm10/lib/"

  # Symlink LLVMgold.so from /usr/lib/bfd-plugins
  # https://bugs.archlinux.org/task/28479
  install -d "$pkgdir/opt/llvm10/lib/bfd-plugins"
  ln -s ../LLVMgold.so "$pkgdir/opt/llvm10/lib/bfd-plugins/LLVMgold.so"

  install -Dm644 "/dev/null" \
    "$pkgdir/etc/ld.so.conf.d/70-llvm10-libs.conf"

  echo "/opt/llvm10/lib" > "$pkgdir/etc/ld.so.conf.d/70-llvm10-libs.conf"

  install -Dm644 "$srcdir/llvm-$pkgver.src/LICENSE.TXT" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
