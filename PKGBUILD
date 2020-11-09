# Contributor: Llewelyn Trahaearn <woefulderelict [at] gmail [dot] com>
# Contributor: Daniel Micay <danielmicay [at] gmail [dot] com>
# Contributor: MThinkCpp <mtc [dot] maintainer [at] outlook [dot] com>
# Maintainer: Kuan-Yen Chou <kuanyenchou [at] gmail [dot] com>

pkgbase=klee-libc++
pkgname=(${pkgbase}{,abi,experimental})
pkgver=10.0.1
pkgrel=4
url="https://libcxx.llvm.org/"
license=('custom:Apache 2.0 with LLVM Exception')
arch=('i686' 'x86_64')
depends=('gcc-libs')
makedepends=('clang' 'cmake' 'llvm' 'libunwind' 'ninja' 'python' 'gllvm-git')
source=("https://github.com/llvm/llvm-project/releases/download/llvmorg-$pkgver/llvm-$pkgver.src.tar.xz"
        "https://github.com/llvm/llvm-project/releases/download/llvmorg-$pkgver/libcxx-$pkgver.src.tar.xz"
        "https://github.com/llvm/llvm-project/releases/download/llvmorg-$pkgver/libcxxabi-$pkgver.src.tar.xz")
noextract=("${source[@]##*/}")
sha512sums=('cf34d037c1684d09e7e38d5fc131714eac93c78353d6186b2f806a8fb22dcae0f4748ce22d6faf178c95cfcf20bdc3fa7c5238518a154b3112781f5ab70edaa4'
            'edc756751c8386f1868582d1974ef817ca5de34283474e0df3ce5df8ae213ca0601a5a1e089d09bdbfa8fca6c3f2fb2daa5cca8ca134f47dad738cc90f3c3f71'
            '1c58081e11746d5b63123dfb81b562eba925b31dc1a09413663c622a2cd56e8d17a2f184f6c3d78be292719fcc13f08aecaf9442f15b50682bd031416fe58a45')
 
prepare() {
    mkdir -p build llvm/projects/libcxx llvm/projects/libcxxabi
    bsdtar --strip-components 1 -zxf "${source[0]##*/}" -C llvm
    bsdtar --strip-components 1 -zxf "${source[1]##*/}" -C llvm/projects/libcxx
    bsdtar --strip-components 1 -zxf "${source[2]##*/}" -C llvm/projects/libcxxabi
    sed -i 's/CREDITS.TXT/CREDITS/' llvm/projects/libcxx/LICENSE.TXT llvm/projects/libcxxabi/LICENSE.TXT
    sed -i 's/\.hasWarningFlag/\.hasCompileFlag/' llvm/projects/libcxx/utils/libcxx/{compiler.py,test/config.py}
}
 
build() {
    cd "$srcdir/build"
    # https://wiki.archlinux.org/index.php/Clang#Build_packages_with_Clang
    CFLAGS=${CFLAGS/-fvar-tracking-assignments}
    CXXFLAGS=${CXXFLAGS/-fvar-tracking-assignments}
    export CC=gclang
    export CXX=gclang++
    export LLVM_COMPILER_PATH=/usr/bin

    cmake \
        -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_C_COMPILER=gclang \
        -DCMAKE_CXX_COMPILER=gclang++ \
        -DLIBCXX_INSTALL_EXPERIMENTAL_LIBRARY=NO \
        "$srcdir/llvm"
    ninja cxx cxxabi cxx_experimental

    local libraries=("$srcdir"/build/lib/lib*.{a,so*})
    for p in "${libraries[@]}"; do
        filetype="$(file "$p")"
        if [[ "$filetype" == *"ar archive"* || "$filetype" == *"shared object"* ]]; then
            get-bc "$p"
        fi
    done
}

check() {
    cd "$srcdir/build"
    ninja check-cxx check-cxxabi
}

package_klee-libc++() {
    pkgdesc='LLVM C++ standard library for KLEE.'
    depends=("klee-libc++abi=$pkgver-$pkgrel")
    options=('staticlibs' '!strip')
    provides=('libc++')
    conflicts=('libc++')

    cd "$srcdir/build"
    DESTDIR="$pkgdir" ninja install-libcxx

    install -Dm0644 -t "$pkgdir"/usr/share/"$pkgname"/usr/lib/ "$srcdir"/build/lib/libc++.bca
    install -Dm0644 -t "$pkgdir"/usr/share/"$pkgname"/usr/lib/ "$srcdir"/build/lib/libc++.so*.bc
    ln -s libc++.so.1.0.bc "$pkgdir"/usr/share/"$pkgname"/usr/lib/libc++.so.bc
    ln -s libc++.so.1.0.bc "$pkgdir"/usr/share/"$pkgname"/usr/lib/libc++.so.1.bc
    install -Dm0644 "$srcdir"/llvm/projects/libcxx/CREDITS.TXT "$pkgdir"/usr/share/licenses/"$pkgname"/CREDITS
    install -Dm0644 "$srcdir"/llvm/projects/libcxx/LICENSE.TXT "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
 
package_klee-libc++abi() {
    pkgdesc='Low level support for the LLVM C++ standard library for KLEE.'
    options=('staticlibs' '!strip')
    provides=('libc++abi')
    conflicts=('libc++abi')

    cd "$srcdir/build"
    DESTDIR="$pkgdir" ninja install-libcxxabi

    install -Dm0644 -t "$pkgdir"/usr/share/"$pkgname"/usr/lib/ "$srcdir"/build/lib/libc++abi.bca
    install -Dm0644 -t "$pkgdir"/usr/share/"$pkgname"/usr/lib/ "$srcdir"/build/lib/libc++abi.so*.bc
    ln -s libc++abi.so.1.0.bc "$pkgdir"/usr/share/"$pkgname"/usr/lib/libc++abi.so.bc
    ln -s libc++abi.so.1.0.bc "$pkgdir"/usr/share/"$pkgname"/usr/lib/libc++abi.so.1.bc
    mkdir -p "$pkgdir"/usr/src/ && cp -r "$srcdir"/llvm/projects/libcxxabi "$pkgdir"/usr/src/
    install -Dm0644 "$srcdir"/llvm/projects/libcxxabi/CREDITS.TXT "$pkgdir"/usr/share/licenses/"$pkgname"/CREDITS
    install -Dm0644 "$srcdir"/llvm/projects/libcxxabi/LICENSE.TXT "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
 
package_klee-libc++experimental() {
    pkgdesc='LLVM C++ experimental library for KLEE.'
    depends=("klee-libc++=$pkgver-$pkgrel")
    options=('staticlibs' '!strip')
    provides=('libc++experimental')
    conflicts=('libc++experimental')

    install -Dm0644 -t "$pkgdir"/usr/lib/ "$srcdir"/build/lib/libc++experimental.a
    install -Dm0644 -t "$pkgdir"/usr/share/"$pkgname"/usr/lib/ "$srcdir"/build/lib/libc++experimental.bca
    install -Dm0644 "$srcdir"/llvm/projects/libcxx/CREDITS.TXT "$pkgdir"/usr/share/licenses/"$pkgname"/CREDITS
    install -Dm0644 "$srcdir"/llvm/projects/libcxx/LICENSE.TXT "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
