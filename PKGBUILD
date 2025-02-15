# Maintainer: Davorin Učakar <davorin.ucakar@gmail.com>
# Maintainer: Juergen Hoetzel <juergen@archlinux.org>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>

pkgname=lib32-lua
pkgver=5.4.7
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
sha512sums=('98c5c8978dfdf867e37e9eb3b3ec83dee92d199243b5119505da83895e33f10d43c841be6a7d3b106daba8a0b2bd25fe099ebff8f87831dcc55c79c78b97d8b8'
            '318ad674d2b9492d5387ee1039ac1bf0f1f547c98e7c06474c9658b5f2cbe814267580ccd1b76b567a1d8a21a62ec7bf53b8ff4629be9287e32a29f7a5d433e4'
            '33011be2cb52a228f00184ce55268255f74c0d389172cec24508231864ed73c804346ce689021effe0afcf4d4a149e79cfaa2ca3a4622aad84e2d79492d49301')

prepare() {
  patch -d lua-$pkgver -p1 -i ../liblua.so.patch

  sed "s/%VER%/$_majorver/g;s/%REL%/$pkgver/g" lua.pc > lua-$pkgver/lua.pc
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
    TO_LIB="liblua.so liblua.so.$_majorver liblua.so.$pkgver" \
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
