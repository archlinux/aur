# Maintainer: Dan Fuhry <dan@fuhry.com>
# Original author: Anatol Pomozov
# Contributor: Llewelyn Trahaearn <woefulderelict [at] gmail [dot] com>
# Contributor: Daniel Micay <danielmicay [at] gmail [dot] com>
# Contributor: MThinkCpp <mtc [dot] maintainer [at] outlook [dot] com>

_oldver=18
pkgbase="libc++${_oldver}"
pkgname=("libc++${_oldver}" "libc++abi${_oldver}")
pkgver=18.1.8
pkgrel=2
url="https://libcxx.llvm.org/"
license=('custom:Apache 2.0 with LLVM Exception')
arch=('x86_64')
depends=('gcc-libs')
makedepends=("clang${_oldver}" 'cmake' 'libunwind' 'ninja' 'python' 'python-setuptools')
checkdepends=("llvm${_oldver}")
options=(!lto)
source=("https://github.com/llvm/llvm-project/releases/download/llvmorg-$pkgver/llvm-project-$pkgver.src.tar.xz"{,.sig})
sha512sums=('25eeee9984c8b4d0fbc240df90f33cbb000d3b0414baff5c8982beafcc5e59e7ef18f6f85d95b3a5f60cb3d4cd4f877c80487b5768bc21bc833f107698ad93db'
            'SKIP')
validpgpkeys=('474E22316ABF4785A88C6E8EA2C794A986419D8A') # Tom Stellard <tstellar@redhat.com>
 
prepare() {
  mkdir -p build

  cd "llvm-project-${pkgver}.src"

  for f in ${source[@]}; do
    # test that "$f" ends in ".patch"
    if [ "${f%.patch}" != "$f" ]; then
      msg "Applying patch: $f"
      patch -Np1 -i "../$f"
    fi
  done

  sed -i 's/CREDITS.TXT/CREDITS/' libcxx{,abi}/LICENSE.TXT
}
 
build() {
  cd "${srcdir}/llvm-project-${pkgver}.src"
  python "llvm/utils/lit/setup.py" build
  export PYTHONPATH="$(pwd)/llvm/utils/lit/build/lib"

  cd "${srcdir}/build"

  cmake \
    -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr/lib/llvm${_oldver} \
    -DCMAKE_C_COMPILER=/usr/lib/llvm${_oldver}/bin/clang \
    -DCMAKE_CXX_COMPILER=/usr/lib/llvm${_oldver}/bin/clang++ \
    -DCMAKE_C_FLAGS=-fPIC \
    -DCMAKE_CXX_FLAGS=-fPIC \
    -DLLVM_ENABLE_RUNTIMES="libcxx;libcxxabi;libunwind" \
    -DLLVM_EXTERNAL_LIT="${srcdir}/llvm-project-${pkgver}.src/llvm/utils/lit/lit.py" \
    ../llvm-project-$pkgver.src/runtimes
  ninja cxx cxxabi cxx_experimental
}

check() {
  ninja -C build check-cxx check-cxxabi
}

# Do not remove the space before the () or commitpkg will
# accidentally to run this function on the system (!!!) 
_package_libc++ () {
  pkgdesc='LLVM C++ standard library.'
  depends=("libc++abi${_oldver}=$pkgver-$pkgrel")
  options=('staticlibs')

  DESTDIR="$pkgdir" ninja -C build install-cxx

  install -Dm0644 llvm-project-$pkgver.src/libcxx/CREDITS.TXT "$pkgdir"/usr/share/licenses/"$pkgname"/CREDITS
  install -Dm0644 llvm-project-$pkgver.src/libcxx/LICENSE.TXT "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
 
_package_libc++abi() {
  pkgdesc='Low level support for the LLVM C++ standard library.'
  options=('staticlibs')
  
  DESTDIR="$pkgdir" ninja -C build install-cxxabi
  install -Dm0644 llvm-project-$pkgver.src/libcxxabi/CREDITS.TXT "$pkgdir"/usr/share/licenses/"$pkgname"/CREDITS
  install -Dm0644 llvm-project-$pkgver.src/libcxxabi/LICENSE.TXT "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
 
eval "package_libc++${_oldver} () { _package_libc++; }"
eval "package_libc++abi${_oldver} () { _package_libc++abi; }"
