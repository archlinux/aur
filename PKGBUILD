# Maintainer: BrinkerVII <brinkervii@gmail.com>

_pkgbase=luau
pkgname=luau
pkgver=0.582
pkgrel=1

pkgdesc='A fast, small, safe, gradually typed embeddable scripting language derived from Lua'
arch=('any')
url='https://github.com/Roblox/luau'
license=('MIT')

makedepends=('unzip' 'cmake')
conflicts=("$_pkgbase"-git "$_pkgbase"-bin)
provides=("$_pkgbase")

source=(
    "luau-$pkgver.zip::https://github.com/Roblox/luau/archive/refs/tags/$pkgver.zip"
    'Luau.pc'
)

sha512sums=('a9941c590650d610d4dbc93e64add3f31b14449508e0251e6a8d04adac949eab9a5ef945bc9f15580f045e58acb0ff2fd3832c10b194f0a6bd1360b8cc939998'
            'b17989fc739e2c101e0d515ded8815b4de3f54b2a67e1893cd1e9aa88cc541b3f667514cdf8a04db60aa9db050971cdbd8b386cd1458f567e784de983f63e88a')

prepare() {
    unzip -o "luau-$pkgver.zip"
}

build() {
    _build_dir=$srcdir/build-$pkgver
    _luau_root=$srcdir/luau-$pkgver

    _cpu_threads=$(grep -c processor /proc/cpuinfo)
    export MAKEFLAGS="-j $_cpu_threads"

    mkdir -p "$_build_dir"
    cd "$_build_dir"

    cmake "$_luau_root" -DCMAKE_BUILD_TYPE=Release
    cmake --build . --target Luau.Repl.CLI Luau.Analyze.CLI --config Release
}

_install_headers() {
    _header_source=$1
    for file in $(find "$_header_source" -type f -name *.h); do
        install -Dm644 "$file" "$pkgdir/usr/include/Luau/${file#${_header_source}}"
    done
}

package() {
    _build_dir=$srcdir/build-$pkgver
    _luau_root=$srcdir/luau-$pkgver

    install -Dm755 "$_build_dir/luau" "$pkgdir/usr/bin/luau"
    install -Dm755 "$_build_dir/luau-analyze" "$pkgdir/usr/bin/luau-analyze"

    for file in $(find "$_build_dir" -type f -name *.a); do
        install -Dm644 "$file" "$pkgdir/usr/lib/Luau/${file#${_build_dir}}"
    done

    _install_headers "$_luau_root/Analysis/include"
    _install_headers "$_luau_root/Ast/include"
    _install_headers "$_luau_root/Compiler/include"
    _install_headers "$_luau_root/VM/include"

    install -Dm644 "$srcdir/Luau.pc" "$pkgdir/usr/lib/pkgconfig/Luau.pc"
}