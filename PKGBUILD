# $Id: PKGBUILD 288140 2017-02-06 17:03:06Z anatolik $
# Maintainer: raingloom <raingloom42@gmail.com>

# based on the official Lua PKGBUILD

pkgname=eris
pkgver=1.1.2
_luaname=lua
_luaver='5.3.4'
_majorver=${_luaver%.*}
pkgrel=4
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
          'b0131dc43d52e3fde2be7963ad928bc94f3e597b'
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
    INSTALL_INC="$pkgdir"/usr/include/$pkgname \
    INSTALL_MAN="$pkgdir"/usr/share/man/man1 \
    install
  
  ln -sf /usr/bin/$pkgname "$pkgdir"/usr/bin/$pkgname$_majorver
  ln -sf /usr/bin/"$pkgname"c "$pkgdir"/usr/bin/"$pkgname"c$_majorver

  install -Dm644 lua.pc "$pkgdir"/usr/lib/pkgconfig/${pkgname}53.pc
  ln -sf /usr/lib/pkgconfig/${pkgname}53.pc "$pkgdir"/usr/lib/pkgconfig/$pkgname.pc

  mv "$pkgdir"/usr/bin/lua "$pkgdir"/usr/bin/$pkgname
  mv "$pkgdir"/usr/bin/luac "$pkgdir"/usr/bin/"$pkgname"c

  mv "$pkgdir"/usr/lib/liblua.so \
     "$pkgdir"/usr/lib/liblua-"$pkgname".so
  mv "$pkgdir"/usr/lib/liblua.so."$_majorver" \
     "$pkgdir"/usr/lib/liblua-"$pkgname$_majorver".so
  mv "$pkgdir"/usr/lib/liblua.so."$_luaver" \
     "$pkgdir"/usr/lib/liblua-eris.so."$_luaver"
  mv "$pkgdir"/usr/lib/liblua.a \
     "$pkgdir"/usr/lib/liblua-eris.a

  #install -d "$pkgdir"/usr/share/doc/$pkgname
  install -Dm644 ../LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
