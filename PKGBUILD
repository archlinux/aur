# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

_rockname=moonscript
_rockver=0.6.0
_rockrel=1

pkgbase="lua-$_rockname"
pkgname=(
  "lua-$_rockname"
  "lua51-$_rockname"
  "lua52-$_rockname"
  "lua53-$_rockname"
)
pkgver=$_rockver
pkgrel=1
pkgdesc='Dynamic scripting language that compiles into Lua'
url='https://moonscript.org'
license=('MIT')
arch=(any)
makedepends=(
  'luarocks' 'lua'{,51,52,53}
)
source=("$pkgbase-$pkgver.tar.gz::https://github.com/leafo/moonscript/archive/refs/tags/v$pkgver.tar.gz"
        LICENSE)
sha256sums=('b98e58f4657ffc2e730904da0b4034796ff16f08e4e6c47c681905fd56509037'
            '81dfcb5d1f1b97c76b5dec57809e203c536aac48e66260d4563137283717280b')
b2sums=('34f3006ec2c51f525d1aab9c42d79ca3361114c9dbd179be4b57e36604598d25d9613d5f8d22587a201cebfea0a1ef9ddf31a19389aafb31634d48f66f818fde'
        'bd1d80f17545a9e82d40589969b3eafea115715890fc3fcbe8f83fdff2839ecb1a8dd913beb97b56a8b4758d3d633f785b485063093f39a7876cc1e47623ed3f')

_package() {
  depends+=("${pkgname%-*}")

  cd "$_rockname-$_rockver"

  local lua_version="$1"
  local lua_base="$2"
  depends+=("$lua_base-lpeg" "$lua_base-filesystem" "$lua_base-alt-getopt")
  pkgdesc="$pkgdesc ($lua_version)"

  luarocks --lua-version="$lua_version" --tree="$pkgdir/usr" \
    make --deps-mode=none --no-manifest "$_rockname-dev-$_rockrel.rockspec"

  rm -rf \
    "$pkgdir/usr/bin" \
    "$pkgdir/usr/lib/luarocks/rocks-$lua_version/$_rockname/"*"/bin"

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" "$srcdir/LICENSE"
}

package_lua-moonscript() {
  _package 5.4 lua
}

package_lua51-moonscript() {
  _package 5.1 lua51
}

package_lua52-moonscript() {
  _package 5.2 lua52
}

package_lua53-moonscript() {
  _package 5.3 lua53
}
