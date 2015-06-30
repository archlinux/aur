# Maintainer: Alexander Rødseth <rodseth@gmail.com>

pkgname=moonscript
pkgver=0.3.2
_luaver=5.3
pkgrel=1
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
sha256sums=('fa79aae67a890db6b7e73ff5cadc82c4475d33b1074e6bceded24f875ec614ba'
            '9e879781852dabd7fa6552e248ddcd592100e8a26487ef4365bbaec1612834f9'
            '9953d21e287d16cada2bd83c189d30fb037452c53cddb9f2a011e7fa0dbd71b9'
            '0b80a063b55bbf8ca44128e7b051e6519c4f9f75c4510f4b8346cc565321caf9')

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
