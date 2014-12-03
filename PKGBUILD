# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
#Contributor: György Balló <ballogy@freestart.hu>

pkgname=sabayon
pkgver=2.30.1
pkgrel=2
pkgdesc="A system administration tool to define and deploy desktop profiles for the GNOME desktop environment"
arch=('i686' 'x86_64')
url="https://wiki.gnome.org/Apps/Sabayon"
license=('GPL')
depends=('pyxdg' 'pessulus' 'xorg-server-xephyr' 'libsm' 'hicolor-icon-theme' 'xdg-utils')
makedepends=('intltool' 'gnome-doc-utils')
optdepends=('gksu: to run sabayon directly from menu')
options=('!libtool')
install=$pkgname.install
source=(http://ftp.gnome.org/pub/GNOME/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.bz2)
sha256sums=('eff725ae2dad3d55a3580a83b821e2279787b5e3dfb280a1c38fa39d40dcc73a')

prepare() {
  cd "${srcdir}"/$pkgname-$pkgver
  sed -i 's@^#!.*python$@#!/usr/bin/python2@' admin-tool/sabayon{,-{apply,session}}
  sed -i 's/python -c/python2 -c/' configure

  #add gksu to desktop file
  sed -i 's/Exec=/Exec=gksu /' admin-tool/sabayon.desktop{,.in{,.in}}
}

build() {
  cd "${srcdir}"/$pkgname-$pkgver

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --libexecdir="/usr/lib/$pkgname" \
              --disable-static --disable-scrollkeeper \
              --with-distro=frugalware \
              PYTHON=python2
  make
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver

  make DESTDIR="${pkgdir}" install
}
