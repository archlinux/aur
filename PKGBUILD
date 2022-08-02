# Maintainer: Davorin Učakar <davorin.ucakar@gmail.com>
# Maintainer: Juergen Hoetzel <juergen@archlinux.org>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>

pkgname=lib32-lua
pkgver=5.4.4
_majorver=${pkgver%.*}
pkgrel=1
pkgdesc="A powerful light-weight programming language designed for extending applications"
arch=('x86_64')
url="http://www.lua.org/"
depends=('lua' 'lib32-readline')
makedepends=('lib32-gcc-libs')
license=('MIT')
options=('!makeflags' '!emptydirs')
source=("http://www.lua.org/ftp/lua-${pkgver}.tar.gz"
        'lua.pc'
        'liblua.so.patch')
sha512sums=('af0c35d5ba00fecbb2dd617bd7b825edf7418a16a73076e04f2a0df58cdbf098dc3ff4402e974afd789eb5d86d2e12ec6df9c84b99b23656ea694a85f83bcd21'
            '318ad674d2b9492d5387ee1039ac1bf0f1f547c98e7c06474c9658b5f2cbe814267580ccd1b76b567a1d8a21a62ec7bf53b8ff4629be9287e32a29f7a5d433e4'
            '33011be2cb52a228f00184ce55268255f74c0d389172cec24508231864ed73c804346ce689021effe0afcf4d4a149e79cfaa2ca3a4622aad84e2d79492d49301')

prepare() {
  cd lua-$pkgver
  patch -p1 -i ../liblua.so.patch

  sed "s/%VER%/$_majorver/g;s/%REL%/$pkgver/g" ../lua.pc > lua.pc
}

build() {
  cd lua-$pkgver

  export CFLAGS="${CFLAGS/-march=x86-64} -march=i686 -m32 -fPIC"
  export LDFLAGS="${LDFLAGS/-march=x86-64} -march=i686 -m32"

  make MYCFLAGS="$CFLAGS -fPIC" MYLDFLAGS="$LDFLAGS" linux-readline
}

package() {
  cd lua-$pkgver

  make \
    TO_LIB="liblua.a liblua.so liblua.so.$_majorver liblua.so.$pkgver" \
    INSTALL_DATA='cp -d' \
    INSTALL_TOP="$pkgdir"/usr \
    install
  mv "${pkgdir}"/usr/lib "${pkgdir}"/usr/lib32
  rm -rf "${pkgdir}"/usr/{bin,include,man}
  ln -sf /usr/lib32/liblua.so.$pkgver "$pkgdir"/usr/lib32/liblua$_majorver.so

  install -Dm644 lua.pc "$pkgdir"/usr/lib32/pkgconfig/lua54.pc
  ln -sf lua54.pc "$pkgdir"/usr/lib32/pkgconfig/lua.pc
  ln -sf lua54.pc "$pkgdir"/usr/lib32/pkgconfig/lua5.4.pc
  ln -sf lua54.pc "$pkgdir"/usr/lib32/pkgconfig/lua-5.4.pc

  install -dm755 "${pkgdir}"/usr/share/licenses
  ln -sf lua "${pkgdir}"/usr/share/licenses/lib32-lua
}

# vim: ts=2 sw=2 et
