# Maintainer: Alexander Rødseth <rodseth@gmail.com>

pkgname=moonscript
pkgver=0.4.0
_luaver=5.3
pkgrel=1
pkgdesc='Dynamic scripting language that compiles into Lua'
arch=('x86_64' 'i686')
url='http://moonscript.org/'
license=('MIT')
depends=('luarocks' 'lua' 'lua-filesystem' 'lua-lpeg' 'lua-alt-getopt')
makedepends=('git' 'curl')
source=("https://raw.githubusercontent.com/leafo/moonscript/v$pkgver/moonscript-dev-1.rockspec"
        "https://raw.githubusercontent.com/leafo/moonscript/v$pkgver/README.md"
        "https://raw.githubusercontent.com/leafo/moonscript/v$pkgver/docs/reference.md"
        'http://moonscript.org/reference/index.html')
sha256sums=('fbda4fad6c423bc0b45c735fde18092a8fd5dfb80adac62e3261aafcfbbb075a'
            'f5dd48848cea95444e1b676dac0e129c6475c5f9f9e937707a43bce007ba5dc9'
            '9953d21e287d16cada2bd83c189d30fb037452c53cddb9f2a011e7fa0dbd71b9'
            'd4bf9e8bf7109119c7ca9efe0d6037b71476f713e30755c5acfcfd3937b6ae70')

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
