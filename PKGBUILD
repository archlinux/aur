# Maintainer: Llewelyn Trahaearn <WoefulDerelict at GMail dot com>
# Contributor: Padfoot <padfoot at exemail dot com dot au>
# Contributor: Maxime Gauduin <alucryd at gmail dot com>
# Contributor: josephgbr <rafael.f.f1 at gmail dot com>

pkgname=lib32-libvisual
pkgver=0.4.0
pkgrel=5
pkgdesc="Abstraction library that comes between applications and audio visualisation plugins (32-bit)"
arch=('x86_64')
url='http://sourceforge.net/projects/libvisual/'
license=('LGPL')
depends=('lib32-glibc' "${pkgname#lib32-}")
makedepends=('gcc-multilib')
source=("http://downloads.sourceforge.net/sourceforge/${pkgname#lib32-}/${pkgname#lib32-}-${pkgver}.tar.gz"
        "libvisual-0.4.0-inlinedefineconflict.patch")
sha512sums=('ab2286de30d33582a92f16e46436fcbc44b74649952df6e94d96aedc2cabb18d3361496c0b8ab6f52f7178214bf735673c8f1820c3d149304787ba8407201b95'
            '13872adb2f99bd989b954499f80d2bd2646369d3fdb190a07e02cada1c42de7a7c36ca368b70f024484eb621f4320649a83107d4874a01f37ab2e10806dca89d')

prepare(){
  cd "${srcdir}/${pkgname#lib32-}-${pkgver}"
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export LDFLAGS='-m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  # libvisual's definition of "inline" causes issues when compiling with the new C++11 ABI (patch from Fedora)
  patch -Np1 -i ../libvisual-0.4.0-inlinedefineconflict.patch
}

build() {
  cd "${srcdir}/${pkgname#lib32-}-${pkgver}"
  ./configure --prefix='/usr' --libdir='/usr/lib32'
  make
}

package() {
  cd "${srcdir}/${pkgname#lib32-}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}/usr/"{include,share}
}
