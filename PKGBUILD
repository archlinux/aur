# Maintainer: Alexander Rødseth <rodseth@gmail.com>

pkgname=moonscript
pkgver=0.2.6
_luaver=5.2
pkgrel=2
pkgdesc='Dynamic scripting language that compiles into Lua'
arch=('x86_64' 'i686')
url='http://moonscript.org/'
license=('MIT')
depends=('luarocks' 'lua' 'lua-filesystem' 'lua-lpeg' 'lua-alt-getopt')
optdepends=('linotify-git: lua bindings to inotify')
makedepends=('git' 'curl')
source=("https://raw.githubusercontent.com/leafo/moonscript/v$pkgver/moonscript-dev-1.rockspec"
        "https://raw.githubusercontent.com/leafo/moonscript/v$pkgver/README.md"
        "https://raw.githubusercontent.com/leafo/moonscript/v$pkgver/docs/reference.md"
        'http://moonscript.org/reference/index.html')
sha256sums=('91b5eeeb1e86d9cafc597dc9d274f78591ac5775b8442cc93fdd3fe650b162a1'
            'd9e055952371e6d23d47459da59f8c517929e65b9e27e55f82e7a1c3051cfdea'
            '8e38312f0b184a54fbc3ffae2b555fd862f78634b4fb5d7f073b9d3ccc938cf5'
            '75087f30d1c07905c10f1120470559b9afc1d78bf83b4fe3570179f558c5e88a')

prepare() {
  sed -i "s:5.1:$_luaver:g" moonscript-dev-1.rockspec
}
  
package() {
  install -d "$pkgdir/usr"
  luarocks-$_luaver install moonscript-dev-1.rockspec --to="$pkgdir/usr"
  install -Dm644 reference.md "$pkgdir/usr/share/doc/$pkgname/reference.md"
  install -Dm644 index.html "$pkgdir/usr/share/doc/$pkgname/index.html"
  install -Dm644 README.md "$pkgdir/usr/share/licenses/$pkgname/README.md"

  # Patching
  sed -i "s:$pkgdir::" "$pkgdir/usr/bin/"{moon,moonc}

  # Cleaning up
  rm -f "$pkgdir/usr/lib/lua/$_luaver/lfs.so"
  rm -f "$pkgdir/usr/lib/lua/$_luaver/lpeg.so"
  rm -f "$pkgdir/usr/share/lua/$_luaver/alt_getopt.lua"
  rm -f "$pkgdir/usr/share/lua/$_luaver/re.lua"

  # Fixing permissions
  chmod 755 "$pkgdir/usr" "$pkgdir/usr/bin/" "$pkgdir/usr/share/lua/$_luaver/" \
    "$pkgdir/usr/lib/lua/$_luaver/" "$pkgdir/usr/lib" "$pkgdir/usr/share" \
    "$pkgdir/usr/share/lua" "$pkgdir/usr/lib/lua"
}

# vim:set ts=2 sw=2 et:
