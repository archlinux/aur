_pkgname=RedPanda-CPP
pkgname=${_pkgname,,}
pkgver=2.26
pkgrel=1
pkgdesc='A fast, lightweight, open source, and cross platform C/C++/GNU Assembly IDE'
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64' 'riscv64')
url="https://github.com/royqh1979/$_pkgname"
license=('GPL3')
depends=(qt5-base qt5-svg gcc gdb)
makedepends=(qt5-tools)
makedepends_x86_64=(mingw-w64-gcc)
optdepends=(
    'clang: C/C++ compiler (alternative)'
)
optdepends_x86_64=(
    'mingw-w64-gcc: Windows C/C++ compiler'
    'wine: run Windows executable'
    'aarch64-linux-gnu-gcc: AArch64 C/C++ compiler'
    'qemu-user-static: run AArch64 executable'
    'qemu-user-static-binfmt: run AArch64 executable'
)
source=(
    "$_pkgname-$pkgver.tar.gz::https://github.com/royqh1979/$_pkgname/archive/refs/tags/$pkgver.tar.gz"
    'compiler_hint.lua'
)
sha256sums=('8f8a5d131c4155c0af23bf2a1faa9ad1899d092b598010d43ebb2d8f0604942c'
            '65647471f5360648800aaa6027a8d8be3e2121ce0c470b99b8cace6f1654f20d')

prepare() {
    sed -i '/CONFIG += ENABLE_LUA_ADDON/ { s/^#\s*// }' "$srcdir/$_pkgname-$pkgver/RedPandaIDE/RedPandaIDE.pro"
}

build() {
    local _utf8dir="$srcdir/$_pkgname-$pkgver/platform/windows/utf8"
    if [[ "$CARCH" == 'x86_64' ]]; then
        x86_64-w64-mingw32-gcc -Os -fno-exceptions -nodefaultlibs -nostdlib -c -o utf8init.x86_64.o "$_utf8dir/utf8init.cpp"
        x86_64-w64-mingw32-windres -O coff -o utf8manifest.x86_64.o "$_utf8dir/utf8manifest.rc"
        i686-w64-mingw32-gcc -Os -fno-exceptions -nodefaultlibs -nostdlib -c -o utf8init.i686.o "$_utf8dir/utf8init.cpp"
        i686-w64-mingw32-windres -O coff -o utf8manifest.i686.o "$_utf8dir/utf8manifest.rc"
    fi

    mkdir redpanda-build
    cd redpanda-build
    qmake \
        PREFIX='/usr' \
        LIBEXECDIR='/usr/lib' \
        XDG_ADAPTIVE_ICON=ON \
        "$srcdir/$_pkgname-$pkgver/Red_Panda_CPP.pro"
    make
}

package() {
    local _libexecdir="$pkgdir/usr/lib/RedPandaCPP"
    install -Dm644 "compiler_hint.lua" "$_libexecdir/compiler_hint.lua"

    if [[ "$CARCH" == 'x86_64' ]]; then
        install -Dm644 "utf8init.x86_64.o" "$_libexecdir/x86_64-w64-mingw32/utf8init.o"
        install -Dm644 "utf8manifest.x86_64.o" "$_libexecdir/x86_64-w64-mingw32/utf8manifest.o"
        install -Dm644 "utf8init.i686.o" "$_libexecdir/i686-w64-mingw32/utf8init.o"
        install -Dm644 "utf8manifest.i686.o" "$_libexecdir/i686-w64-mingw32/utf8manifest.o"
    fi

    cd redpanda-build
    make INSTALL_ROOT="$pkgdir" install
}
