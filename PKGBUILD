# Maintainer: Davorin Učakar <davorin.ucakar@gmail.com>
# Maintainer: Juergen Hoetzel <juergen@archlinux.org>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>

pkgname=lib32-lua
pkgver=5.3.5
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
sha512sums=('4f9516acc4659dfd0a9e911bfa00c0788f0ad9348e5724fe8fb17aac59e9c0060a64378f82be86f8534e49c6c013e7488ad17321bafcc787831d3d67406bd0f4'
            '318ad674d2b9492d5387ee1039ac1bf0f1f547c98e7c06474c9658b5f2cbe814267580ccd1b76b567a1d8a21a62ec7bf53b8ff4629be9287e32a29f7a5d433e4'
            '45b08200b86551cc368cff87984a362e5ed89d3c091e0334ff52a698c8bb07add748e5630a8d78c7ac05b378b07e4fb3f9f36a2760ed459200adc91a6e6baed3')

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

# vim: ts=2 sw=2 et
