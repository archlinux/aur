# Maintainer: Lone_Wolf <lonewolf@xs4all.nl>
# Contributor: yurikoles <root@yurikoles.com>
# Contributor: bearoso <bearoso@gmail.com>
# Contributor: Luchesar V. ILIEV <luchesar%2eiliev%40gmail%2ecom>
# Contributor: Anders Bergh <anders@archlinuxppc.org>
# Contributor: Armin K. <krejzi at email dot com>
# Contributor: Christian Babeux <christian.babeux@0x80.ca>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Hesiod (https://github.com/hesiod)
# Contributor: Roberto Alsina <ralsina@kde.org>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Tomas Lindquist Olsen <tomas@famolsen.dk>
# Contributor: Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>


pkgbase=lone_wolf-llvm-git
pkgname=('lone_wolf-llvm-git' 'lone_wolf-llvm-libs-git')
pkgver=9.0.0_r316122.4a5793f7d07
pkgrel=1
_ocaml_ver=4.07.1
arch=('x86_64')
url="https://llvm.org/"
license=('custom:University of Illinois/NCSA Open Source License')
makedepends=('git' 'cmake' 'ninja' 'libffi' 'libedit' 'ncurses' 'libxml2'
             'python-sphinx' 'python-recommonmark')
source=("llvm-project::git+https://github.com/llvm/llvm-project.git"
                'llvm-config.h')
md5sums=('SKIP'
         '295c343dcd457dc534662f011d7cff1a')
sha512sums=('SKIP'
            '75e743dea28b280943b3cc7f8bbb871b57d110a7f2b9da2e6845c1c36bf170dd883fca54e463f5f49e0c3effe07fbd0db0f8cf5a12a2469d3f792af21a73fcdd')

pkgver() {
    cd llvm-project/llvm

    # This will almost match the output of `llvm-config --version` when the
    # LLVM_APPEND_VC_REV cmake flag is turned on. The only difference is
    # dash being replaced with underscore because of Pacman requirements.
    local _pkgver=$(awk -F 'MAJOR |MINOR |PATCH |)' \
            'BEGIN { ORS="." ; i=0 } \
             /set\(LLVM_VERSION_/ { print $2 ; i++ ; if (i==2) ORS="" } \
             END { print "\n" }' \
             CMakeLists.txt)_r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
    echo "${_pkgver}"
}

prepare() {
    cd llvm-project
    # remove code parts not needed to build llvm itself
    rm -rf clang clang-tools-extra compiler-rt debuginfo-tests libclc libcxx libcxxabi libunwind lld lldb llgo openmp parallel-libs polly pstl
}

build() {
    
    if [  -d _build ]; then
        rm -rf _build
    fi
    mkdir _build
    cd _build

    cmake "$srcdir"/llvm-project/llvm  -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DLLVM_HOST_TRIPLE=$CHOST \
        -DLLVM_TARGETS_TO_BUILD="AMDGPU;X86" \
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
        -DFFI_INCLUDE_DIR=$(pkg-config --variable=includedir libffi) \
        -DLLVM_BINUTILS_INCDIR=/usr/include \
        -DLLVM_VERSION_SUFFIX="" \
        -DLLVM_APPEND_VC_REV=ON \
        -DLLVM_ENABLE_BINDINGS=OFF

    if [[ ! $NINJAFLAGS ]]; then
        ninja 
    else
        ninja "$NINJAFLAGS"
    fi
}

check() {
  cd _build
  ninja check
}

package_lone_wolf-llvm-git() {
  pkgdesc="Collection of modular and reusable compiler and toolchain technologies"
  depends=(lone_wolf-llvm-libs-git=$pkgver-$pkgrel  'perl')
  optdepends=('python-setuptools: for using lit (LLVM Integrated Tester)')
  conflicts=('llvm')
  provides=(llvm=$pkgver-$pkgrel llvm-git=$pkgver-$pkgrel)

  cd _build

  DESTDIR="$pkgdir" ninja install

  # Include lit for running lit-based tests in other projects
  pushd "$srcdir"/llvm-project/llvm/utils/lit 
  python3 setup.py install --root="$pkgdir" -O1
  popd

  # Remove documentation sources
  rm -r "$pkgdir"/usr/share/doc/llvm/html/{_sources,.buildinfo}

  
  # The runtime libraries go into a separate package
  mv -f "$pkgdir"/usr/lib/lib{LLVM-*.so,LTO.so.*} "$srcdir"

  # Remove files which conflict with llvm-libs
  rm "$pkgdir"/usr/lib/{LLVMgold,lib{LLVM,LTO}}.so
  
  if [[ $CARCH == x86_64 ]]; then
    # Needed for multilib (https://bugs.archlinux.org/task/29951)
    # Header stub is taken from Fedora
    mv "$pkgdir"/usr/include/llvm/Config/llvm-config{,-64}.h
    cp "$srcdir"/llvm-config.h "$pkgdir"/usr/include/llvm/Config/llvm-config.h
  fi

  install -Dm644 "$srcdir"/llvm-project/llvm/LICENSE.TXT "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}

package_lone_wolf-llvm-libs-git() {
  pkgdesc="LLVM runtime libraries"
  depends=('gcc-libs' 'zlib' 'libffi' 'libedit' 'ncurses' 'libxml2')
  optdepends=('llvm-libs: for LLVMgold linker')

  install -d "$pkgdir/usr/lib"
  cp -P \
    "$srcdir"/lib{LLVM,LTO}*.so* \
    "$pkgdir"/usr/lib/

    install -Dm644 "$srcdir"/llvm-project/llvm/LICENSE.TXT "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
