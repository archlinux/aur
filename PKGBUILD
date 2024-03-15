# Maintainer: Lone_Wolf <lone_wolf@klaas-de-kat.nl>
# Contributor:	blackmoon3  <https://github.com/blacksky3>
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
pkgname=(llvm-minimal-git llvm-libs-minimal-git clang-minimal-git clang-libs-minimal-git clang-opencl-headers-minimal-git)
pkgver=19.0.0_r492907.047b2b241def
pkgrel=1
arch=('x86_64')
url="https://llvm.org/"
license=('custom:Apache 2.0 with LLVM Exception')
makedepends=(git cmake libffi libedit ncurses libxml2
             libxcrypt python python-setuptools)
source=("git+https://github.com/llvm/llvm-project.git"
)
                
md5sums=('SKIP')
sha512sums=('SKIP')
            

options=('!lto')
# explicitly disable lto to reduce number of build hangs / test failures and runtime issues

# LIT by default uses all available cores. this can lead to heavy stress on systems making them unresponsive.
# It can also happen that the kernel oom killer interferes and kills important tasks.
# A reasonable value to avoid these issues appears to be 75% of available cores.
# LITFLAGS is an env vars that can be used to achieve this. It should be set on command line or in files read by your shell on login (like .bashrc ) .
# example for systems with 24 cores
# LITFLAGS="-j 18"
# NOTE: It's your responbility to validate the value of LITFLAGS. If unsure, don't set it.

_major_ver=19

_get_distribution_components() {
local target
local include

make help | grep -Po 'install-\K.*(?=-stripped)' | while read -r target; do
    case $target in
        llvm-libraries|clang-libraries|clang-tidy-headers|distribution )
            include=0
            ;;
      # shared libraries
        LLVM|LLVMgold )
            include=1
            ;;
        # libraries needed for clang-tblgen
        LLVMDemangle|LLVMSupport|LLVMTableGen )
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
    
    local cmake_args=(
        -G "Unix Makefiles"
        -D CMAKE_BUILD_TYPE=Release
        -D CMAKE_INSTALL_PREFIX=/usr
        -D LLVM_BINUTILS_INCDIR=/usr/include
        -D FFI_INCLUDE_DIR=$(pkg-config --variable=includedir libffi)
        -D LLVM_VERSION_SUFFIX=""
        -D LLVM_APPEND_VC_REV=ON
        -D LLVM_HOST_TRIPLE=$CHOST
        -D LLVM_TARGETS_TO_BUILD="AMDGPU;X86"
        -D LLVM_BUILD_LLVM_DYLIB=ON
        -D LLVM_LINK_LLVM_DYLIB=ON
        -D CLANG_LINK_CLANG_DYLIB=ON
        -D LLVM_DYLIB_COMPONENTS="all"
        -D LLVM_INSTALL_UTILS=ON
        -D LLVM_ENABLE_RTTI=ON
        -D LLVM_ENABLE_FFI=ON
        -D LLVM_USE_PERF=ON
        -D LLVM_INCLUDE_BENCHMARKS=OFF
        -D LLVM_INCLUDE_EXAMPLES=OFF
        -D LLVM_BUILD_DOCS=OFF
        -D LLVM_INCLUDE_DOCS=OFF
        -D LLVM_ENABLE_OCAMLDOC=OFF
        -D LLVM_ENABLE_SPHINX=OFF
        -D LLVM_ENABLE_DOXYGEN=OFF
        -D LLVM_ENABLE_BINDINGS=OFF
        -D LLVM_ENABLE_PROJECTS="compiler-rt;clang-tools-extra;clang"
        -D LLVM_ENABLE_DUMP=ON
        -D LLVM_LIT_ARGS="$LITFLAGS"" -sv --ignore-fail"
  )
    # build aborts with FORTIFY_SOURCE=3
    export CFLAGS="${CFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"
    
    cmake -B _build -S "$srcdir"/llvm-project/llvm "${cmake_args[@]}" -Wno-dev
    
    pushd "$srcdir"/_build
    local distribution_components=$(_get_distribution_components | paste -sd\;)
    popd
    test -n "$distribution_components"
    cmake_args+=(-D LLVM_DISTRIBUTION_COMPONENTS="$distribution_components")
    
    cmake -B _build -S "$srcdir"/llvm-project/llvm "${cmake_args[@]}" -Wno-dev
   
    make  -C _build
}

