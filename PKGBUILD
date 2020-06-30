pkgname=lua54
pkgver=5.4.0
pkgrel=1
pkgdesc='Powerful lightweight programming language designed for extending applications'
arch=('x86_64')
url='https://www.lua.org/'
depends=('readline')
license=('MIT')
options=('!emptydirs' '!strip')
source=(https://www.lua.org/ftp/lua-$pkgver.tar.gz
        liblua.so.patch
        lua.pc
        LICENSE)
sha512sums=('22aa0f9fcf953fc49c97bf50a4cee708b458e8a95447f881037b2c6ddd60e40368a807f2575671c6cd7497cedc2cf5716a8959c196445bf9a359fe7ebcd65465'
            '45ac0e43f200b2dc10d4bebf2d92c920f9082a3cb9d96ad4d6171fc8f0c625dbb9cf650d596042630246b1f9103bf2d912caae4161c1c0f032e10bcb017b31a3'
            'a3ae5f5c63a27956a2c69464cf966512be7404aef72d49b0b3b17e35999ceed04ec7be12ef19269f4cac908141b98dd5d16df9c238823fe0c1e068212914657a'
            'bef221ae96e72d11785ec608ce96fa688ce4e12fecaaadc8c3e38d7d153922f4fdd2cf06a47e9f8840a165d42d9aa31f44c322f5c6c8402e8e31475de4e5893b')
prepare() {
  cd lua-$pkgver
  patch -p1 -i ../liblua.so.patch

  sed "s/%VER%/${pkgver%.*}/g;s/%REL%/$pkgver/g" ../lua.pc > lua.pc
  sed -e 's:llua:llua5.4:' -e 's:/include:/include/lua5.4:' -i lua.pc
  sed -r -e '/^LUA_(SO|A|T)=/ s/lua/lua5.4/' -e '/^LUAC_T=/ s/luac/luac5.4/' -i src/Makefile
}

build() {
  cd lua-$pkgver

  make MYCFLAGS="$CFLAGS -fPIC -DLUA_COMPAT_5_1 -DLUA_COMPAT_5_2 -g" MYLDFLAGS="$LDFLAGS" linux
}

package() {
  cd lua-$pkgver

  make \
    TO_BIN='lua5.4 luac5.4' \
    TO_LIB="liblua5.4.a liblua5.4.so liblua5.4.so.5.4 liblua5.4.so.$pkgver" \
    INSTALL_DATA='cp -d' \
    INSTALL_TOP="$pkgdir"/usr \
    INSTALL_INC="$pkgdir"/usr/include/lua5.4 \
    INSTALL_MAN="$pkgdir"/usr/share/man/man1 \
    install

  install -Dm644 lua.pc "$pkgdir"/usr/lib/pkgconfig/$pkgname.pc

  install -d "$pkgdir"/usr/share/doc/$pkgname
  install -m644 doc/*.{gif,png,css,html} "$pkgdir"/usr/share/doc/$pkgname
  install -Dm644 ../LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

  ln -s liblua5.4.so "$pkgdir"/usr/lib/liblua.so.5.4
  ln -s liblua5.4.so "$pkgdir"/usr/lib/liblua.so.$pkgver
 
  cd "$pkgdir"/usr/share/man/man1
  mv lua.1 lua5.4.1
  mv luac.1 luac5.4.1
}
