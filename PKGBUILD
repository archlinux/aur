# Maintainer: BrinkerVII <brinkervii@gmail.com>

_pkgbase=luau
pkgname=luau-git
pkgver=0.530.55a0268
pkgrel=2

pkgdesc='A fast, small, safe, gradually typed embeddable scripting language derived from Lua'
arch=('any')
url='https://github.com/Roblox/luau'
license=('MIT')

makedepends=('git' 'cmake')
conflicts=("$_pkgbase" "$_pkgbase"-bin)
provides=("$_pkgbase")

source=(
  'git+https://github.com/Roblox/luau.git'
  '0001-Include-utility.patch'  
)

sha512sums=(
  'SKIP'
  '430480ea8d40db9f8f60419bc6e317f72b5718ff830877f676313e1d64906ef5168d51bd9a45c816cfb74c6f4838034b84661b4737a84daf1ad6d4988024c372'
)

pkgver() {
  pushd "$srcdir/$_pkgbase" > /dev/null

  _latest_tag=$(git describe --abbrev=0 --tags)
  _git_hash=$(git rev-parse --short HEAD)

  popd > /dev/null
  
  echo "$_latest_tag.$_git_hash"
}

prepare() {
  pushd "$srcdir/$_pkgbase"
  patch -p1 < "$srcdir/0001-Include-utility.patch"
  popd
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
