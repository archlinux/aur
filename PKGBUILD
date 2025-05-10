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
pkgname=('lib32-llvm-minimal-git' 'lib32-llvm-libs-minimal-git' 'lib32-clang-minimal-git' 'lib32-clang-libs-minimal-git' 'lib32-clang-opencl-headers-minimal-git')
pkgver=21.0.0_r537044.5fa64d65e928
pkgrel=1
arch=('x86_64')
url="http://llvm.org/"
license=('Apache-2.0 WITH LLVM-exception')
makedepends=(git cmake lib32-libffi lib32-zlib python lib32-gcc-libs
             lib32-libxml2 lib32-zstd llvm-minimal-git ninja)
source=("git+https://github.com/llvm/llvm-project.git"
)
md5sums=('SKIP')
sha512sums=('SKIP')
options=(!lto !debug)
# explicitly disable lto to reduce number of build hangs / test failures


# Ninja & LIT by default use all available cores. this can lead to heavy stress on systems making them unresponsive.
# It can also cause the kernel oom killer to interfere and kill important tasks.
# A reasonable value to avoid these issues appears to be 75% of available cores.
# This PKGBUILD uses the env vars NINJAFLAGS & LITFLAGS to achieve this. They should be set on command line or in files read by your shell on login (like .bashrc ) .
# example for systems with 24 cores
# export NINJAFLAGS="-j 18 -l 18"
# export LITFLAGS="-j 18"
# NOTE: It's your responbility to validate the value of LITFLAGS & NINJAFLAGS . If unsure, don't set them.


_get_distribution_components() {
    local target
    local include

    ninja -t targets | grep -Po 'install-\K.*(?=-stripped:)' | while read -r target; do
        case $target in
            llvm-libraries|clang-libraries|clang-tidy-headers|distribution )
                include=0
                ;;
            # donot build LLVMgold
            LLVMgold )
                include=0
                ;;
            # shared libraries
            LLVM )
                include=1
                ;;
            # libraries needed for clang-tblgen
            LLVMDemangle|LLVMSupport|LLVMTableGen )
                include=1
                ;;
            # testing libraries
                LLVMTestingAnnotations|LLVMTestingSupport)
                include=1
                ;;
            # exclude static libraries
            LLVM* )
                include=0
                ;;
            # exclude llvm-exegesis (doesn't seem useful without libpfm)
            llvm-exegesis )
                include=0
                ;;
            clang|clangd|clang-* )
                include=1
                ;;
            clang*|findAllSymbols )
                include=0
                ;;
            # Anything not covered above is included
            * )
                include=1
        esac
        if [ $include -eq 1 ]; then
            echo $target
        fi
    done
}

pkgver() {
    cd llvm-project/cmake/Modules

    # This will almost match the output of `llvm-config --version` when the
    # LLVM_APPEND_VC_REV cmake flag is turned on. The only difference is
    # dash being replaced with underscore because of Pacman requirements.
    local _pkgver=$(awk -F 'MAJOR |MINOR |PATCH |)' \
            'BEGIN { ORS="." ; i=0 } \
             /set\(LLVM_VERSION_/ { print $2 ; i++ ; if (i==2) ORS="" } \
             END { print "\n" }' \
              LLVMVersion.cmake)_r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
    echo "${_pkgver}"
}

