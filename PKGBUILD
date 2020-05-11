# Maintainer: jakbyte <jakbyte@protonmail.com>
# Contributor: jakbyte <jakbyte@protonmail.com>

pkgname=("lld7" "lld7-headers" "lld7-libs" "lld7-libs-static" "lld7-docs")
pkgdesc="Linker from the LLVM project."
pkgver="7.1.0"
pkgrel="2"
arch=("x86_64")
url="https://lld.llvm.org/"
license=("custom:University of Illinois/NCSA Open Source License")
makedepends=("llvm7" "cmake" "ninja" "python-sphinx")
conflicts=("lld")

_source_prefix=https://github.com/llvm/llvm-project/releases/download/llvmorg-$pkgver
source=($_source_prefix/lld-$pkgver.src.tar.xz{,.sig}
        $_source_prefix/llvm-$pkgver.src.tar.xz{,.sig}
        sphinx2.patch)
sha256sums=("a10f274a0a09408eaf9c088dec6fb2254f7d641221437763c94546cbfe595867"
            "SKIP"
            "1bcc9b285074ded87b88faaedddb88e6b5d6c331dfcfb57d7f3393dd622b3764"
            "SKIP"
            "7f7cca66a16c5a4aca132bfa1d86a7a2ff33612ec47d3422dc91ad4cc1810646")
validpgpkeys+=("474E22316ABF4785A88C6E8EA2C794A986419D8A") # Tom Stellard <tstellar@redhat.com>

prepare() {
    cd "$srcdir/lld-$pkgver.src"
    mkdir build
    mkdir build/static

    # https://bugs.llvm.org/show_bug.cgi?id=41789
    patch -Np1 -i ../sphinx2.patch
}

build() {
    # Build lld.
    cd "$srcdir/lld-$pkgver.src/build"
    cmake .. -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DPYTHON_EXECUTABLE=/usr/bin/python \
        -DBUILD_SHARED_LIBS=ON \
        -DLLVM_LINK_LLVM_DYLIB=ON \
        -DLLVM_INCLUDE_TESTS=ON \
        -DLLVM_BUILD_TESTS=ON \
        -DLLVM_BUILD_DOCS=ON \
        -DLLVM_ENABLE_SPHINX=ON \
        -DLLVM_EXTERNAL_LIT=/usr/bin/lit \
        -DLLVM_MAIN_SRC_DIR="$srcdir/llvm-$pkgver.src"
    ninja

    # Build lld with static libraries.
    cd "$srcdir/lld-$pkgver.src/build/static"
    cmake ../.. -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DPYTHON_EXECUTABLE=/usr/bin/python \
        -DBUILD_SHARED_LIBS=OFF \
        -DLLVM_LINK_LLVM_DYLIB=ON \
        -DLLVM_INCLUDE_TESTS=ON \
        -DLLVM_BUILD_TESTS=ON \
        -DLLVM_BUILD_DOCS=ON \
        -DLLVM_ENABLE_SPHINX=ON \
        -DLLVM_EXTERNAL_LIT=/usr/bin/lit \
        -DLLVM_MAIN_SRC_DIR="$srcdir/llvm-$pkgver.src"
    ninja
}

check() {
    # Run the tests.
    cd "$srcdir/lld-$pkgver.src/build"
}

package_lld7() {
    pkgdesc="Linker from the LLVM project."
    depends=("lld7-headers" "lld7-libs" "llvm7-libs")

    # Install lld.
    cd "$srcdir/lld-$pkgver.src/build"
    DESTDIR="$pkgdir" ninja install

    # Remove header, shared library, and documentation files.
    rm -r "$pkgdir"/usr/{include,lib,share/doc}

    # Install the license.
    install -Dm644 ../LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_lld7-headers() {
    pkgdesc="Headers from the linker from the LLVM project."
    depends=("llvm7-libs")

    # Install lld.
    cd "$srcdir/lld-$pkgver.src/build"
    DESTDIR="$pkgdir" ninja install

    # Remove binary, shared library, and documentation files.
    rm -r "$pkgdir"/usr/{bin,lib,share/doc}

    # Install the license.
    install -Dm644 ../LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_lld7-libs() {
    pkgdesc="Shared libraries from the linker from the LLVM project."
    depends=("llvm7-libs")

    # Install lld.
    cd "$srcdir/lld-$pkgver.src/build"
    DESTDIR="$pkgdir" ninja install

    # Remove binary, header, and documentation files.
    rm -r "$pkgdir"/usr/{bin,include,share/doc}

    # Install the license.
    install -Dm644 ../LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_lld7-libs-static() {
    pkgdesc="Static libraries from the linker from the LLVM project."
    depends=("llvm7-libs")

    # Install lld.
    cd "$srcdir/lld-$pkgver.src/build/static"
    DESTDIR="$pkgdir" ninja install

    # Remove binary, header, and documentation files.
    rm -r "$pkgdir"/usr/{bin,include,share/doc}

    # Install the license.
    install -Dm644 ../../LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_lld7-docs() {
    pkgdesc="Documentation from the linker from the LLVM project."

    # Install lld.
    cd "$srcdir/lld-$pkgver.src/build"
    DESTDIR="$pkgdir" ninja install

    # Remove binary, header, shared library, and documentation source files.
    rm -r "$pkgdir"/usr/{bin,include,lib,share/doc/lld/html/{_sources,.buildinfo}}

    # Install the license.
    install -Dm644 ../LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
