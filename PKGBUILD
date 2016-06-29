# Maintainer: Llewelyn Trahaearn <WoefulDerelict at GMail dot com>
# Contributor: xw258
# Contributor: genesis66

pkgname=lib32-fltk
pkgver=1.3.3
pkgrel=6
pkgdesc="Graphical user interface toolkit for X (32-bit)"
arch=('x86_64')
url="http://www.fltk.org"
license=('LGPL')
depends=("${pkgname#lib32-}" 'lib32-gcc-libs' 'lib32-glu' 'lib32-libjpeg-turbo' 'lib32-libpng' 'lib32-libxcursor' 'lib32-libxinerama' 'lib32-libxft')
makedepends=('gcc-multilib')
install=${pkgname}.install
source=("http://fltk.org/pub/${pkgname#lib32-}/${pkgver}/${pkgname#lib32-}-${pkgver}-source.tar.gz"
        "tigervnc.patch" "fltk-config-dynlibs.patch")
sha512sums=('277ba27e35c20e2d4fc5296bf418c5ab78c821870476e21d49f723765b99b3a559eed4ecd5215ac26d53a1091ada003e17f1553194cebaa97dd854809dd2885d'
            '30fd8ad3cbedc7e4cb0b3e08d21cc28aa9c8f20d4d1970646de931243c3752f55c4414d921aec29dbdf3b1e4eade0365d3c806fb5c9ecaa29ac3d7cf01f216be'
            '33743f009c4486cc2199dc90b031cfe977c779f6bf6e958de29a2180578f3866004f20f6411a049aa1192ea4f8adad4636cd90cb4f0ff6ae05205bd2bc016fef')

prepare() {
  cd "${pkgname#lib32-}-${pkgver}"
  patch -Np1 -i ${srcdir}/tigervnc.patch
  patch -Np1 -i ${srcdir}/fltk-config-dynlibs.patch
  sed -i 's/class Fl_XFont_On_Demand/class FL_EXPORT Fl_XFont_On_Demand/' FL/x.H
  sed -i -e 's/$(LINKFLTK)/$(LINKSHARED)/' -e 's/$(LINKFLTKIMG)/$(LINKSHARED)/' test/Makefile
}

build() {
  export LDFLAGS+=' -m32'
  export PKG_CONFIG_LIBDIR='/usr/lib32/pkgconfig'

  cd "${pkgname#lib32-}-${pkgver}"
  ./configure --prefix=/usr --libdir=/usr/lib32 --libexecdir=/usr/lib32/fltk --enable-threads --enable-xft --enable-shared CC='gcc -m32' CXX='g++ -m32'
  make
}

package() {
  cd "${pkgname#lib32-}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  make DESTDIR="${pkgdir}" -C fluid install install-linux
  chmod 644 "${pkgdir}"/usr/lib32/*.a
  rm -rf "${pkgdir}/usr/"{bin,include,share}
}
