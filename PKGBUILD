# Maintainer: Grigory Vasilyev <echo "h0tc0d3(-*A*-)g-m*a-i-l(-d#t-)c#m" | sed -e 's/-//ig;s/*//ig;s/(A)/@/i;s/#/o/ig;s/(dot)/./i'>

validpgpkeys=('33ED753E14757D79FA17E57DC4C1F715B2B66B95')

pkgname=llvm12-git
pkgdesc="LLVM 12 Toolchain with clang, clang-tools-extra, compiler-rt, openmp, polly, lldb, lld"
pkgver=12.0.0r32.ga1a197b54ec6
pkgrel=1
arch=('x86_64')
url="https://llvm.org/"
license=('custom:Apache 2.0 with LLVM Exception')
_ocaml_ver=4.11.1

provides=('llvm' 'llvm-libs' 'llvm-ocaml' 'clang' 'clang=11.1.0' 'clang-analyzer' 'clang-tools-extra' 'openmp' 'polly' 'compiler-rt' 'lld' 'lldb')
replaces=('llvm' 'llvm-libs' 'llvm-ocaml' 'clang' 'clang=11.1.0' 'clang-analyzer' 'clang-tools-extra' 'openmp' 'polly' 'compiler-rt' 'lld' 'lldb')
conflicts=('llvm' 'llvm-libs' 'llvm-ocaml' 'clang' 'clang=11.1.0' 'clang-analyzer' 'clang-tools-extra' 'openmp' 'polly' 'compiler-rt' 'lld' 'lldb' 'llvm-git' 'llvm-libs-git' 'llvm-ocaml-git')

makedepends=('cmake' 'libffi' 'libedit' 'ncurses' 'libxml2'
  "ocaml>=$_ocaml_ver" 'ocaml-ctypes' 'ocaml-findlib'
  'python-setuptools' 'python-psutil' 'python-sphinx'
  'python-recommonmark')

_gitbranch="release/12.x"
source=("llvm-project::git+https://github.com/llvm/llvm-project.git#branch=${_gitbranch}"
  'llvm-config.h')

sha256sums=('SKIP'
            '597dc5968c695bbdbb0eac9e8eb5117fcd2773bc91edf5ec103ecffffab8bc48')
sha512sums=('SKIP'
            '75e743dea28b280943b3cc7f8bbb871b57d110a7f2b9da2e6845c1c36bf170dd883fca54e463f5f49e0c3effe07fbd0db0f8cf5a12a2469d3f792af21a73fcdd')
options=('staticlibs')


pkgver() {

  cd "${srcdir:?}/llvm-project" || (
    echo -e "\E[1m\E[31mCan't cd to ${srcdir}/llvm-project build directory! PkgVer Failed! \E[0m"
    exit 1
  )

  git describe --long --tags | cut -f2-4 -d- | sed 's/-/r/;s/-/./'

}

prepare() {

  cd "${srcdir:?}/llvm-project" || (
    echo -e "\E[1m\E[31mCan't cd to ${srcdir}/llvm-project build directory! Prepare Failed! \E[0m"
    exit 1
  )

  #if [ -d build ]; then
  #  rm -rf build
  #fi

}

