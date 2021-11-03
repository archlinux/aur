# Maintainer: BrinkerVII <brinkervii@gmail.com>

_pkgbase=luau
pkgname=luau
pkgver=0.501
pkgrel=3

pkgdesc='A fast, small, safe, gradually typed embeddable scripting language derived from Lua'
arch=('any')
url='https://github.com/Roblox/luau'
license=('MIT')

makedepends=('unzip' 'cmake')
conflicts=("$_pkgbase"-git "$_pkgbase"-bin)
provides=("$_pkgbase")

source=("https://github.com/Roblox/luau/archive/refs/tags/$pkgver.zip")
sha512sums=('8f48af3714827ad188a05dded313ffdb5a403f4f660f9aa2077407272a010c334c727aaee606f5980aa304067d61801c932f149c015c791b70d9ff8b8f3cf3df')

prepare() {
    unzip -o "$pkgver.zip"
}

build() {
    _build_dir=$srcdir/build
    _luau_root=$srcdir/luau-$pkgver

    _cpu_threads=$(grep -c processor /proc/cpuinfo)
    export MAKEFLAGS="-j $_cpu_threads"

    mkdir -p "$_build_dir"
    cd "$_build_dir"

    cmake "$_luau_root" -DCMAKE_BUILD_TYPE=Release
    cmake --build . --target Luau.Repl.CLI Luau.Analyze.CLI --config Release
}

package() {
    _build_dir=$srcdir/build

    install -Dm755 "$_build_dir/luau" "$pkgdir/usr/bin/luau"
    install -Dm755 "$_build_dir/luau-analyze" "$pkgdir/usr/bin/luau-analyze"
}