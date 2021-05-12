# Maintainer: Grigory Vasilyev <echo "h0tc0d3(-*A*-)g-m*a-i-l(-d#t-)c#m" | sed -e 's/-//ig;s/*//ig;s/(A)/@/i;s/#/o/ig;s/(dot)/./i'>

validpgpkeys=('33ED753E14757D79FA17E57DC4C1F715B2B66B95')

pkgname=llvm12-git
pkgdesc="LLVM 12 Toolchain with clang, clang-tools-extra, compiler-rt, openmp, polly, lldb, lld"
pkgver=12.0.1_r44.g877a07bfb3b9
pkgrel=2
arch=('x86_64')
url="https://llvm.org/"
license=('custom:Apache 2.0 with LLVM Exception')

provides=('llvm' 'llvm-libs' 'llvm-ocaml' 'clang' 'clang=11.1.0' 'clang-analyzer' 'clang-tools-extra' 'openmp' 'polly' 'compiler-rt' 'lld' 'lldb')
replaces=('llvm' 'llvm-libs' 'llvm-ocaml' 'clang' 'clang=11.1.0' 'clang-analyzer' 'clang-tools-extra' 'openmp' 'polly' 'compiler-rt' 'lld' 'lldb')
conflicts=('llvm' 'llvm-libs' 'llvm-ocaml' 'clang' 'clang=11.1.0' 'clang-analyzer' 'clang-tools-extra' 'openmp' 'polly' 'compiler-rt' 'lld' 'lldb' 'llvm-git' 'llvm-libs-git' 'llvm-ocaml-git')

_ocaml_ver=4.11.1
makedepends=('git' 'ninja' 'cmake' 'libffi' 'libedit' 'ncurses' 'libxml2'
  "ocaml>=$_ocaml_ver" 'ocaml-ctypes' 'ocaml-findlib'
  'python-setuptools' 'python-psutil' 'python-sphinx'
  'python-recommonmark')

_gitbranch="release/12.x"
source=(
  "llvm-project::git+https://github.com/llvm/llvm-project.git#branch=${_gitbranch}"
  'llvm-config.h')

sha256sums=('SKIP'
  '597dc5968c695bbdbb0eac9e8eb5117fcd2773bc91edf5ec103ecffffab8bc48')
sha512sums=('SKIP'
  '75e743dea28b280943b3cc7f8bbb871b57d110a7f2b9da2e6845c1c36bf170dd883fca54e463f5f49e0c3effe07fbd0db0f8cf5a12a2469d3f792af21a73fcdd')
options=('staticlibs')

_extra_build_flags=""

pkgver() {

  cd "${srcdir:?}/llvm-project" || (
    echo -e "\E[1m\E[31mCan't cd to ${srcdir}/llvm-project build directory! PkgVer Failed! \E[0m"
    exit 1
  )

  echo "$(
    sed -nE "/LLVM_VERSION_MAJOR/{:a;N;/LLVM_VERSION_SUFFIX/Ta};0,/LLVM_VERSION_MAJOR/D;p" \
      llvm/CMakeLists.txt |
      grep -oP "\d+" |
      xargs | tr ' ' '.'
  )_r$(
    git describe --long --tags |
      cut -f3-4 -d- | tr '-' '.'
  )"

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

  while true; do
    echo -e "\n\E[1m\E[33mBuild with clang and llvm toolchain (Y/N)? \E[0m"
    read -r yn
    case ${yn} in
    [Yy]*)
      export LLVM=1
      export LLVM_IAS=1
      export CC=clang
      export CXX=clang++
      export LD=ld.lld
      export AR=llvm-ar
      export NM=llvm-nm
      export STRIP=llvm-strip
      export OBJCOPY=llvm-objcopy
      export OBJDUMP=llvm-objdump
      export READELF=llvm-readelf
      export HOSTCC=clang
      export HOSTCXX=clang++
      export HOSTAR=llvm-ar
      export HOSTLD=ld.lld
      export DEBUG_CFLAGS="-g"
      export DEBUG_CXXFLAGS="${DEBUG_CFLAGS}"
      _extra_build_flags="-DLLVM_USE_LINKER=lld"
      break
      ;;
    [Nn]*) break ;;
    *) echo -e "\E[1m\E[31mPlease answer Y or N! \E[0m" ;;
    esac
  done

  cmake -S llvm -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLLVM_BINUTILS_INCDIR=/usr/include \
    ${_extra_build_flags} \
    -DLLVM_HOST_TRIPLE="${CHOST}" \
    -DLLVM_BUILD_LLVM_DYLIB=ON \
    -DLLVM_LINK_LLVM_DYLIB=ON \
    -DLLVM_INSTALL_UTILS=ON \
    -DLLVM_ENABLE_RTTI=ON \
    -DLLVM_ENABLE_FFI=ON \
    -DLLVM_BUILD_TESTS=ON \
    -DLLVM_BUILD_DOCS=ON \
    -DLLVM_ENABLE_SPHINX=ON \
    -DLLVM_ENABLE_DOXYGEN=OFF \
    -DSPHINX_WARNINGS_AS_ERRORS=OFF \
    -DLLVM_ENABLE_PROJECTS="clang;clang-tools-extra;compiler-rt;polly;lldb;lld;openmp" \
    -DCLANG_LINK_CLANG_DYLIB=ON \
    -DLLDB_USE_SYSTEM_SIX=1 \
    -DLIBOMP_INSTALL_ALIASES=OFF \
    -DPOLLY_ENABLE_GPGPU_CODEGEN=ON \
    -Wno-dev

  ninja -C build "${NINJAFLAGS}"
  ninja -C build "${NINJAFLAGS}" ocaml_doc

}

