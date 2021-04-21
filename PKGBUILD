#_                   _ _ _  _ _____ _  _
#| | _______   ____ _| | | || |___  | || |
#| |/ / _ \ \ / / _` | | | || |_ / /| || |_
#|   <  __/\ V / (_| | | |__   _/ / |__   _|
#|_|\_\___| \_/ \__,_|_|_|  |_|/_/     |_|

#Maintainer: kevall474 <kevall474@tuta.io> <https://github.com/kevall474>
#Credits: Evangelos Foutras <evangelos@foutrelis.com>
#Credits: Jan "heftig" Steffens <jan.steffens@gmail.com>

pkgname=clang-stable
pkgdesc='C language family frontend for LLVM'
url='https://clang.llvm.org/'
pkgver=12.0.0
pkgrel=1
arch=('x86_64')
license=('custom:Apache 2.0 with LLVM Exception')
depends=('llvm-libs' 'gcc' 'compiler-rt')
makedepends=('llvm' 'cmake' 'ninja' 'python-sphinx' 'python2')
optdepends=('openmp: OpenMP support in clang with -fopenmp'
            'python: for scan-view and git-clang-format'
            'llvm: referenced by some clang headers')
conflicts=('clang-analyzer' 'clang-tools-extra' 'clang' 'clang-git' 'clang-rc')
replaces=('clang-analyzer' 'clang-tools-extra')
provides=("clang-analyzer" "clang-tools-extra" 'clang')
source=("https://github.com/llvm/llvm-project/releases/download/llvmorg-$pkgver/llvm-project-$pkgver.src.tar.xz")
md5sums=('SKIP')

# Utilizing LLVM_DISTRIBUTION_COMPONENTS to avoid
# installing static libraries; inspired by Gentoo
_get_distribution_components(){
  local target
  ninja -t targets | grep -Po 'install-\K.*(?=-stripped:)' | while read -r target; do
    case $target in
      clang-libraries|distribution)
        continue
        ;;
      clang-tidy-headers)
        continue
        ;;
      clang|clangd|clang-*)
        ;;
      clang*|findAllSymbols)
        continue
        ;;
    esac
    echo $target
  done
}

prepare(){
  if ! dir llvm-project-$pkgver.src/clang/tools/extra; then
    cp -r llvm-project-$pkgver.src/clang-tools-extra llvm-project-$pkgver.src/clang/tools/extra
  fi
}


build(){
  cd llvm-project-$pkgver.src/clang

  rm -rf build

  mkdir build

  cd build

  cmake .. -G Ninja \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_INSTALL_PREFIX=/usr \
  -DPYTHON_EXECUTABLE=/usr/bin/python \
  -DLLVM_LINK_LLVM_DYLIB=ON \
  -DCLANG_LINK_CLANG_DYLIB=ON \
  -DLLVM_ENABLE_RTTI=ON \
  -DLLVM_BUILD_TESTS=OFF \
  -DLLVM_INCLUDE_DOCS=ON \
  -DLLVM_BUILD_DOCS=OFF \
  -DLLVM_ENABLE_SPHINX=OFF \
  -DSPHINX_WARNINGS_AS_ERRORS=OFF \
  -DLLVM_EXTERNAL_LIT=/usr/bin/lit \
  -DLLVM_MAIN_SRC_DIR="$srcdir/llvm-project-$pkgver.src/llvm"


  cmake .. "${cmake_args[@]}"
  local distribution_components=$(_get_distribution_components | paste -sd\;)
  test -n "$distribution_components"
  cmake_args+=(-DLLVM_DISTRIBUTION_COMPONENTS="$distribution_components")

  cmake .. "${cmake_args[@]}"
  ninja
}

_python2_optimize(){
  python2 -m compileall "$@"
  python2 -O -m compileall "$@"
}

_python3_optimize(){
  python3 -m compileall "$@"
  python3 -O -m compileall "$@"
  python3 -OO -m compileall "$@"
}

#_python_optimize() {
#  python -m compileall "$@"
#  python -O -m compileall "$@"
#  python -OO -m compileall "$@"
#}

package(){
  DESTDIR="$pkgdir" ninja -C llvm-project-$pkgver.src/clang/build/ install-distribution
  install -Dm644 llvm-project-$pkgver.src/clang/LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Remove documentation sources
  #rm -r "$pkgdir"/usr/share/doc/clang{,-tools}/html/{_sources,.buildinfo}
  #rm -r "$pkgdir"/usr/share/doc/clang/html/{_sources,.buildinfo}

  # Move analyzer scripts out of /usr/libexec
  mv "$pkgdir"/usr/libexec/{ccc,c++}-analyzer "$pkgdir/usr/lib/clang/"
  rmdir "$pkgdir/usr/libexec"
  sed -i 's|libexec|lib/clang|' "$pkgdir/usr/bin/scan-build"

  # Install Python bindings
  for _py in 2.7 3.9; do
    install -d "$pkgdir/usr/lib/python$_py/site-packages"
    cp -a llvm-project-$pkgver.src/clang/bindings/python/clang "$pkgdir/usr/lib/python$_py/site-packages/"
    _python${_py%%.*}_optimize "$pkgdir/usr/lib/python$_py"
  done

  # Fix shebang in Python 2 script
  sed -i '1s|/usr/bin/env python$|&2|' "$pkgdir"/usr/share/clang/run-find-all-symbols.py
  touch -d @$SOURCE_DATE_EPOCH "$pkgdir"/usr/share/clang/run-find-all-symbols.py

  # Compile Python scripts
  _python2_optimize "$pkgdir/usr/share/clang"
  _python3_optimize "$pkgdir/usr/share" -x 'clang-include-fixer|run-find-all-symbols'

  #_py="3.9"
  #cd llvm-project
  # Install Python bindings and optimize them
  #cp -a llvm/bindings/python/llvm  "$pkgdir"/usr/lib/python$_py/site-packages/
  #cp -a clang/bindings/python/clang  "$pkgdir"/usr/lib/python$_py/site-packages/
  #_python_optimize "$pkgdir"/usr/lib/python$_py/site-packages

  #optimize other python files except 2 problem cases
  #_python_optimize "$pkgdir"/usr/share -x 'clang-include-fixer|run-find-all-symbols'
}
