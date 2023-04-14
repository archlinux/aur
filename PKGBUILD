# Maintainer: Lone_Wolf <lone_wolf@klaas-de-kat.nl>
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
pkgname=('llvm-minimal-git' 'llvm-libs-minimal-git' 'spirv-llvm-translator-minimal-git')
pkgver=17.0.0_r457890.293e4da32b1d
pkgrel=1
arch=('x86_64')
url="https://llvm.org/"
license=('custom:Apache 2.0 with LLVM Exception')
makedepends=('git' 'cmake' 'libffi' 'libedit' 'ncurses' 'libxml2'
             'libxcrypt' 'python' 'python-setuptools' 'spirv-headers-git' 'spirv-tools-git')
source=("llvm-project::git+https://github.com/llvm/llvm-project.git"
                'local://llvm-config.h'
                "git+https://github.com/KhronosGroup/SPIRV-LLVM-Translator.git"
                )
                
md5sums=('SKIP'
         '295c343dcd457dc534662f011d7cff1a'
         'SKIP')
sha512sums=('SKIP'
            '75e743dea28b280943b3cc7f8bbb871b57d110a7f2b9da2e6845c1c36bf170dd883fca54e463f5f49e0c3effe07fbd0db0f8cf5a12a2469d3f792af21a73fcdd'
            'SKIP')
            

options=('staticlibs' '!lto')
# explicitly disable lto to reduce number of build hangs / test failures

# LIT by default uses all available cores. this can lead to heavy stress on systems making them unresponsive.
# It can also happen that the kernel oom killer interferes and kills important tasks.
# A reasonable value to avoid these issues appears to be 75% of available cores.
# LITFLAGS is an env vars that can be used to achieve this. It should be set on command line or in files read by your shell on login (like .bashrc ) .
# example for systems with 24 cores
# LITFLAGS="-j 18"
# NOTE: It's your responbility to validate the value of LITFLAGS. If unsure, don't set it.

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
    
    cmake \
        -B _build \
        -S "$srcdir"/llvm-project/llvm  \
        -D CMAKE_BUILD_TYPE=Release \
        -D CMAKE_INSTALL_PREFIX=/usr \
        -D LLVM_BINUTILS_INCDIR=/usr/include \
        -D FFI_INCLUDE_DIR=$(pkg-config --variable=includedir libffi) \
        -D LLVM_VERSION_SUFFIX="" \
        -D LLVM_APPEND_VC_REV=ON \
        -D LLVM_HOST_TRIPLE=$CHOST \
        -D LLVM_TARGETS_TO_BUILD="AMDGPU;X86" \
        -D LLVM_BUILD_LLVM_DYLIB=ON \
        -D LLVM_LINK_LLVM_DYLIB=ON \
        -D CLANG_LINK_CLANG_DYLIB=ON \
        -D LLVM_DYLIB_COMPONENTS="all" \
        -D LLVM_INSTALL_UTILS=ON \
        -D LLVM_ENABLE_RTTI=ON \
        -D LLVM_ENABLE_FFI=ON \
        -D LLVM_USE_PERF=ON \
        -D LLVM_INCLUDE_BENCHMARKS=OFF \
        -D LLVM_INCLUDE_EXAMPLES=OFF \
        -D LLVM_BUILD_DOCS=OFF \
        -D LLVM_INCLUDE_DOCS=OFF \
        -D LLVM_ENABLE_OCAMLDOC=OFF \
        -D LLVM_ENABLE_SPHINX=OFF \
        -D LLVM_ENABLE_DOXYGEN=OFF \
        -D LLVM_ENABLE_BINDINGS=OFF \
        -D LLVM_ENABLE_PROJECTS="compiler-rt;clang-tools-extra;clang" \
        -D LLVM_ENABLE_DUMP=ON \
        -D LLVM_EXTERNAL_PROJECTS="SPIRV-LLVM-Translator" \
        -D LLVM_EXTERNAL_SPIRV_LLVM_TRANSLATOR_SOURCE_DIR="$srcdir"/SPIRV-LLVM-Translator \
        -D LLVM_EXTERNAL_SPIRV_HEADERS_SOURCE_DIR=/usr/include/spirv/ \
        -D LLVM_SPIRV_INCLUDE_TESTS=ON \
        -D BASE_LLVM_VERSION=17.0.0 \
        -D LLVM_LIT_ARGS="$LITFLAGS"" -sv --ignore-fail" \
        -Wno-dev

    make -C _build
}

check() {
    make -C _build check-llvm
    make -C _build check-clang
    make -C _build check-clang-tools
    make -C _build check-llvm-spirv
}

