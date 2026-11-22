# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=llvm14-bin
pkgver=14.0.6
pkgrel=1
pkgdesc='LLVM 14 and Clang toolchain from upstream binaries'
arch=('x86_64')
url='https://llvm.org/'
license=('Apache-2.0 WITH LLVM-exception')
depends=('glibc' 'libstdc++.so' 'libgcc' 'gcc')
makedepends=('patchelf')
optdepends=('python: analysis and scan-view scripts' 'perl: scan-build scripts')
provides=("llvm14=$pkgver" "clang14=$pkgver")
conflicts=('llvm14' 'clang14')
# llvm-config exposes the upstream static component libraries to SDK consumers.
options=('!debug' 'staticlibs')
_archive="clang+llvm-${pkgver}-x86_64-linux-gnu-rhel-8.4"
source=("${_archive}.tar.xz::https://github.com/llvm/llvm-project/releases/download/llvmorg-${pkgver}/${_archive/+/%2B}.tar.xz"
        "llvm14-${pkgver}-LICENSE.TXT::https://raw.githubusercontent.com/llvm/llvm-project/llvmorg-${pkgver}/llvm/LICENSE.TXT")
sha256sums=('7412026be8bb8f6b4c25ef58c7a1f78ed5ea039d94f0fa633a386de9c60a6942'
            '8d85c1057d742e597985c7d4e6320b015a9139385cff4cbae06ffc0ebe89afee')

_latestver() {
    gh api --paginate repos/llvm/llvm-project/tags --jq '.[].name' |
        sed -nE 's/^llvmorg-(14\.[0-9]+\.[0-9]+)$/\1/p' | sort -V | tail -1
}

check() {
    cd "$_archive"
    [[ $(bin/llvm-config --version) == "$pkgver" ]]
    bin/clang --version
    printf 'int main(void) { return 0; }\n' > "$srcdir/hello.c"
    bin/clang "$srcdir/hello.c" -o "$srcdir/hello"
    "$srcdir/hello"
    bin/clang -emit-llvm -c "$srcdir/hello.c" -o "$srcdir/hello.bc"
    bin/llvm-dis "$srcdir/hello.bc" -o /dev/null
}

package() {
    install -d "$pkgdir/usr/lib/llvm14" "$pkgdir/usr/bin"
    cp -a "$_archive/." "$pkgdir/usr/lib/llvm14/"

    # libc++ must find its matching ABI library without altering the system linker path.
    patchelf --set-rpath '$ORIGIN' "$pkgdir/usr/lib/llvm14/lib/libc++.so.1.0"

    local binary name
    for binary in "$pkgdir/usr/lib/llvm14/bin/"*; do
        name=${binary##*/}
        [[ $name == *-14 ]] && continue
        ln -s "../lib/llvm14/bin/$name" "$pkgdir/usr/bin/$name-14"
    done

    install -Dm644 "llvm14-${pkgver}-LICENSE.TXT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.TXT"
}