build() {
  
    export PKG_CONFIG="i686-pc-linux-gnu-pkg-config"
    # https://github.com/llvm/llvm-project/commit/91a384621e5b762d9c173ffd247cfeadd5f436a2 changed sonames
    # most sourcecode has been adjusted to account for this, but not all
    export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$srcdir/_build/lib32/
    
    cmake_args=(
        -G Ninja
        -D CMAKE_CXX_FLAGS:STRING=-m32
        -D CMAKE_C_FLAGS:STRING=-m32
        -D CMAKE_BUILD_TYPE=Release
        -D CMAKE_INSTALL_PREFIX=/usr
        -D CMAKE_SKIP_RPATH=ON
        -D LLVM_LIBDIR_SUFFIX=32
        -D LLVM_TARGET_ARCH:STRING=i686
        -D LLVM_HOST_TRIPLE=$CHOST
        -D LLVM_DEFAULT_TARGET_TRIPLE="i686-pc-linux-gnu"
        -D LLVM_TARGETS_TO_BUILD="AMDGPU;X86"
        -D LLVM_BUILD_LLVM_DYLIB=ON
        -D LLVM_LINK_LLVM_DYLIB=ON
        -D LLVM_ENABLE_RTTI=ON
        -D LLVM_ENABLE_FFI=ON
        -D LLVM_USE_PERF=ON
        -D LLVM_INCLUDE_BENCHMARKS=OFF
        -D LLVM_INCLUDE_EXAMPLES=OFF
        -D LLVM_BUILD_DOCS=OFF
        -D LLVM_INCLUDE_DOCS=OFF
        -D LLVM_ENABLE_SPHINX=OFF
        -D LLVM_ENABLE_OCAMLDOC=OFF
        -D LLVM_ENABLE_DOXYGEN=OFF
        -D FFI_INCLUDE_DIR=$(pkg-config --variable=includedir libffi)
        -D LLVM_BINUTILS_INCDIR=/usr/include
        -D LLVM_VERSION_SUFFIX=""
        -D LLVM_ENABLE_BINDINGS=OFF
        -D LLVM_ENABLE_DUMP=ON
        -D LLVM_LIT_ARGS="$LITFLAGS"" -sv --ignore-fail"
        -D LLVM_ENABLE_RUNTIMES=compiler-rt
        -D LLVM_ENABLE_PROJECTS="clang-tools-extra;clang"
        -D CLANG_LINK_CLANG_DYLIB=ON
        -D CLANG_DEFAULT_PIE_ON_LINUX=ON
        -D ENABLE_LINKER_BUILD_ID=ON
)
        
    cmake -B _build -S "$srcdir"/llvm-project/llvm "${cmake_args[@]}" -Wno-dev

    pushd "$srcdir"/_build
    local distribution_components=$(_get_distribution_components | paste -sd\;)
    popd
    test -n "$distribution_components"
    cmake_args+=(-D LLVM_DISTRIBUTION_COMPONENTS="$distribution_components")
    
    cmake -B _build -S "$srcdir"/llvm-project/llvm "${cmake_args[@]}" -Wno-dev
       
    ninja $NINJAFLAGS -C _build
}

check() {
    ninja $NINJAFLAGS  -C _build check-llvm
    ninja $NINJAFLAGS -C _build check-clang
    ninja $NINJAFLAGS -C _build check-clang-tools
}

