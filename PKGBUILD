# Maintainer: BrinkerVII <brinkervii@gmail.com>

_pkgbase=luau
pkgname=luau-git
pkgver=0.532.f1b46f4
pkgrel=1

pkgdesc='A fast, small, safe, gradually typed embeddable scripting language derived from Lua'
arch=('any')
url='https://github.com/Roblox/luau'
license=('MIT')

makedepends=('git' 'cmake')
conflicts=("$_pkgbase" "$_pkgbase"-bin)
provides=("$_pkgbase")

source=(
  'git+https://github.com/Roblox/luau.git'
)

sha512sums=(
  'SKIP'
)

pkgver() {
  pushd "$srcdir/$_pkgbase" > /dev/null

  _latest_tag=$(git describe --abbrev=0 --tags)
  _git_hash=$(git rev-parse --short HEAD)

  popd > /dev/null
  
  echo "$_latest_tag.$_git_hash"
}

build() {
    _build_dir=$srcdir/build
    
    _cpu_threads=$(grep -c processor /proc/cpuinfo)
    export MAKEFLAGS="-j $_cpu_threads"

    mkdir -p "$_build_dir"
    cd "$_build_dir"

    cmake "$srcdir/$_pkgbase" -DCMAKE_BUILD_TYPE=Release
    cmake --build . --target Luau.Repl.CLI Luau.Analyze.CLI --config Release
}

package() {
    _build_dir=$srcdir/build

    install -Dm755 "$_build_dir/luau" "$pkgdir/usr/bin/luau"
    install -Dm755 "$_build_dir/luau-analyze" "$pkgdir/usr/bin/luau-analyze"
}
