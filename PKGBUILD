# $Id: PKGBUILD 288140 2017-02-06 17:03:06Z anatolik $
# Maintainer: raingloom <raingloom42@gmail.com>

# based on the official Lua PKGBUILD

pkgname=eris
pkgver=1.1.2
_luaname=lua
_luaver='5.3.4'
_majorver=${_luaver%.*}
pkgrel=1
pkgdesc='Heavy Duty Persistence for Lua 5.3'
arch=('any')
url='https://github.com/fnuecke/eris'
depends=('readline')
license=('MIT')
options=('!emptydirs')
source=("https://github.com/fnuecke/eris/archive/v${pkgver}-lua5.3.tar.gz"
        liblua.so.patch
        lua.pc
        LICENSE)
sha1sums=('77e2f1a5d5bfcdd8d829efdbe29f82680a8d3463'
          '9ff75085e476fa91bf5b528c9962908de80ba25a'
          '1aee8d1a219639d0efc534e483ffa1ee236fb393'
          '05f5f3b7bef0258bd617c505b8992de639af4551')

prepare() {
  cd "$pkgname-$pkgver-lua5.3"
  patch -p1 -i ../liblua.so.patch

  sed "s/%VER%/$_majorver/g;s/%REL%/$_luaver/g" ../lua.pc > lua.pc
}

build() {
  cd "$pkgname-$pkgver-lua5.3"

  # quite a lot of packages still use lua 5.1 API, enable 5.1 compat mode
  make MYCFLAGS="$CFLAGS -fPIC -DLUA_COMPAT_5_2 -DLUA_COMPAT_5_1" MYLDFLAGS="$LDFLAGS" linux
}

package() {
  cd "$pkgname-$pkgver-lua5.3"

  make \
    TO_LIB="liblua.a liblua.so liblua.so.$_majorver liblua.so.$_luaver" \
    INSTALL_DATA='cp -d' \
    INSTALL_TOP="$pkgdir"/usr \
    INSTALL_MAN="$pkgdir"/usr/share/man/man1 \
    install
  ln -sf /usr/bin/lua "$pkgdir"/usr/bin/lua$_majorver
  ln -sf /usr/bin/luac "$pkgdir"/usr/bin/luac$_majorver

  install -Dm644 lua.pc "$pkgdir"/usr/lib/pkgconfig/${pkgname}53.pc
  ln -sf /usr/lib/pkgconfig/${pkgname}53.pc "$pkgdir"/usr/lib/pkgconfig/$pkgname.pc

  install -d "$pkgdir"/usr/share/doc/$pkgname
  install -Dm644 ../LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
