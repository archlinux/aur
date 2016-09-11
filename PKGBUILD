# Maintainer: Michael DeGuzis <mdeguzis@gmail.com>

pkgbase=snes9x-git
pkgname=('snes9x-git' 'snes9x-gtk-git')
pkgver=1.53.r301.gf388fac
pkgrel=1
pkgdesc="Port of the Snes9x emulator (git version). Includes Gtk version."
arch=('i686' 'x86_64')
url="http://www.snes9x.com/"
license=('LGPL')
makedepends=('intltool' 'nasm' 'mesa' 'libpulse'  'libpng' 'sdl' 'gtk2' 'libxv'
             'adwaita-icon-theme')
provides=('snes9x' 'snes9x-gtk') 
conflicts=('snes9x' 'snes9x-gtk') 
source=("$pkgname"::'git://github.com/snes9xgit/snes9x.git')
sha1sums=('SKIP')

pkgver() {

  cd "$srcdir/$pkgname"
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'

}

build() {

  cd ${pkgbase}/unix
  ./configure --prefix=/usr --with-sdd1-decomp --enable-netplay
  make

  cd ../gtk
  ./autogen.sh
  ./configure --prefix=/usr --with-sdd1-decomp --with-netplay --with-opengl
  make

}

package_snes9x-git() {

  pkgdesc="A portable Emulator for the Super Nintendo Entertainment System"
  depends=('libpng' 'libxext' 'libsm')

  cd ${pkgbase}/unix
  install -D -m755 snes9x "${pkgdir}/usr/bin/snes9x"
  install -d "${pkgdir}/usr/share/doc/${pkgname}"
  install -D -m644 ../docs/{snes9x.conf.default,{control-inputs,controls,snapshots}.txt} \
    "${pkgdir}/usr/share/doc/${pkgname}/"
  install -D -m644 ../docs/snes9x-license.txt \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}

package_snes9x-gtk-git() {

  pkgdesc="A portable Emulator for the Super Nintendo Entertainment System - GTK version"
  license=('custom' 'LGPL')
  depends=('sdl' 'libpulse' 'gtk2' 'libxv' 'adwaita-icon-theme')

  cd ${pkgbase}/gtk
  make DESTDIR="${pkgdir}" install
  install -d "${pkgdir}/usr/share/doc/${pkgname}"
  install -D -m644 ../docs/{snes9x.conf.default,{control-inputs,controls,snapshots}.txt} \
    "${pkgdir}/usr/share/doc/${pkgname}/"
  install -D -m644 ../docs/snes9x-license.txt \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
