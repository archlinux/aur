# Maintainer: Lone_Wolf <lonewolf@xs4all.nl>
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




pkgname=('lib32-llvm-lw-git' 'lib32-llvm-libs-lw-git')
pkgver=9.0.0_r315269.2ac6aca8af7
pkgrel=1
arch=('x86_64')
url="http://llvm.org/"
license=('custom:University of Illinois/NCSA Open Source License')
makedepends=('git' 'cmake' 'ninja' 'lib32-libffi' 'lib32-zlib' 'python' 'lib32-gcc-libs'
             'lib32-libxml2')
source=("llvm-project::git+https://github.com/llvm/llvm-project.git")
sha256sums=('SKIP')

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
    if [  -d _build ]; then
        rm -rf _build
    fi
    mkdir _build
    cd _build
  
    export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

    cmake "$srcdir"/llvm-project/llvm -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DLLVM_LIBDIR_SUFFIX=32 \
        -DCMAKE_C_FLAGS:STRING=-m32 \
        -DCMAKE_CXX_FLAGS:STRING=-m32 \
        -DLLVM_TARGET_ARCH:STRING=i686 \
        -DLLVM_HOST_TRIPLE=$CHOST \
        -DLLVM_DEFAULT_TARGET_TRIPLE="i686-pc-linux-gnu" \
        -DLLVM_BUILD_LLVM_DYLIB=ON \
        -DLLVM_LINK_LLVM_DYLIB=ON \
        -DLLVM_ENABLE_RTTI=ON \
        -DLLVM_ENABLE_FFI=ON \
        -DLLVM_BUILD_DOCS=OFF \
        -DLLVM_ENABLE_SPHINX=OFF \
        -DLLVM_ENABLE_DOXYGEN=OFF \
        -DFFI_INCLUDE_DIR=$(pkg-config --variable=includedir libffi) \
        -DLLVM_BINUTILS_INCDIR=/usr/include \
        -DLLVM_VERSION_SUFFIX=""
    if [[ ! $NINJAFLAGS ]]; then
        ninja all
    else
        ninja "$NINJAFLAGS" all
    fi
}

package_lib32-llvm-lw-git() {
    pkgdesc="Collection of modular and reusable compiler and toolchain technologies (32-bit)"
    depends=('lib32-llvm-libs-lw-git' 'llvm-lw-git')
    provides=(lib32-llvm=$pkgver-$pkgrel lib32-llvm-git=$pkgver-$pkgrel)

    cd _build
    DESTDIR="$pkgdir" ninja install

    # The runtime library goes into lib32-llvm-libs
    mv "$pkgdir"/usr/lib32/lib{LLVM,LTO}*.so* "$srcdir"
    rm "$pkgdir"/usr/lib32/LLVMgold.so

    mv "$pkgdir"/usr/bin/llvm-config "$pkgdir"/usr/lib32/llvm-config
    mv "$pkgdir"/usr/include/llvm/Config/llvm-config.h \
        "$pkgdir"/usr/lib32/llvm-config-32.h

    rm -rf "$pkgdir"/usr/{bin,include,share/{doc,man,llvm,opt-viewer}}

    # Needed for multilib (https://bugs.archlinux.org/task/29951)
    # Header stub is taken from Fedora
    install -d "$pkgdir/usr/include/llvm/Config"
    mv "$pkgdir/usr/lib32/llvm-config-32.h" "$pkgdir/usr/include/llvm/Config/"

    mkdir "$pkgdir"/usr/bin
    mv "$pkgdir"/usr/lib32/llvm-config "$pkgdir"/usr/bin/llvm-config32

    install -Dm644 "$srcdir"/llvm-project/llvm/LICENSE.TXT "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_lib32-llvm-libs-lw-git() {
  pkgdesc="Low Level Virtual Machine (runtime library)(32-bit) "
  depends=('lib32-libffi' 'lib32-zlib' 'lib32-ncurses' 'lib32-libxml2' 'lib32-gcc-libs')
  provides=(lib32-llvm-libs-git=$pkgver-$pkgrel)

  install -d "$pkgdir/usr/lib32"

  cp -P \
    "$srcdir"/lib{LLVM,LTO}*.so* \
    "$pkgdir/usr/lib32/"

  install -Dm644 "$srcdir/llvm-project/llvm/LICENSE.TXT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
