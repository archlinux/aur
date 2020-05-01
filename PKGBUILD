pkgname=lua54
_pkgver=5.4.0
_pkgaver=$_pkgver-rc2
pkgver=${_pkgaver//\-/.}
pkgrel=1
pkgdesc='Powerful lightweight programming language designed for extending applications'
arch=('x86_64')
url='https://www.lua.org/'
depends=('readline')
license=('MIT')
options=('!emptydirs' '!strip')
source=(https://www.lua.org/work/lua-$_pkgaver.tar.gz
        liblua.so.patch
        lua.pc
        LICENSE)
sha512sums=('1823e953adc3ad34a479a6cc67bdcf4dbb85d483aab2a51f71db70ad6e6a34576f2db986d7540b529eef92a43bfa9c16587e2e2426e66b12650c26e2a1ac5c21'
            'b53d289255cedde25608bcfe0ab21838744af08f99210543b1c56bbc70ba5fb1e1816581717b56fc173aa2b5f6f8ffc7a31408287d1d0fc7ef2f61a72c11591d'
            'a3ae5f5c63a27956a2c69464cf966512be7404aef72d49b0b3b17e35999ceed04ec7be12ef19269f4cac908141b98dd5d16df9c238823fe0c1e068212914657a'
            'bef221ae96e72d11785ec608ce96fa688ce4e12fecaaadc8c3e38d7d153922f4fdd2cf06a47e9f8840a165d42d9aa31f44c322f5c6c8402e8e31475de4e5893b')
prepare() {
  cd lua-$_pkgver
  patch -p1 -i ../liblua.so.patch

  sed "s/%VER%/${_pkgver%.*}/g;s/%REL%/$_pkgver/g" ../lua.pc > lua.pc
  sed -e 's:llua:llua5.4:' -e 's:/include:/include/lua5.4:' -i lua.pc
  sed -r -e '/^LUA_(SO|A|T)=/ s/lua/lua5.4/' -e '/^LUAC_T=/ s/luac/luac5.4/' -i src/Makefile
}

build() {
  cd lua-$_pkgver

  make MYCFLAGS="$CFLAGS -fPIC -DLUA_COMPAT_5_1 -DLUA_COMPAT_5_2 -g" MYLDFLAGS="$LDFLAGS" linux
}

package() {
  cd lua-$_pkgver

  make \
    TO_BIN='lua5.4 luac5.4' \
    TO_LIB="liblua5.4.a liblua5.4.so liblua5.4.so.5.4 liblua5.4.so.$_pkgver" \
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
  ln -s liblua5.4.so "$pkgdir"/usr/lib/liblua.so.$_pkgver
 
  cd "$pkgdir"/usr/share/man/man1
  mv lua.1 lua5.4.1
  mv luac.1 luac5.4.1
}