check() {

  cd "${srcdir:?}/llvm-project" || (
    echo -e "\E[1m\E[31mCan't cd to ${srcdir}/llvm-project/build build directory! Check Failed! \E[0m"
    exit 1
  )

  #ninja -C build "${NINJAFLAGS}" check-llvm
  #ninja -C build "${NINJAFLAGS}" check-clang
  #ninja -C build "${NINJAFLAGS}" check-clang-tools
  #ninja -C build "${NINJAFLAGS}" check-openmp
  #ninja -C build "${NINJAFLAGS}" check-polly
  #ninja -C build "${NINJAFLAGS}" check-lldb
  #ninja -C build "${NINJAFLAGS}" check-lld

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

  DESTDIR="${pkgdir:?}" ninja -C build "${NINJAFLAGS}" install

  pushd llvm/utils/lit || (
    echo -e "\E[1m\E[31mpushd utils/lit - Package Failed! \E[0m"
    exit 1
  )

  python3 setup.py install --root="${pkgdir:?}" -O1
  popd || (
    echo -e "\E[1m\E[31mpopd - Package Failed!  \E[0m"
    exit 1
  )

  if [[ $CARCH == x86_64 ]]; then
    mv "${pkgdir:?}/usr/include/llvm/Config/llvm-config"{,-64}.h
    cp "${srcdir:?}/llvm-config.h" "${pkgdir:?}/usr/include/llvm/Config/llvm-config.h"
  fi
  
  # Symlink LLVMgold.so from /usr/lib/bfd-plugins
  # https://bugs.archlinux.org/task/28479
  mkdir -p "${pkgdir:?}/usr/lib/bfd-plugins"
  ln -s ../LLVMgold.so "${pkgdir:?}/usr/lib/bfd-plugins/LLVMgold.so"

  # Clang
  mv "${pkgdir:?}"/usr/libexec/{ccc,c++}-analyzer "${pkgdir:?}/usr/lib/clang/"
  rm -fr "${pkgdir:?}/usr/libexec"
  sed -i 's|libexec|lib/clang|' "${pkgdir:?}/usr/bin/scan-build"

  # Python bindings
  for _py in 2.7 3.9; do
    install -d "${pkgdir:?}/usr/lib/python${_py}/site-packages"
    cp -a llvm/bindings/python/llvm "${pkgdir:?}/usr/lib/python${_py}/site-packages/"
    cp -a clang/bindings/python/clang "${pkgdir:?}/usr/lib/python${_py}/site-packages/"
    _python${_py%%.*}_optimize "${pkgdir:?}/usr/lib/python${_py}"
  done

  sed -i '1s|/usr/bin/env python$|&2|' \
    "${pkgdir:?}/usr/share/clang/run-find-all-symbols.py"
  touch -d @"${SOURCE_DATE_EPOCH}" "${pkgdir:?}/usr/share/clang/run-find-all-symbols.py"

  _python2_optimize "${pkgdir:?}/usr/share/clang"
  _python3_optimize "${pkgdir:?}/usr/share" -x 'clang-include-fixer|run-find-all-symbols'

  # Licenses
  install -Dm644 "${srcdir:?}/llvm-project/llvm/LICENSE.TXT" "${pkgdir:?}/usr/share/licenses/${pkgname}/llvm-LICENSE"
  install -Dm644 "${srcdir:?}/llvm-project/clang/LICENSE.TXT" "${pkgdir:?}usr/share/licenses/${pkgname}/clang-LICENSE"
  install -Dm644 "${srcdir:?}/llvm-project/clang-tools-extra/LICENSE.TXT" "${pkgdir:?}/usr/share/licenses/${pkgname}/clang-tools-extra-LICENSE"
  install -Dm644 "${srcdir:?}/llvm-project/compiler-rt/LICENSE.TXT" "${pkgdir:?}/usr/share/licenses/${pkgname}/compiler-rt-LICENSE"
  install -Dm644 "${srcdir:?}/llvm-project/lld/LICENSE.TXT" "${pkgdir:?}/usr/share/licenses/${pkgname}/lld-LICENSE"
  install -Dm644 "${srcdir:?}/llvm-project/lldb/LICENSE.TXT" "${pkgdir:?}/usr/share/licenses/${pkgname}/lldb-LICENSE"
  install -Dm644 "${srcdir:?}/llvm-project/polly/LICENSE.txt" "${pkgdir:?}/usr/share/licenses/${pkgname}/polly-LICENSE"
  install -Dm644 "${srcdir:?}/llvm-project/openmp/LICENSE.txt" "${pkgdir:?}/usr/share/licenses/${pkgname}/openmp-LICENSE"

}