package_lib32-llvm-minimal-git() {
    pkgdesc="Collection of modular and reusable compiler and toolchain technologies, 32-bit trunk version"
    depends=(lib32-llvm-libs-minimal-git=$pkgver-$pkgrel llvm-minimal-git lib32-gcc-libs lib32-glibc)
    provides=('lib32-llvm')
    conflicts=('lib32-llvm')
    
    DESTDIR="$pkgdir" ninja $NINJAFLAGS -C _build install-distribution

    # clang uses clang/LLVM_Major_version in it's folder structure
    local _major_ver=$(echo $pkgver | cut -d. -f1)

    # prepare folders in srcdir to store files that are placed in other package_*() functions
    mkdir -p "$srcdir"{/llvm-libs/usr/lib32,/clang-libs/usr/lib32,/clang-opencl-headers/usr/{lib32/clang/$_major_ver/include,include/clang/Basic}}
    
    # Remove files which conflict with lib32-llvm-libs
    rm "$pkgdir"/usr/lib32/lib{LLVM,LTO,Remarks}.so

   # remove files which conflicts with or are already present in clang-minimal-git
   rm -rf "$pkgdir"/usr/lib/{libear,libscanbuild}
   rm -rf "$pkgdir"/usr/lib/clang/$_major_ver/{lib,share}

   
    # The llvm runtime libraries go into lib32-llvm-libs-git
    mv "$pkgdir"/usr/lib32/lib{LLVM,LTO,Remarks}*.so* "$srcdir"/llvm-libs/usr/lib32
    
   # The clang runtime libraries go into lib32-clang-libs-minimal-git
    mv -f "$pkgdir"/usr/lib32/libclang{,-cpp}.so* "$srcdir"/clang-libs/usr/lib32

    # remove files already present in opencl-headers-minimal-git
    rm -rf "$pkgdir"/usr/include/clang/Basic/OpenCL*
    
    # clang opencl files go to lib32-clang-opencl-headers-minimal-git
    mv -f "$pkgdir"/usr/lib32/clang/$_major_ver/include/opencl* "$srcdir"/clang-opencl-headers/usr/lib32/clang/$_major_ver/include

   # clang files go to lib32-clang-minimal-git separate package
    mkdir -p "$srcdir"/clang/usr/{lib32,lib32/cmake}
    mv -f "$pkgdir"/usr/lib32/clang "$srcdir"/clang/usr/lib32
    mv -f "$pkgdir"/usr/lib32/cmake/clang "$srcdir"/clang/usr/lib32/cmake/
   
    # rename llvm-config to llvm-config32 and remove everyting else in $pkgdir/usr/bin to avoid conflicts with llvm-minimal-git
   mv "$pkgdir"/usr/bin/llvm-config "$pkgdir"/usr/bin/llvm-config32
   find "$pkgdir"/usr/bin -type f,l -not -name 'llvm-config32' -delete
    
    rm -rf "$pkgdir"/usr/{include,libexec,share}

    install -Dm644 "$srcdir"/llvm-project/llvm/LICENSE.TXT "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_lib32-llvm-libs-minimal-git() {
    pkgdesc="Low Level Virtual Machine runtime library 32-bit trunk version"
    depends=(lib32-libffi lib32-zlib lib32-ncurses lib32-libxml2 lib32-gcc-libs lib32-zstd lib32-glibc)
    provides=('lib32-llvm-libs')
    optdepends=('lib32-llvm-libs: for LLVMgold linker')
    
    install -d "$pkgdir"/usr/lib32

    cp -P --recursive "$srcdir"/llvm-libs/* "$pkgdir"/

    install -Dm644 "$srcdir"/llvm-project/llvm/LICENSE.TXT "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_lib32-clang-minimal-git(){
  pkgdesc='C language family frontend for LLVM , 32-bit trunk version'
  depends=(llvm-libs-minimal-git clang-libs-minimal-git gcc)
  optdepends=('openmp: OpenMP support in clang with -fopenmp'
              'python: for scan-view, scan-build, git-clang-format, clang-rename and python bindings'
              'llvm-minimal-git: referenced by some clang headers'
              'clang-miminal-git: for some headers')
  arch=('any')
  conflicts=(lib32-clang)
  provides=(lib32-clang)

    cp -P --recursive "$srcdir"/clang/* "$pkgdir"/

    rm -rf "$pkgdir"/usr/{bin,include,lib,libexec,share}

    install -Dm644 "$srcdir"/llvm-project/compiler-rt/LICENSE.TXT "$pkgdir"/usr/share/licenses/$pkgname/compiler-rt-LICENSE.TXT
    install -Dm644 "$srcdir"/llvm-project/clang-tools-extra/LICENSE.TXT "$pkgdir"/usr/share/licenses/$pkgname/clang-tools-extra-LICENSE.TXT
    install -Dm644 "$srcdir"/llvm-project/clang/LICENSE.TXT "$pkgdir"/usr/share/licenses/$pkgname/clang-LICENSE.TXT

}

package_lib32-clang-libs-minimal-git() {
    pkgdesc="clang runtime libraries, 32-bit trunk version"
    depends=(lib32-llvm-libs-minimal-git="$pkgver-$pkgrel" lib32-gcc-libs lib32-glibc)
    # the functionality offered by this package is part of the clang repo pacakge.
    # TODO: when/if this functionality is split off from repo clang, verify if changes are needed to this package

    provides=('lib32-clang-libs')
    conflicts=("lib32-clang<$pkgver-$pkgrel" 'lib32-clang-libs')
    
    cp -P --recursive "$srcdir"/clang-libs/* "$pkgdir"/

    install -Dm644 "$srcdir"/llvm-project/clang/LICENSE.TXT "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.TXT
}

package_lib32-clang-opencl-headers-minimal-git() {
    pkgdesc="clang headers & include files for OpenCL, 32-bit trunk version"
    depends=(lib32-clang-libs-minimal-git="$pkgver-$pkgrel")
    # the functionality offered by this package is part of the clang repo package.
    # As far as I know rusticl from mesa is the only known user.
    # TODO: when/if this functionality is split off from repo clang, verify if changes are needed to this package
    arch=('any')
    provides=('lib32-clang-opencl-headers')
    conflicts=("lib32-clang<$pkgver-$pkgrel" 'lib32-clang-opencl-headers')
    
    cp --preserve --recursive "$srcdir"/clang-opencl-headers/* "$pkgdir"/

    install -Dm644 "$srcdir"/llvm-project/llvm/LICENSE.TXT "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.TXT
}
# vim:set ts=2 sw=2 et:
