# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=llvm14
pkgver=14.0.6
pkgrel=1
pkgdesc='LLVM and Clang 14 built from source with a shared libLLVM'
arch=('x86_64')
url='https://llvm.org/'
license=('Apache-2.0 WITH LLVM-exception')
depends=('glibc' 'gcc-libs' 'libgcc' 'zlib' 'libxml2' 'libffi' 'ncurses' 'z3' 'libedit'
         'libpfm' 'python' 'python-yaml' 'python-pygments' 'perl')
makedepends=('clang' 'cmake' 'ninja')
provides=("llvm14=$pkgver" "clang14=$pkgver")
conflicts=('llvm14' 'llvm14-bin')
options=('!debug' '!lto')
source=("llvm-project-${pkgver}.src.tar.xz::https://github.com/llvm/llvm-project/releases/download/llvmorg-${pkgver}/llvm-project-${pkgver}.src.tar.xz"
        "llvm14-${pkgver}-LICENSE.TXT::https://raw.githubusercontent.com/llvm/llvm-project/llvmorg-${pkgver}/llvm/LICENSE.TXT")
sha256sums=('8b3cfd7bc695bd6cea0f37f53f0981f34f87496e79e2529874fd03a2f9dd3a8a'
            '8d85c1057d742e597985c7d4e6320b015a9139385cff4cbae06ffc0ebe89afee')

prepare() {
    # LLVM 14 headers assumed <cstdint> arrived transitively; newer libstdc++ does not.
    local header
    for header in \
        "$srcdir/llvm-project-${pkgver}.src/llvm/include/llvm/ADT/SmallVector.h" \
        "$srcdir/llvm-project-${pkgver}.src/llvm/lib/Target/X86/MCTargetDesc/X86MCTargetDesc.h"; do
        grep -q '^#include <cstdint>' "$header" || sed -i '1i #include <cstdint>' "$header"
    done
}

build() {
    # LLVM 14 predates GCC 14; clang avoids its header regressions.
    export CC=clang
    export CXX=clang++
    cmake -S "$srcdir/llvm-project-${pkgver}.src/llvm" -B "$srcdir/build" -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr/lib/llvm14 \
        -DLLVM_ENABLE_PROJECTS='clang' \
        -DLLVM_BUILD_LLVM_DYLIB=ON \
        -DCLANG_LINK_CLANG_DYLIB=ON \
        -DLLVM_LINK_LLVM_DYLIB=ON \
        -DLLVM_TARGETS_TO_BUILD='X86' \
        -DLLVM_INCLUDE_EXAMPLES=OFF \
        -DLLVM_INCLUDE_TESTS=OFF \
        -DLLVM_INCLUDE_BENCHMARKS=OFF \
        -DLLVM_ENABLE_RTTI=OFF \
        -DLLVM_ENABLE_EH=OFF \
        -DLLVM_INSTALL_UTILS=ON
    ninja -C "$srcdir/build"
}

check() {
    "$srcdir/build/bin/llvm-config" --version
    [[ $("$srcdir/build/bin/llvm-config" --version) == "$pkgver" ]]
    [[ $("$srcdir/build/bin/llvm-config" --shared-mode) == shared ]]
    "$srcdir/build/bin/clang" --version
}

package() {
    install -Dm644 /dev/null "$pkgdir/etc/ld.so.conf.d/llvm14.conf"
    printf '/usr/lib/llvm14/lib\n' > "$pkgdir/etc/ld.so.conf.d/llvm14.conf"
    DESTDIR="$pkgdir" ninja -C "$srcdir/build" install
    local file
    while IFS= read -r file; do
        python3 -c 'import pathlib,sys; old=sys.argv[2].encode(); new=b"/usr/lib/llvm14"+b"X"*(len(old)-len(b"/usr/lib/llvm14")); f=pathlib.Path(sys.argv[1]); f.write_bytes(f.read_bytes().replace(old,new))' "$file" "$srcdir"
    done < <(grep -arl -- "$srcdir" "$pkgdir/usr/lib/llvm14")
    install -d "$pkgdir/usr/bin"
    local binary name
    for binary in "$pkgdir/usr/lib/llvm14/bin/"*; do
        name=${binary##*/}
        [[ $name == *-14 ]] && continue
        ln -s "../lib/llvm14/bin/$name" "$pkgdir/usr/bin/$name-14"
    done
    install -Dm644 "llvm14-${pkgver}-LICENSE.TXT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.TXT"
}
