# Maintainer: Llewelyn Trahaearn <WoefulDerelict at GMail dot com>
# Contributor: xw258
# Contributor: genesis66
_pkgbase=fltk
pkgname=lib32-${_pkgbase}
pkgver=1.3.3
pkgrel=1
pkgdesc="Graphical user interface toolkit for X (32-bit)"
arch=('x86_64')
url="http://www.fltk.org"
license=('LGPL')
depends=('fltk' 'lib32-gcc-libs' 'lib32-libjpeg-turbo' 'lib32-libpng' 'lib32-libxft' 'lib32-libxinerama')
install=${pkgname}.install
source=(http://fltk.org/pub/${_pkgbase}/${pkgver}/${_pkgbase}-${pkgver}-source.tar.gz)
sha512sums=('277ba27e35c20e2d4fc5296bf418c5ab78c821870476e21d49f723765b99b3a559eed4ecd5215ac26d53a1091ada003e17f1553194cebaa97dd854809dd2885d')

prepare() {
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  patch -p1 -i ../../tigervnc.patch
  patch -p1 -i ../../fltk-config-dynlibs.patch
  sed -i 's/class Fl_XFont_On_Demand/class FL_EXPORT Fl_XFont_On_Demand/' FL/x.H
}

build() {
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  sed -i -e 's/$(LINKFLTK)/$(LINKSHARED)/' \
    -e 's/$(LINKFLTKIMG)/$(LINKSHARED)/' test/Makefile
  ./configure --prefix=/usr --libdir=/usr/lib32 --libexecdir=/usr/lib32/fltk --enable-threads --enable-xft --enable-shared CC='gcc -m32' CXX='g++ -m32'
  make
}

package() {
  cd "${srcdir}/${_pkgbase}-${pkgver}"

  make DESTDIR="${pkgdir}" install
  make DESTDIR="${pkgdir}" -C fluid install install-linux
  chmod 644 "${pkgdir}"/usr/lib32/*.a
  rm -rf ${pkgdir}/usr/{bin,include,share}
}
