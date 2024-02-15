# Maintainer: Lone_Wolf <lone_wolf@klaas-de-kat.nl>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>

pkgname=lib32-clang-minimal-git
pkgver=19.0.0_r489812.43b291cbecca
_major_ver=19
pkgrel=1
pkgdesc="companion package to lib32-llvm-minimal-git, C language family frontend for LLVM (32-bit)"
arch=('x86_64')
url="https://clang.llvm.org/"
license=('custom:Apache 2.0 with LLVM Exception')
depends=('lib32-llvm-libs-minimal-git' 'lib32-glibc' 'lib32-gcc-libs')
makedepends=('lib32-llvm-minimal-git' 'cmake'  'python' 'git' 'lib32-llvm-libs<$_major_ver')
provides=('lib32-clang')
conflicts=('lib32-clang')
source=("git+https://github.com/llvm/llvm-project.git"
            '75f0d40507ea3f7c99dd3250ff0fbe6dab341910.patch'
)
sha256sums=('SKIP'
            '47c992064eac25bb897685f4b4dbf48ac002c6960facdfa6e1e9cc460e1e012a')

# Utilizing LLVM_DISTRIBUTION_COMPONENTS to avoid
# installing static libraries; inspired by Gentoo
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

prepare() {
  cd llvm-project
  local _commit_hash=$(echo $(pacman -Q lib32-llvm-minimal-git) | cut -d' ' -f2 |  cut -d'-' -f1 | cut -d'.' -f4)
  # makepkg installs deps after processing the body of the PKGBUILD. 
  # This prevents using _commit_hash in the source= array unless lib32-llvm-minimal-git is installed before build starts.
  # There is NO method to enforce this, downloading llvm trunk and using git reset here is a workaround.
  git reset --hard $_commit_hash
  patch --reverse --strip=1 --input="${srcdir}"/75f0d40507ea3f7c99dd3250ff0fbe6dab341910.patch
}

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
  export PKG_CONFIG="i686-pc-linux-gnu-pkg-config"



  local cmake_args=(
    -G "Unix Makefiles"
    -D CMAKE_BUILD_TYPE=Release
    -D CMAKE_INSTALL_PREFIX=/usr
    -D CMAKE_SKIP_RPATH=ON
    -D CLANG_DEFAULT_PIE_ON_LINUX=ON
    -D CLANG_LINK_CLANG_DYLIB=ON
    -D CMAKE_CXX_FLAGS:STRING=-m32
    -D CMAKE_C_FLAGS:STRING=-m32
    -D LLVM_HOST_TRIPLE=$CHOST
    -D ENABLE_LINKER_BUILD_ID=ON
    -D LLVM_INCLUDE_DOCS=OFF
    -D LLVM_INCLUDE_TESTS=OFF
    -D LLVM_CONFIG="/usr/bin/llvm-config32"
    -D LLVM_ENABLE_RTTI=ON
    -D LLVM_LIBDIR_SUFFIX=32
    -D LLVM_LINK_LLVM_DYLIB=ON
    -D LLVM_TARGETS_TO_BUILD="AMDGPU;X86"
  )

    cmake -B _build -S "$srcdir"/llvm-project/clang "${cmake_args[@]}" -Wno-dev

    pushd "$srcdir"/_build
    local distribution_components=$(_get_distribution_components | paste -sd\;)
    popd
    test -n "$distribution_components"
    cmake_args+=(-D LLVM_DISTRIBUTION_COMPONENTS="$distribution_components")
    
    cmake -B _build -S "$srcdir"/llvm-project/clang "${cmake_args[@]}" -Wno-dev

    make -C _build
}

package_lib32-clang-minimal-git() {
  
    make -C _build DESTDIR="$pkgdir" install-distribution
  
    #remove files that are provided by or conflict with 64-bit versions
    rm -rf "$pkgdir"/usr/{bin,include,lib32{/libear,/libscanbuild},libexec,share}
    install -Dm644 "$srcdir"/llvm-project/clang/LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
