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


pkgbase=llvm-minimal-git
pkgname=('llvm-minimal-git' 'llvm-libs-minimal-git')
pkgver=9.0.0_r319391.1885747498c
pkgrel=1
arch=('x86_64')
url="https://llvm.org/"
license=('custom:University of Illinois/NCSA Open Source License')
makedepends=('git' 'cmake' 'ninja' 'libffi' 'libedit' 'ncurses' 'libxml2'
             'python-sphinx' 'python-recommonmark' 'swig')
source=("llvm-project::git+https://github.com/llvm/llvm-project.git"
                'llvm-config.h'
                'enable-SSP-and-PIE-by-default.patch')
md5sums=('SKIP'
         '295c343dcd457dc534662f011d7cff1a'
         '5e9b3822e6b7de45f0ecb0ad71b3f7d3')
sha512sums=('SKIP'
            '75e743dea28b280943b3cc7f8bbb871b57d110a7f2b9da2e6845c1c36bf170dd883fca54e463f5f49e0c3effe07fbd0db0f8cf5a12a2469d3f792af21a73fcdd'
            '2fdbae0b62d33411beaf191920ff280f83fa80fd505a71077671027f27ed8c61c5867de3e6ee6f26734c7605037e86796404212182f8ffa71f4af6ed2c316a40')

# NINJAFLAGS is an env var used to pass commandline options to ninja
# NOTE: It's your responbility to validate the value of $NINJAFLAGS. If unsure, don't set it.

            
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
    if [  -d _build ]; then
        rm -rf _build
    fi
    mkdir _build

    cd llvm-project
    # remove code parts not needed for build
    rm -rf debuginfo-tests libclc libcxx libcxxabi libunwind lld lldb llgo openmp parallel-libs polly pstl
}

build() {
    
    cd _build

    cmake "$srcdir"/llvm-project/llvm  -G Ninja \
        -D CMAKE_C_FLAGS="${CFLAGS}" \
        -D CMAKE_CXX_FLAGS="${CXXFLAGS}" \
        -D CMAKE_BUILD_TYPE=Release \
        -D CMAKE_INSTALL_PREFIX=/usr \
        -D CMAKE_POLICY_DEFAULT_CMP0075=NEW \
        -D FFI_INCLUDE_DIR=$(pkg-config --variable=includedir libffi) \
        -D LLVM_HOST_TRIPLE=$CHOST \
        -D LLVM_TARGETS_TO_BUILD="AMDGPU;X86" \
        -D PYTHON_EXECUTABLE=/usr/bin/python \
        -D LLVM_BUILD_LLVM_DYLIB=ON \
        -D LLVM_LINK_LLVM_DYLIB=ON \
        -D LLVM_INSTALL_UTILS=ON \
        -D LLVM_ENABLE_RTTI=ON \
        -D LLVM_ENABLE_FFI=ON \
        -D LLVM_BUILD_TESTS=ON \
        -D LLVM_BUILD_DOCS=ON \
        -D LLVM_ENABLE_SPHINX=ON \
        -D SPHINX_WARNINGS_AS_ERRORS=OFF \
        -D LLVM_ENABLE_DOXYGEN=OFF \
        -D LLVM_BINUTILS_INCDIR=/usr/include \
        -D LLVM_VERSION_SUFFIX="" \
        -D LLVM_APPEND_VC_REV=ON \
        -D LLVM_ENABLE_BINDINGS=OFF \
        -D LLVM_ENABLE_PROJECTS="compiler-rt;clang-tools-extra;clang"
        
    ninja $NINJAFLAGS
}

check() {
    cd _build
    ninja $NINJAFLAGS check check-clang check-clang-tools
}

package_llvm-minimal-git() {
    pkgdesc="Collection of modular and reusable compiler and toolchain technologies"
    depends=(llvm-libs-minimal-git=$pkgver-$pkgrel  'perl')
    optdepends=('python-setuptools: for using lit (LLVM Integrated Tester)')
    conflicts=('llvm' compiler-rt clang)
    provides=(llvm=$pkgver-$pkgrel compiler-rt=$pkgver-$pkgrel clang=$pkgver-$pkgrel lone_wolf-llvm-git)
    replaces=(lone_wolf-llvm-git)

    cd _build
    DESTDIR="$pkgdir" ninja $NINJAFLAGS install

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
  
    # Move analyzer scripts out of /usr/libexec
    mv "$pkgdir"/usr/libexec/{ccc,c++}-analyzer "$pkgdir"/usr/lib/clang/
    rmdir "$pkgdir"/usr/libexec
    sed -i 's|libexec|lib/clang|' "$pkgdir"/usr/bin/scan-build

  
    if [[ $CARCH == x86_64 ]]; then
        # Needed for multilib (https://bugs.archlinux.org/task/29951)
        # Header stub is taken from Fedora
        mv "$pkgdir"/usr/include/llvm/Config/llvm-config{,-64}.h
        install -Dm644 "$srcdir"/llvm-config.h "$pkgdir"/usr/include/llvm/Config/llvm-config.h
    fi

    install -Dm644 "$srcdir"/llvm-project/llvm/LICENSE.TXT "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
    install -Dm644 "$srcdir"/llvm-project/compiler-rt/LICENSE.TXT "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    install -Dm644 "$srcdir"/llvm-project/clang-tools-extra/LICENSE.TXT "$pkgdir"/usr/share/licenses/$pkgname/clang-tools-extra-LICENSE
    install -Dm644 "$srcdir"/llvm-project/clang/LICENSE.TXT "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  
}

package_llvm-libs-minimal-git() {
  pkgdesc="LLVM runtime libraries"
  depends=('gcc-libs' 'zlib' 'libffi' 'libedit' 'ncurses' 'libxml2')
  optdepends=('llvm-libs: for LLVMgold linker')
  provides=(lone_wolf-llvm-libs-git=$pkgver-$pkgrel)
  replaces=(lone_wolf-llvm-libs-git)

  install -d "$pkgdir/usr/lib"
  cp -P \
    "$srcdir"/lib{LLVM,LTO}*.so* \
    "$pkgdir"/usr/lib/

    install -Dm644 "$srcdir"/llvm-project/llvm/LICENSE.TXT "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
