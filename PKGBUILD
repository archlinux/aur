# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

_rockname=discount
pkgbase=lua-$_rockname
pkgname=("lua-$_rockname" "lua53-$_rockname" "lua52-$_rockname" "lua51-$_rockname")
pkgver=0.4
_rockrel=1
pkgrel=2
pkgdesc='Lua bindings for the Discount Markdown library'
arch=('x86_64')
url="https://github.com/craigbarnes/$pkgbase"
license=('ISC')
depends=('discount')
makedepends=('lua' 'lua53' 'lua52' 'lua51' 'luarocks')
source=("$url/archive/$pkgver.tar.gz"
        "https://luarocks.org/manifests/craigb/$_rockname-$pkgver-$_rockrel.rockspec"
        "LICENSE::$url/raw/master/LICENSE")
sha256sums=('3531eeddde4a89d5b7a4ab9b359a7f01a88ac85dd4fac61554eb199165cfdead'
            'edb216e8a28534f18d8950779b50dab083c8f339eaed90b68814b97c27af8255'
            '8b2fffc6b27a33bf6958a2a2293ce19ce5cbd7206ccb6dda7a9d3abe6f80c9fa')

prepare() {
  cp -f "$_rockname-$pkgver-$_rockrel.rockspec" "$pkgbase-$pkgver"
}

_build_helper() {
  cd "$srcdir"
  mkdir -p "$1"
  cd "$1"
  luarocks build \
    --pack-binary-rock \
    --lua-version="$1" \
    --deps-mode=none \
    "../$pkgname-$pkgver/$_rockname-$pkgver-$_rockrel.rockspec"
}

build() {
  local luas="5.1 5.2 5.3 5.4"
  for lua in "$luas"; do
    _build_helper "$lua"
  done
}

_package_helper() {
  luarocks install \
    --lua-version="$1" \
    --tree="$pkgdir/usr/" \
    --deps-mode=none \
    --no-manifest \
    "$1/$_rockname-$pkgver-$_rockrel.linux-x86_64.rock"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" "$srcdir/LICENSE"
}

package_lua-discount() {
  depends+=('lua')
  pkgdesc+=' (for Lua 5.4)'
  _package_helper 5.4
}

package_lua53-discount() {
  depends+=('lua53')
  pkgdesc+=' (for Lua 5.3)'
  _package_helper 5.3
}

package_lua52-discount() {
  depends+=('lua52')
  pkgdesc+=' (for Lua 5.2)'
  _package_helper 5.2
}

package_lua51-discount() {
  depends+=('lua51')
  pkgdesc+=' (for Lua 5.1)'
  _package_helper 5.1
}