check() {
    make -C _build check-llvm
    make -C _build check-clang
    make -C _build check-clang-tools
}

package_llvm-minimal-git() {
    pkgdesc="Collection of modular and reusable compiler and toolchain technologies"
    depends=(llvm-libs-minimal-git="$pkgver-$pkgrel")
    provides=('llvm')
    conflicts=('llvm')
    optdepends=('python: for using lit (LLVM Integrated Tester)'
                          'python-setuptools: for using lit'
    )

    make -C _build DESTDIR="$pkgdir" install-distribution

    # Include lit for running lit-based tests in other projects
    pushd "$srcdir"/llvm-project/llvm/utils/lit 
    python3 setup.py install --root="$pkgdir" -O1
    # -O1 ensures the python files for lit will be optimized
    popd
    
    # Remove files which conflict with repo llvm-libs
    rm "$pkgdir"/usr/lib/{LLVMgold,lib{LLVM,LTO}}.so
    rm "$pkgdir"/usr/lib/libRemarks.so

    # prepare folders in srcdir to store files that are placed in other package_*() functions
    mkdir -p "$srcdir"{/llvm-libs/usr/lib,/clang-libs/usr/lib,/clang-opencl-headers/usr/{lib/clang/$_major_ver/include,include/clang/Basic}}
    
    # The llvm runtime libraries go into llvm-libs-minimal-git
    mv -f "$pkgdir"/usr/lib/{libLLVM*.so*,libLTO.so.*,libRemarks.so.*} "$srcdir"/llvm-libs/usr/lib

    # The clang runtime libraries go into clang-libs-minimal-git
    mv -f "$pkgdir"/usr/lib/libclang{,-cpp}.so* "$srcdir"/clang-libs/usr/lib
    
    # clang opencl files go to clang-opencl-headers-git
    mv -f "$pkgdir"/usr/lib/clang/$_major_ver/include/opencl* "$srcdir"/clang-opencl-headers/usr/lib/clang/$_major_ver/include
    mv -f "$pkgdir"/usr/include/clang/Basic/OpenCL* "$srcdir"/clang-opencl-headers/usr/include/clang/Basic

    # clang-minimal-git files go to a separate package
    mkdir -p "$srcdir"/clang/usr/{bin,include,lib,lib/cmake,share}
    mv -f "$pkgdir"/usr/lib/{libear,libscanbuild,clang} "$srcdir"/clang/usr/lib
    mv -f "$pkgdir"/usr/lib/cmake/clang "$srcdir"/clang/usr/lib/cmake/
    mv -f "$pkgdir"/usr/include/{clang,clang-c} "$srcdir"/clang/usr/include/
    # llvm project uses /usr/libexec and setting CMAKE_INSTALL_LIBEXECDIR doesn't affect that.
    # to comply with archlinux packaging standards we have to move some files manually
    mv -f "$pkgdir"/usr/libexec/* "$srcdir"/clang/usr/lib/clang
    rmdir "$pkgdir"/usr/libexec
    mv -f "$pkgdir"/usr/bin/{analyze-build,c-index-test,clang*,diagtool,find-all-symbols,git-clang-format,hmaptool,intercept-build,modularize,pp-trace,run-clang-tidy,scan-build,scan-build-py,scan-view} "$srcdir"/clang/usr/bin/
    mv -f "$pkgdir"/usr/share/{clang,man,opt-viewer,scan-build,scan-view} "$srcdir"/clang/usr/share/
    
    install -Dm644 "$srcdir"/llvm-project/llvm/LICENSE.TXT "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE.TXT
}

package_llvm-libs-minimal-git() {
    pkgdesc="LLVM runtime libraries, trunk version"
    depends=(gcc-libs zlib libffi libedit ncurses libxml2 llvm-libs)
    # some applications expect llvmgold.so to be present and fail badly if it isn't.
    # adding repo llvm-libs as depend is the easiest solution

    cp --preserve --recursive "$srcdir"/llvm-libs/* "$pkgdir"/

    install -Dm644 "$srcdir"/llvm-project/llvm/LICENSE.TXT "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.TXT
}

_python_optimize() {
  python -m compileall "$@"
  python -O -m compileall "$@"
  python -OO -m compileall "$@"
}

package_clang-minimal-git(){
  pkgdesc='C language family frontend for LLVM (git version)'
  depends=(llvm-libs-minimal-git clang-libs-minimal-git gcc)
  optdepends=('openmp: OpenMP support in clang with -fopenmp'
              'python: for scan-view, scan-build, git-clang-format, clang-rename and python bindings'
              'llvm-minimal-git: referenced by some clang headers')
  conflicts=(compiler-rt clang)
  provides=(compiler-rt clang clang-analyzer clang-tools-extra)

    cp --preserve --recursive "$srcdir"/clang/* "$pkgdir"/

    # Move scanbuild-py into site-packages
    local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
    install -d "$pkgdir/$site_packages"
    mv "$pkgdir"/usr/lib/{libear,libscanbuild} "$pkgdir/$site_packages/"

    sed -i 's|libexec|lib/clang|' \
        "$pkgdir/usr/bin/scan-build" \
        "$pkgdir/$site_packages/libscanbuild/analyze.py"

    # Compile Python scripts
    _python_optimize "$pkgdir"/usr/share "$pkgdir"/$site_packages


    install -Dm644 "$srcdir"/llvm-project/compiler-rt/LICENSE.TXT "$pkgdir"/usr/share/licenses/$pkgname/compiler-rt-LICENSE.TXT
    install -Dm644 "$srcdir"/llvm-project/clang-tools-extra/LICENSE.TXT "$pkgdir"/usr/share/licenses/$pkgname/clang-tools-extra-LICENSE.TXT
    install -Dm644 "$srcdir"/llvm-project/clang/LICENSE.TXT "$pkgdir"/usr/share/licenses/$pkgname/clang-LICENSE.TXT
}

package_clang-libs-minimal-git() {
    pkgdesc="clang runtime libraries, trunk version"
    depends=(llvm-libs-minimal-git="$pkgver-$pkgrel")
    # the functionality offered by this package is part of the clang repo pacakge.
    # TODO: when/if this functionality is split off from repo clang, verify if changes are needed to this package

    provides=('clang-libs')
    conflicts=("clang<$pkgver-$pkgrel" 'clang-libs')
    
    cp --preserve --recursive "$srcdir"/clang-libs/* "$pkgdir"/

    install -Dm644 "$srcdir"/llvm-project/llvm/LICENSE.TXT "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.TXT
}

package_clang-opencl-headers-minimal-git() {
    pkgdesc="clang headers & include files for OpenCL, trunk version"
    depends=(clang-libs-minimal-git="$pkgver-$pkgrel")
    # the functionality offered by this package is part of the clang repo package.
    # As far as I know rusticl from mesa is the only known user.
    # TODO: when/if this functionality is split off from repo clang, verify if changes are needed to this package
    provides=('clang-opencl-headers')
    conflicts=("clang<$pkgver-$pkgrel" 'clang-opencl-headers')
    
    cp --preserve --recursive "$srcdir"/clang-opencl-headers/* "$pkgdir"/

    install -Dm644 "$srcdir"/llvm-project/llvm/LICENSE.TXT "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.TXT
}
# vim:set ts=2 sw=2 et:
