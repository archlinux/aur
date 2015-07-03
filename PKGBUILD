# Maintainer: Leonard de Ruijter <leonard@aur.archlinux.org>
pkgname=ocaml-gd4o
_oname=gd4o
pkgver=1.0a5
pkgrel=3
pkgdesc="OCaml interface to the GD graphics library"
arch=('i686' 'x86_64')
url="http://matt.gushee.net/software/gd4o/"
license=('LGPL')
depends=('gd' 'libjpeg-turbo')
makedepends=('ocaml-findlib')
options=('!strip' 'staticlibs')
provides=('ocaml-gd')
source=(http://sourceforge.net/projects/$_oname/files/$_oname/1.0%20Alpha%205/$_oname-$pkgver.tar.gz
add_fpic_to_cflags.patch
support_custom_cflags.patch)
md5sums=('b5aeb9c246b5e072803eb9b3112350a0'
         '9e7ead2e6921d6653e6e8f051db79e7c'
         '80c3e4a0e36675b63b6ce8025e55b5fd')

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
