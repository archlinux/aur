# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Leonard de Ruijter <leonard@aur.archlinux.org>

pkgname=ocaml-gd4o
_oname=gd4o
pkgver=1.0a5
pkgrel=4
pkgdesc="OCaml interface to the GD graphics library"
arch=('i686' 'x86_64')
url="http://matt.gushee.net/software/gd4o/"
license=('LGPL')
depends=('gd' 'libjpeg-turbo')
makedepends=('ocaml-findlib')
options=('!strip' 'staticlibs')
provides=('ocaml-gd')
source=("https://sourceforge.net/projects/$_oname/files/$_oname/1.0%20Alpha%205/$_oname-$pkgver.tar.gz"
	"add_fpic_to_cflags.patch"
	"support_custom_cflags.patch")
sha256sums=('fa10b60a785e6734b6ac1b5a762f496b925502cfc848381cae7dfb75fe547eed'
            'ea73c715461e1e4dcf8a45164bf596f0916026c5eaedf8b8ee097e63dff60f72'
            '8d677285f9db15cbc8a4ff5c4813da7e9bfea3118bb1c62789c9164eb5cfa4eb')

prepare() {
  cd $srcdir/$_oname-$pkgver
  patch -Np1 -i "${srcdir}/add_fpic_to_cflags.patch"
  patch -Np1 -i "${srcdir}/support_custom_cflags.patch"
}

build() {
  cd $srcdir/$_oname-$pkgver
  make all && make opt && make docs
}

package() {
  cd $srcdir/$_oname-$pkgver
  mkdir -p ${pkgdir}$(ocamlfind printconf destdir)
  make OCAMLFIND_LDCONF=ignore \
OCAMLFIND_DESTDIR=${pkgdir}$(ocamlfind printconf destdir) install
  install -dm0755 "${pkgdir}/usr/share/doc/$pkgname"
  install -t "${pkgdir}/usr/share/doc/$pkgname" doc/*
}
