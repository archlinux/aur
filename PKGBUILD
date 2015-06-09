# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Charles Bos <charlesbos1@gmail.com>
# Contributor: Balló György <ballogyor+arch@gmail.com>
# Contributor: Branchini Massimo <max.bra.gtalk@gmail.com>

pkgbase=libindicate
pkgname=('libindicate-gtk2' 'libindicate-gtk3' 'libindicate-sharp')
pkgver=12.10.1
pkgrel=4
pkgdesc='Library for raising indicators via DBus'
arch=('i686' 'x86_64')
url='https://launchpad.net/libindicate'
license=('LGPL')
depends=('dbus-glib' 'gtk2' 'libdbusmenu-glib' 'python2-gobject2')
makedepends=('gnome-doc-utils' 'gobject-introspection' 'gtk-doc' 'gtk-sharp-2'
             'gtk3' 'perl-xml-libxml' 'pygtk' 'vala')
options=('!emptydirs')
source=("http://launchpad.net/libindicate/${pkgver%.*}/${pkgver}/+download/libindicate-${pkgver}.tar.gz"
        'libindicate-mono.patch')
sha256sums=('41e0c059e96172975c716aa70dc60f669e21d359c65935c61ac374a9aa075581'
            'acf06964f453cca3627c9e4d73d1fcdd3713497316566910ab7522f8297ddcd6')

prepare() {
  cd libindicate-${pkgver}

  patch -Np2 -i ../libindicate-mono.patch
  sed -i 's|^#!.*python$|#!/usr/bin/python2|' examples/{im-client,listen-and-print}.py
  sed -i 's|pyglib-2.0-python$PYTHON_VERSION|pyglib-2.0-python2|' configure

  cd ..

  cp -r libindicate-${pkgver} libindicate-gtk2-${pkgver}
}

build() {
  cd libindicate-${pkgver}

  export PYTHON='/usr/bin/python2'

  ./configure \
    --prefix='/usr' \
    --localstatedir='/var' \
    --libexecdir='/usr/lib/libindicate' \
    --sysconfdir='/etc' \
    --disable-static
  make -j1

  cd ../libindicate-gtk2-${pkgver}

  ./configure \
    --prefix='/usr' \
    --localstatedir='/var' \
    --libexecdir='/usr/lib/libindicate' \
    --sysconfdir='/etc' \
    --with-gtk='2' \
    --disable-static
  make -j1
}

package_libindicate-gtk2() {
  provides=('libindicate')
  conflicts=('libindicate')

  cd libindicate-gtk2-${pkgver}

  make -j1 DESTDIR="${pkgdir}" install
  make -j1 -C bindings/mono DESTDIR="${pkgdir}" uninstall
}

package_libindicate-gtk3() {
  provides=('libindicate')
  conflicts=('libindicate')

  depends+=('gtk3')

  cd libindicate-${pkgver}

  make -j1 DESTDIR="${pkgdir}" install
  make -j1 -C bindings/mono DESTDIR="${pkgdir}" uninstall
}

package_libindicate-sharp() {
  arch=('any')
  depends=('libindicate' 'mono')

  cd libindicate-${pkgver}

  make -j1 -C bindings/mono DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
