# Maintainer: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=gtkmathview
pkgver=0.8.0
pkgrel=9
pkgdesc="C++ rendering engine for MathML documents"
arch=('x86_64')
url="http://helm.cs.unibo.it/mml-widget/"
license=('LGPL3')
depends=('popt' 't1lib' 'libxml2' 'glib2')
source=(http://helm.cs.unibo.it/mml-widget/sources/${pkgname}-${pkgver}.tar.gz
        gtkmathview-0.8.0-gcc43.patch
        gtkmathview-0.8.0-cond-t1.patch
        gtkmathview-0.8.0-gcc47.patch
        gtkmathview-0.8.0-includes.patch
        gtkmathview-gcc6.patch
        gtkmathview-gcc7.patch)
sha256sums=('1dc30175da6a3c560a7d62d1abe1c2f9829d988e6f1a7c5e766544575c558c43'
            'e55785f4dafedfe97679ce51e0753ffdd5eb8036b1dd00653b22e6e89aa02beb'
            '731894b852a8f692a3a1778bf6666a43e6afaa38e30b73d90272ae56d65bf709'
            '1437647e6782547021a774df6ee3efd23c1b80941044d4bf44b283879636fb3e'
            '09641f1547c5a526fc901b417ba1b1ae59ea251e56164dbf765ee7132e0c988b'
            '4ed73eb412392adbb48ea069290bb2a4d0c2de98597f55171b35ab01f72e7734'
            '7921e647ef4bd5d94c5218a15b636fc1f01c4dc33f60175b6046bce726c9cfb9')

prepare() {
  cd ${pkgname}-${pkgver}
  patch -p1 -i ../gtkmathview-0.8.0-gcc43.patch
  patch -p1 -i ../gtkmathview-0.8.0-gcc47.patch
  patch -p1 -i ../gtkmathview-0.8.0-includes.patch
  patch -p1 -i ../gtkmathview-0.8.0-cond-t1.patch
  patch -p1 -i ../gtkmathview-gcc6.patch # Debian patch  
  patch -p1 -i ../gtkmathview-gcc7.patch # Debian patch

  # AM_BINRELOC missing, just ignore
  echo 'AC_DEFUN([AM_BINRELOC], [])' > acinclude.m4
  autoreconf -if
}

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --disable-static \
    --disable-gtk \
    --disable-gmetadom
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}/" install
}