package_llvm-minimal-git() {
    pkgdesc="Collection of modular and reusable compiler and toolchain technologies"
    depends=(llvm-libs-minimal-git=$pkgver-$pkgrel  'perl')
    provides=('llvm' 'compiler-rt' 'clang')
    conflicts=('llvm' 'compiler-rt' 'clang')
    optdepends=('python: for using lit (LLVM Integrated Tester)'
                          'python-setuptools: for using lit'
    )

    make -C _build DESTDIR="$pkgdir" install

    # Include lit for running lit-based tests in other projects
    pushd "$srcdir"/llvm-project/llvm/utils/lit 
    python3 setup.py install --root="$pkgdir" -O1
    popd

    # The runtime libraries go into a separate package
    mv -f "$pkgdir"/usr/lib/lib{LLVM-*.so,LTO.so.*,Remarks.so.*,clang-cpp.so.*} "$srcdir"

    # Remove files which conflict with llvm-libs
    rm "$pkgdir"/usr/lib/{LLVMgold,lib{LLVM,LTO}}.so
    rm "$pkgdir"/usr/lib/libRemarks.so
    
    # spirv-llvm-translator files go to a separate package
    mkdir -p "$srcdir"/spirv/usr/{bin,include/LLVMSPIRVLib/,lib/pkgconfig}
    mv "$pkgdir"/usr/bin/llvm-spirv "$srcdir"/spirv/usr/bin
    mv "$pkgdir"/usr/include/LLVMSPIRVLib/* "$srcdir"/spirv/usr/include/LLVMSPIRVLib/
    mv "$pkgdir"/usr/lib/libLLVMSPIRVLib.a "$srcdir"/spirv/usr/lib
    mv "$pkgdir"/usr/lib/pkgconfig/LLVMSPIRVLib.pc "$srcdir"/spirv/usr/lib/pkgconfig

  
    # llvm project uses /usr/libexec and setting CMAKE_INSTALL_LIBEXECDIR doesn't change that.
    # to comply with archlinux packaging standards we have to move some files manually
    for libexec_file in "analyze-c++" "analyze-cc" "c++-analyzer" "ccc-analyzer" "intercept-c++" "intercept-cc"
    do
        mv "$pkgdir"/usr/libexec/$libexec_file "$pkgdir"/usr/lib/clang/$libexec_file
    done
    rmdir "$pkgdir"/usr/libexec
    sed -i 's|libexec|lib/clang|' "$pkgdir"/usr/bin/scan-build

  
    if [[ $CARCH == x86_64 ]]; then
        # Needed for multilib (https://bugs.archlinux.org/task/29951)
        # Header stub is taken from Fedora
        mv "$pkgdir"/usr/include/llvm/Config/llvm-config{,-64}.h
        install -Dm644 "$srcdir"/llvm-config.h "$pkgdir"/usr/include/llvm/Config/llvm-config.h
    fi

    install -Dm644 "$srcdir"/llvm-project/llvm/LICENSE.TXT "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE.TXT
    install -Dm644 "$srcdir"/llvm-project/compiler-rt/LICENSE.TXT "$pkgdir"/usr/share/licenses/$pkgname/compiler-rt-LICENSE.TXT
    install -Dm644 "$srcdir"/llvm-project/clang-tools-extra/LICENSE.TXT "$pkgdir"/usr/share/licenses/$pkgname/clang-tools-extra-LICENSE.TXT
    install -Dm644 "$srcdir"/llvm-project/clang/LICENSE.TXT "$pkgdir"/usr/share/licenses/$pkgname/clang-LICENSE.TXT
  
}

package_llvm-libs-minimal-git() {
    pkgdesc="LLVM runtime libraries, trunk version"
    depends=('gcc-libs' 'zlib' 'libffi' 'libedit' 'ncurses' 'libxml2')
    provides=('llvm-libs')
    optdepends=('llvm-libs: for LLVMgold linker')

    install -d "$pkgdir/usr/lib"
    cp -P \
        "$srcdir"/lib{LLVM,LTO,Remarks,clang-cpp}*.so* \
        "$pkgdir"/usr/lib/

    install -Dm644 "$srcdir"/llvm-project/llvm/LICENSE.TXT "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.TXT
}

package_spirv-llvm-translator-minimal-git() {
pkgdesc="Tool and a library for bi-directional translation between SPIR-V and LLVM IR, trunk version"
depends=(llvm-minimal-git=$pkgver-$pkgrel 'spirv-tools-git')
provides=('spirv-llvm-translator')
conflicts=('spirv-llvm-translator')

    cp --preserve --recursive "$srcdir"/spirv/* "$pkgdir"/
    install -Dm644 "$srcdir"/SPIRV-LLVM-Translator/LICENSE.TXT "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.TXT
}


# vim:set ts=2 sw=2 et:
