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
pkgver=17.0.0_r454285.890e6c871d31
pkgrel=1
arch=('x86_64')
url="http://llvm.org/"
license=('custom:Apache 2.0 with LLVM Exception')
makedepends=('git' 'cmake' 'ninja' 'lib32-libffi' 'lib32-zlib' 'python' 'lib32-gcc-libs'
             'lib32-libxml2' 'lib32-zstd' 'llvm-minimal-git')
source=("llvm-project::git+https://github.com/llvm/llvm-project.git"
                '0001-IPSCCP-Remove-legacy-pass.patch'
                '0002-OCaml-Remove-all-PassManager-related-functions.patch'
                '0003-IPO-Remove-various-legacy-passes.patch'
                '0004-llvm-c-Remove-bindings-for-creating-legacy-passes.patch'
                '0005-llvm-c-Remove-PassManagerBuilder-APIs.patch'
                '0006-llvm-c-Remove-pointee-support-from-LLVMGetElementTyp.patch'
                '0007-Passes-Remove-some-legacy-passes.patch'
)
md5sums=('SKIP'
         '245054bc67dec3eb30329bbdeed171b1'
         '4c5ac9bca18c8a92280b1699f2f85a16'
         '179d535366bdb73c6b02850210aca69c'
         '286194131e1b5df0fe50ecd0f1b58eb2'
         '9e7e1648b472f83b054bf8dcbfc74175'
         'a4604d7858e1536af63f52dcbc47fbb8'
         'a09eda7d75c717aeb882fdfa67b028c3')
sha512sums=('SKIP'
            '4c1e8a455163ceb1e7d3f09f5e68f731e47f2346a2f62e1fe97b19f54c16781efc0b75d52304fe9d4aa62512fd6f32b7bd6e12b319cbe72e7831f1a056ffbfd0'
            '92f971db948e8acd4a55cb46ef28dc394c5df07f57844b63d82fc19436e2dfe7b184599ca17d84ef4fa63f6281628d8cc734d74dcc95bc0eee8a5e7c3778f49a'
            'ab46bd37d540e9c62d99cc9e137079e077f032d0ba6531b0685d2bb91a4d832787dd12e3680c76b58d26ada7e81b3a7d8d138c303a6ffb21b593dc549aecb140'
            'd3f5df839b49e4a853e88efaf2fb31c36efb15a91b4803f7e52414ab0e3121f4bfafc7d39edaad52a29106ca648428577f97f4fd12e7575cd3bbe009a1111901'
            '034b8262c2cec48fcdf1eef8f74332fc7016ecbf1627ab755f95f525c653cab0dd4199cd60b85dd09a63dc0b76bc9db9f85043c91801940294e42bc1feb1ea60'
            '2f227060ab56e04bf3e74fbb785c2edf9fc55121c936ba17ac62275cacdacfb9cb84bfda0e6637e11e744e26212bbfa861fa320084502afb4b7fd247d832993b'
            '6d77c23ad97c057898d97fd08af9714ff18c43026e082ad5e654b736caffb1ba814de0ebb9a7e169de9475d819df3cd0058805e4a0f020c55ce3b2272181802a')
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

prepare() {
    
    # revert more commits so the passmanager patch keeps working
    patch --directory="llvm-project" --reverse --strip=1 --input="${srcdir}"/0007-Passes-Remove-some-legacy-passes.patch
    patch --directory="llvm-project" --reverse --strip=1 --input="${srcdir}"/0006-llvm-c-Remove-pointee-support-from-LLVMGetElementTyp.patch
    patch --directory="llvm-project" --reverse --strip=1 --input="${srcdir}"/0005-llvm-c-Remove-PassManagerBuilder-APIs.patch
    patch --directory="llvm-project" --reverse --strip=1 --input="${srcdir}"/0004-llvm-c-Remove-bindings-for-creating-legacy-passes.patch
    patch --directory="llvm-project" --reverse --strip=1 --input="${srcdir}"/0003-IPO-Remove-various-legacy-passes.patch
    patch --directory="llvm-project" --reverse --strip=1 --input="${srcdir}"/0002-OCaml-Remove-all-PassManager-related-functions.patch
    # reverting commit b677d0753c0a771c6203607f5dbb56189193a14c , see https://gitlab.freedesktop.org/mesa/mesa/-/issues/8297
    patch --directory="llvm-project" --reverse --strip=1 --input="${srcdir}"/0001-IPSCCP-Remove-legacy-pass.patch
    
}

build() {
  
    export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
    
    LIB32_CFLAGS="$CFLAGS"" -m32"
    LIB32_CXXFLAGS="$CXXFLAGS"" -m32"
    
    cmake \
        -B _build \
        -S "$srcdir"/llvm-project/llvm \
        -G Ninja \
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
        
        ninja -C _build $NINJAFLAGS
}

check() {
    ninja -C _build $NINJAFLAGS check-llvm
}
package_lib32-llvm-minimal-git() {
    pkgdesc="Collection of modular and reusable compiler and toolchain technologies (32-bit)"
    depends=(lib32-llvm-libs-minimal-git=$pkgver-$pkgrel llvm-minimal-git)
    provides=('lib32-llvm')
    conflicts=('lib32-llvm')
    
    DESTDIR="$pkgdir" ninja -C _build $NINJAFLAGS install

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
