# Maintainer: Dan Fuhry <dan@fuhry.com>
# Original author: Anatol Pomozov
# Contributor: Llewelyn Trahaearn <woefulderelict [at] gmail [dot] com>
# Contributor: Daniel Micay <danielmicay [at] gmail [dot] com>
# Contributor: MThinkCpp <mtc [dot] maintainer [at] outlook [dot] com>

_oldver=14
pkgbase="libc++${_oldver}"
pkgname=("libc++${_oldver}" "libc++abi${_oldver}" "libc++experimental${_oldver}")
pkgver=14.0.6
pkgrel=1
url="https://libcxx.llvm.org/"
license=('custom:Apache 2.0 with LLVM Exception')
arch=('x86_64')
depends=('gcc-libs')
makedepends=("clang${_oldver}" 'cmake' 'ninja' 'python' 'python-setuptools')
checkdepends=("llvm${_oldver}")
options=(!lto)
source=("https://github.com/llvm/llvm-project/releases/download/llvmorg-$pkgver/llvm-project-$pkgver.src.tar.xz"{,.sig}
        "0001-replace-pipes-quote-with-shlex-quote.patch")
sha512sums=('6fc6eeb60fac698702d1aac495fc0161eb7216a1f8db2020af8fccec5837831f7cc20dc2a169bf4f0b5f520748280b4a86621f3697d622aa58faaa45dbfaad13'
            'SKIP'
            '8ce5abb6f2390f8bd4a8b4aed305f3b54d687054f62bf74e6d4096cdac2decbed06dbdd635f18f9c75d8c7674d5aaaa8ba88041dd67d1c3ed0da4b9b2e45ec46')
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
    -DLLVM_ENABLE_RUNTIMES="libcxx;libcxxabi" \
    -DLLVM_EXTERNAL_LIT="${srcdir}/llvm-project-${pkgver}.src/llvm/utils/lit/lit.py" \
    -DLIBCXX_INSTALL_EXPERIMENTAL_LIBRARY=NO \
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
 
_package_libc++experimental() {
  depends=("libc++${_oldver}=$pkgver-$pkgrel")
  pkgdesc='LLVM C++ experimental library.'
  
  install -Dm0644 -t "$pkgdir"/usr/lib/llvm${_oldver}/lib/ build/lib/libc++experimental.a
  install -Dm0644 llvm-project-$pkgver.src/libcxx/CREDITS.TXT "$pkgdir"/usr/share/licenses/"$pkgname"/CREDITS
  install -Dm0644 llvm-project-$pkgver.src/libcxx/LICENSE.TXT "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}

eval "package_libc++${_oldver} () { _package_libc++; }"
eval "package_libc++abi${_oldver} () { _package_libc++abi; }"
eval "package_libc++experimental${_oldver} () { _package_libc++experimental; }"
