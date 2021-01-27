# Maintainer: Lone_Wolf <lone_wolf@klaas-de-kat.nl>
# Maintainer: Reza Jahanbakhshi <reza.jahanbakhshi at gmail dot com
# Contributor: Yurii Kolesnykov <root@yurikoles.com>
# Contributor: Luchesar V. ILIEV <luchesar%2eiliev%40gmail%2ecom>
# Contributor: Anders Bergh <anders@archlinuxppc.org>
# Contributor: Armin K. <krejzi at email dot com>
# Contributor: Christian Babeux <christian.babeux@0x80.ca>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Roberto Alsina <ralsina@kde.org>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Tomas Lindquist Olsen <tomas@famolsen.dk>
# Contributor: Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>

pkgbase=lib32-llvm-git
pkgname=(lib32-llvm-git lib32-llvm-libs-git)
pkgdesc="Collection of modular and reusable compiler and toolchain technologies (32-bit, git)"
pkgver=12.0.0_r369979.3052e474eceb
pkgrel=1
arch=('x86_64')
url='https://llvm.org/'
license=('custom:Apache 2.0 with LLVM Exception')
makedepends=('cmake' 'lib32-gcc-libs' 'git' 'lib32-libffi' 'lib32-libxml2' 'lib32-zlib' 'ninja' 'python')
source=("llvm-project::git+https://github.com/llvm/llvm-project.git")
sha512sums=('SKIP')

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
    echo "${_pkgver//svn}"
}

build() {

    export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
    
    LIB32_CFLAGS="$CFLAGS"" -m32"
    LIB32_CXXFLAGS="$CXXFLAGS"" -m32"

    cmake \
        -B _build \
        -S "$srcdir"/llvm-project/llvm \
        -G Ninja \
        -D LLVM_ENABLE_PROJECTS="clang;clang-tools-extra;compiler-rt" \
        -D CMAKE_BUILD_TYPE=Release \
        -D CMAKE_INSTALL_PREFIX=/usr \
        -D LLVM_LIBDIR_SUFFIX=32 \
        -D CMAKE_C_FLAGS="$LIB32_CFLAGS" \
        -D CMAKE_CXX_FLAGS="$LIB32_CXXFLAGS" \
        -D LLVM_TARGET_ARCH:STRING=i686 \
        -D LLVM_HOST_TRIPLE=$CHOST \
        -D LLVM_DEFAULT_TARGET_TRIPLE="i686-pc-linux-gnu" \
        -D LLVM_BUILD_LLVM_DYLIB=ON \
        -D LLVM_LINK_LLVM_DYLIB=ON \
        -D LLVM_ENABLE_BINDINGS=OFF \
        -D LLVM_ENABLE_RTTI=ON \
        -D LLVM_ENABLE_FFI=ON \
        -D LLVM_BUILD_DOCS=OFF \
        -D LLVM_ENABLE_SPHINX=OFF \
        -D LLVM_ENABLE_DOXYGEN=OFF \
        -D FFI_INCLUDE_DIR=$(pkg-config --variable=includedir libffi) \
        -D LLVM_BINUTILS_INCDIR=/usr/include \
        -D LLVM_APPEND_VC_REV=ON \
        -D LLVM_VERSION_SUFFIX=""

    ninja -C _build $NINJAFLAGS all
}

check() {
    ninja -C _build $NINJAFLAGS check-llvm
    ninja -C build $NINJAFLAGS check-clang
}

package_lib32-llvm-git() {
depends=('lib32-llvm-libs-git' 'llvm-git')
provides=('aur-lib32-llvm-git' 'lib32-llvm' 'lib32-clang' 'lib32-clang-git')
conflicts=('lib32-llvm' 'lib32-clang')

    DESTDIR="$pkgdir" ninja -C _build $NINJAFLAGS install

    # The runtime library goes into lib32-llvm-libs-git
    mv "$pkgdir"/usr/lib32/lib{LLVM,LTO,Remarks}*.so* "$srcdir"
    mv -f "$pkgdir"/usr/lib32/LLVMgold.so "$srcdir"

    
    mv "$pkgdir"/usr/bin/llvm-config "$pkgdir"/usr/lib32/llvm-config
    mv "$pkgdir"/usr/include/llvm/Config/llvm-config.h \
    "$pkgdir"/usr/lib32/llvm-config-32.h

    rm -rf "$pkgdir"/usr/{bin,include,libexec,share/{doc,man,llvm,opt-viewer,scan-build,scan-view,clang}}
      
    # Needed for multilib (https://bugs.archlinux.org/task/29951)
    # Header stub is taken from Fedora
    install -d "$pkgdir"/usr/include/llvm/Config
    mv "$pkgdir"/usr/lib32/llvm-config-32.h "$pkgdir"/usr/include/llvm/Config/

    install -d "$pkgdir"/usr/bin
    mv "$pkgdir"/usr/lib32/llvm-config "$pkgdir"/usr/bin/llvm-config32

    cd "$srcdir"/llvm-project/
    install -D -m 0644 llvm/LICENSE.TXT "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    install -Dm644 clang/LICENSE.TXT "$pkgdir"/usr/share/licenses/$pkgname/clang-LICENSE
    install -Dm644 clang-tools-extra/LICENSE.TXT "$pkgdir"/usr/share/licenses/$pkgname/clang-tools-extra-LICENSE
    install -Dm644 compiler-rt/LICENSE.TXT "$pkgdir"/usr/share/licenses/$pkgname/compiler-rt-LICENSE
}

package_lib32-llvm-libs-git() {
    depends=('lib32-gcc-libs' 'lib32-libffi' 'lib32-libxml2' 'lib32-ncurses' 'lib32-zlib')
provides=('aur-lib32-llvm-libs-git' 'lib32-llvm-libs')
    
    install -d "$pkgdir/usr/lib32"

    cp -P \
        "$srcdir"/lib{LLVM,LTO,Remarks}*.so* \
        "$pkgdir/usr/lib32/"

    cd "$srcdir"/llvm-project/
    install -D -m 0644 llvm/LICENSE.TXT "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    install -Dm644 clang/LICENSE.TXT "$pkgdir"/usr/share/licenses/$pkgname/clang-LICENSE
    install -Dm644 clang-tools-extra/LICENSE.TXT "$pkgdir"/usr/share/licenses/$pkgname/clang-tools-extra-LICENSE
    install -Dm644 compiler-rt/LICENSE.TXT "$pkgdir"/usr/share/licenses/$pkgname/compiler-rt-LICENSE
    }