build() {

  cd "${srcdir:?}/llvm-project" || (
    echo -e "\E[1m\E[31mCan't cd to ${srcdir}/llvm-project build directory! Build Failed! \E[0m"
    exit 1
  )

  cmake -S llvm -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLLVM_BINUTILS_INCDIR=/usr/include \
    -DLLVM_HOST_TRIPLE=$CHOST \
    -DLLVM_BUILD_LLVM_DYLIB=ON \
    -DLLVM_LINK_LLVM_DYLIB=ON \
    -DLLVM_INSTALL_UTILS=ON \
    -DLLVM_ENABLE_RTTI=ON \
    -DLLVM_ENABLE_FFI=ON \
    -DLLVM_BUILD_TESTS=ON \
    -DLLVM_BUILD_DOCS=OFF \
    -DLLVM_ENABLE_SPHINX=OFF \
    -DLLVM_ENABLE_DOXYGEN=OFF \
    -DSPHINX_WARNINGS_AS_ERRORS=OFF \
    -DLLVM_ENABLE_PROJECTS="clang;clang-tools-extra;compiler-rt;openmp;polly;lldb;lld" \
    -DCLANG_LINK_CLANG_DYLIB=ON \
    -DLLDB_USE_SYSTEM_SIX=1 \
    -DLIBOMP_INSTALL_ALIASES=OFF \
    -DPOLLY_ENABLE_GPGPU_CODEGEN=ON

  cmake --build build -- "-j$(nproc)"

}

check() {

  cd "${srcdir:?}/llvm-project/build" || (
    echo -e "\E[1m\E[31mCan't cd to ${srcdir}/llvm-project/build build directory! Check Failed! \E[0m"
    exit 1
  )

  #make "-j$(nproc)" check-llvm
  #make "-j$(nproc)" check-clang
  #make "-j$(nproc)" check-clang-tools
  #make "-j$(nproc)" check-openmp
  #make "-j$(nproc)" check-polly
  #make "-j$(nproc)" check-lldb
  #make "-j$(nproc)" check-lld

}

_python2_optimize() {
  python2 -m compileall "$@"
  python2 -O -m compileall "$@"
}

_python3_optimize() {
  python3 -m compileall "$@"
  python3 -O -m compileall "$@"
  python3 -OO -m compileall "$@"
}

package() {

  cd "${srcdir:?}/llvm-project" || (
    echo -e "\E[1m\E[31mCan't cd to ${srcdir}/llvm-project build directory! Package Failed! \E[0m"
    exit 1
  )

  mkdir -p "${srcdir:?}/llvm-project/build/docs/ocamldoc/html/"

  DESTDIR="${pkgdir:?}" cmake --install build

  pushd llvm/utils/lit || (
    echo -e "\E[1m\E[31mpushd utils/lit - Failed \E[0m"
    exit 1
  )

  python3 setup.py install --root="${pkgdir:?}" -O1
  popd || (
    echo -e "\E[1m\E[31mpopd - Failed \E[0m"
    exit 1
  )

  rm -fr "${pkgdir:?}"/usr/share/doc/${pkgname}/html/{_sources,.buildinfo}

  if [[ $CARCH == x86_64 ]]; then
    mv "${pkgdir:?}/usr/include/llvm/Config/llvm-config"{,-64}.h
    cp "${srcdir:?}/llvm-config.h" "${pkgdir:?}/usr/include/llvm/Config/llvm-config.h"
  fi

  # Clang
  mv "${pkgdir:?}"/usr/libexec/{ccc,c++}-analyzer "${pkgdir:?}/usr/lib/clang/"
  rm -fr "${pkgdir:?}/usr/libexec"
  sed -i 's|libexec|lib/clang|' "${pkgdir:?}/usr/bin/scan-build"

  for _py in 2.7 3.9; do
    install -d "${pkgdir:?}/usr/lib/python$_py/site-packages"
    cp -a clang/bindings/python/clang "${pkgdir:?}/usr/lib/python$_py/site-packages/"
    _python${_py%%.*}_optimize "${pkgdir:?}/usr/lib/python$_py"
  done

  sed -i '1s|/usr/bin/env python$|&2|' \
    "${pkgdir:?}"/usr/share/clang/run-find-all-symbols.py
  touch -d @$SOURCE_DATE_EPOCH "${pkgdir:?}"/usr/share/clang/run-find-all-symbols.py

  _python2_optimize "${pkgdir:?}/usr/share/clang"
  _python3_optimize "${pkgdir:?}/usr/share" -x 'clang-include-fixer|run-find-all-symbols'

}
