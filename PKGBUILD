# Maintainer: Lone_Wolf <lone_wolf@klaas-de-kat.nl>
# Contributor: yurikoles <root@yurikoles.com>
# Contributor: bearoso <bearoso@gmail.com>
# Contributor: Luchesar V. ILIEV <luchesar%2eiliev%40gmail%2ecom>
# Contributor: Laurent Carlier <lordheavym@gmail.com>
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




pkgbase=lib32-llvm-minimal-git
pkgname=('lib32-llvm-minimal-git' 'lib32-llvm-libs-minimal-git')
pkgver=17.0.0_r457946.26e164fada37
pkgrel=1
arch=('x86_64')
url="http://llvm.org/"
license=('custom:Apache 2.0 with LLVM Exception')
makedepends=('git' 'cmake' 'lib32-libffi' 'lib32-zlib' 'python' 'lib32-gcc-libs'
             'lib32-libxml2' 'lib32-zstd' 'llvm-minimal-git')
source=("llvm-project::git+https://github.com/llvm/llvm-project.git"
)
md5sums=('SKIP')
sha512sums=('SKIP')
options=('staticlibs' '!lto')
# explicitly disable lto to reduce number of build hangs / test failures

# Both ninja & LIT by default use all available cores. this can lead to heavy stress on systems making them unresponsive.
# It can also happen that the kernel oom killer interferes and kills important tasks.
# A reasonable value for them to avoid these issues appears to be 75% of available cores.
# NINJAFLAGS and LITFLAGS are env vars that can be used to achieve this. They should be set on command line or in files read by your shell on login (like .bashrc ) .
# example for systems with 24 cores
# NINJAFLAGS="-j 18 -l 18"
# LITFLAGS="-j 18"
# NOTE: It's your responbility to validate the value of NINJAFLAGS and LITFLAGS. If unsure, don't set it.

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

build() {
  
    export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
    
    LIB32_CFLAGS="$CFLAGS"" -m32"
    LIB32_CXXFLAGS="$CXXFLAGS"" -m32"
    
    cmake \
        -B _build \
        -S "$srcdir"/llvm-project/llvm \
        -D CMAKE_C_FLAGS="$LIB32_CFLAGS" \
        -D CMAKE_CXX_FLAGS="$LIB32_CXXFLAGS" \
        -D CMAKE_BUILD_TYPE=Release \
        -D CMAKE_INSTALL_PREFIX=/usr \
        -D LLVM_LIBDIR_SUFFIX=32 \
        -D LLVM_TARGET_ARCH:STRING=i686 \
        -D LLVM_HOST_TRIPLE=$CHOST \
        -D LLVM_DEFAULT_TARGET_TRIPLE="i686-pc-linux-gnu" \
        -D LLVM_TARGETS_TO_BUILD="AMDGPU;X86" \
        -D LLVM_BUILD_LLVM_DYLIB=ON \
        -D LLVM_LINK_LLVM_DYLIB=ON \
        -D LLVM_ENABLE_RTTI=ON \
        -D LLVM_ENABLE_FFI=ON \
        -D LLVM_USE_PERF=ON \
        -D LLVM_INCLUDE_BENCHMARKS=OFF \
        -D LLVM_INCLUDE_EXAMPLES=OFF \
        -D LLVM_BUILD_DOCS=OFF \
        -D LLVM_INCLUDE_DOCS=OFF \
        -D LLVM_ENABLE_SPHINX=OFF \
        -D LLVM_ENABLE_OCAMLDOC=OFF \
        -D LLVM_ENABLE_DOXYGEN=OFF \
        -D FFI_INCLUDE_DIR=$(pkg-config --variable=includedir libffi) \
        -D LLVM_BINUTILS_INCDIR=/usr/include \
        -D LLVM_VERSION_SUFFIX="" \
        -D LLVM_ENABLE_BINDINGS=OFF \
        -D LLVM_LIT_ARGS="$LITFLAGS"" -sv --ignore-fail" \
        -Wno-dev
        
        make -C _build
}

check() {
    make -C _build check-llvm
}
package_lib32-llvm-minimal-git() {
    pkgdesc="Collection of modular and reusable compiler and toolchain technologies (32-bit)"
    depends=(lib32-llvm-libs-minimal-git=$pkgver-$pkgrel llvm-minimal-git)
    provides=('lib32-llvm')
    conflicts=('lib32-llvm')
    
    make -C _build DESTDIR="$pkgdir" install

    # Remove files which conflict with lib32-llvm-libs
    rm "$pkgdir"/usr/lib32/{LLVMgold,lib{LLVM,LTO,Remarks}}.so

    # The runtime library goes into lib32-llvm-libs-git
    mv "$pkgdir"/usr/lib32/lib{LLVM,LTO,Remarks}*.so* "$srcdir"
    
    mv "$pkgdir"/usr/bin/llvm-config "$pkgdir"/usr/lib32/llvm-config
    mv "$pkgdir"/usr/include/llvm/Config/llvm-config.h \
        "$pkgdir"/usr/lib32/llvm-config-32.h

    rm -rf "$pkgdir"/usr/{bin,include,share/{doc,man,llvm,opt-viewer}}

    # Needed for multilib (https://bugs.archlinux.org/task/29951)
    # Header stub is taken from Fedora
    install -d "$pkgdir"/usr/include/llvm/Config
    mv "$pkgdir"/usr/lib32/llvm-config-32.h "$pkgdir"/usr/include/llvm/Config/

    mkdir "$pkgdir"/usr/bin
    mv "$pkgdir"/usr/lib32/llvm-config "$pkgdir"/usr/bin/llvm-config32

    install -Dm644 "$srcdir"/llvm-project/llvm/LICENSE.TXT "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_lib32-llvm-libs-minimal-git() {
    pkgdesc="Low Level Virtual Machine (runtime library)(32-bit)"
    depends=('lib32-libffi' 'lib32-zlib' 'lib32-ncurses' 'lib32-libxml2' 'lib32-gcc-libs')
    provides=('lib32-llvm-libs')
    optdepends=('lib32-llvm-libs: for LLVMgold linker')
    
    install -d "$pkgdir"/usr/lib32

    cp -P \
        "$srcdir"/lib{LLVM,LTO,Remarks}*.so* \
        "$pkgdir"/usr/lib32/

    install -Dm644 "$srcdir"/llvm-project/llvm/LICENSE.TXT "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
