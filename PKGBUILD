# Maintainer: Davorin Učakar <davorin.ucakar@gmail.com>
# Maintainer: Juergen Hoetzel <juergen@archlinux.org>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>

pkgname=lib32-lua
pkgver=5.3.2
pkgrel=1
pkgdesc="A powerful light-weight programming language designed for extending applications"
arch=('x86_64')
url="http://www.lua.org/"
depends=('lua' 'lib32-readline')
license=('MIT')
options=('!makeflags' '!emptydirs')
source=("http://www.lua.org/ftp/lua-${pkgver}.tar.gz"
	'lua.pc'
        'liblua.so.patch')
sha1sums=('7a47adef554fdca7d0c5536148de34579134a973'
          '1fde8d1b96f0e2016678cca5b12cad00df300464'
          '863ca67b55136f8360350c6e4873ebeb1263dde2')

prepare() {
  cd "${srcdir}/lua-${pkgver}"

  patch -p1 -i "${srcdir}/liblua.so.patch"
}

build() {
  cd "${srcdir}/lua-${pkgver}"

  export CFLAGS="${CFLAGS/-march=x86-64} -march=i686 -m32 -fPIC"
  export LDFLAGS="${LDFLAGS/-march=x86-64} -march=i686 -m32"

  make MYCFLAGS="$CFLAGS" MYLDFLAGS="$LDFLAGS" R="$pkgver" linux
  sed "s/%VER%/${pkgver%.*}/g;s/%REL%/$pkgver/g" ../lua.pc > lua.pc
}

package() {
  cd "${srcdir}/lua-${pkgver}"
  make \
    TO_LIB="liblua.a liblua.so liblua.so.5.3 liblua.so.$pkgver" \
    INSTALL_DATA="cp -d" \
    INSTALL_TOP="${pkgdir}/usr" \
    install

  rm -rf "${pkgdir}"/usr/{include,man}
  mv "${pkgdir}"/usr/bin/lua "${pkgdir}"/usr/bin/lua32
  mv "${pkgdir}"/usr/bin/luac "${pkgdir}"/usr/bin/luac32
  mv "${pkgdir}"/usr/lib "${pkgdir}"/usr/lib32
  install -Dm644 lua.pc "$pkgdir/usr/lib32/pkgconfig/lua.pc"

  install -dm755 "${pkgdir}"/usr/share/licenses
  ln -sf lua "${pkgdir}"/usr/share/licenses/lib32-lua
}
