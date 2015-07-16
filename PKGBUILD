# Maintainer: Llewelyn Trahaearn <WoefulDerelict at GMail dot com>
# Maintainer: Padfoot <padfoot at exemail dot com dot au>
# Contributor: Maxime Gauduin <alucryd at gmail dot com>
# Contributor: josephgbr <rafael.f.f1 at gmail dot com>

pkgname=lib32-libvisual
pkgver=0.4.0
pkgrel=4
pkgdesc="Abstraction library that comes between applications and audio visualisation plugins (32-bit)"
arch=('x86_64')
url='http://sourceforge.net/projects/libvisual/'
license=('LGPL')
depends=('lib32-glibc' 'libvisual')
makedepends=('gcc-multilib')
source=("http://downloads.sourceforge.net/sourceforge/libvisual/libvisual-${pkgver}.tar.gz"
                "libvisual-0.4.0-inlinedefineconflict.patch")
sha512sums=('b897c49413a94f35a7f5d92c3c43215bd41da1ae7f9f2694cb17ab611b59286a75a20f6586c94b41f17a77786440fdb4ecb5655761ed14c8bef83e858755f8cf'
            '13872adb2f99bd989b954499f80d2bd2646369d3fdb190a07e02cada1c42de7a7c36ca368b70f024484eb621f4320649a83107d4874a01f37ab2e10806dca89d')

prepare(){
  cd "${srcdir}/libvisual-${pkgver}"

  # libvisual's definition of "inline" causes issues when compiling with the new C++11 ABI (patch from Fedora)
  patch -Np1 -i ../libvisual-0.4.0-inlinedefineconflict.patch
}

build() {
  cd "${srcdir}/libvisual-${pkgver}"
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export LDFLAGS='-m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  ./configure --prefix='/usr' --libdir='/usr/lib32'
  make
}

package() {
  cd "${srcdir}/libvisual-${pkgver}"
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}/usr/"{include,share}
}
