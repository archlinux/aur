# Maintainer: oliver < a t >  first . in-berlin . de
# Contributor: Serge Zirukin <ftrvxmtrx@gmail.com>
# Contributor: Sergei Lebedev <superbobry@gmail.com>
# Contributor: Nicolas Pouillard <Nicolas.Pouillard@gmail.com>
# Contributor: Guillem Rieu <guillemr@gmx.net>
pkgname=ocamlnet
pkgver=4.1.3
pkgrel=1
pkgdesc="A library for Web and Internet programming in OCaml"
arch=('i686' 'x86_64')
url="http://projects.camlcity.org/projects/ocamlnet.html"
license=('GPL' 'LGPL')
depends=('ncurses' 'gnutls' 'krb5')
makedepends=('ocaml-findlib' 'ocaml' 'ocaml-pcre')
#makedepends=('ocaml-findlib' 'ocaml' 'ocaml-pcre' 'ocaml-ssl' 'ocaml-cryptokit')
options=('!strip' '!makeflags' 'staticlibs')
source=(http://download.camlcity.org/download/$pkgname-$pkgver.tar.gz)
md5sums=('06edf1d41cba8160704798fc3a40b586')

build(){
  cd "$srcdir/$pkgname-$pkgver"
  ./configure -enable-gnutls -enable-gssapi -enable-pcre -bindir /usr/bin
  echo -n "pwd: "; pwd
  echo -n "ls -l ../.. => "; ls -l ../..
  cp -av ../../netsys_posix.ml src/netsys/netsys_posix.ml   # overwrite file with changed one

  # You also could configure to add some more support,
  # if you have installed the according modules:
  #
  #  ./configure \
  #    -enable-pcre  \
  #    -enable-full-pcre \
  #    -enable-gtk2 \
  #    -enable-tcl \
  #    -enable-gnutls \
  #    -enable-gssapi \
  #    -enable-zip \
  #    -enable-nethttpd \
  #    -enable-apache \
  #    -enable-gtk \

  make all opt
}

package(){
  cd "$srcdir/$pkgname-$pkgver"
  export OCAMLFIND_DESTDIR="$pkgdir/$(ocamlfind printconf destdir)"
  install -dm755 "$OCAMLFIND_DESTDIR/stublibs"
  env DESTDIR="$pkgdir" make install
  install -d -m 0755 "${pkgdir}/usr/share/doc/$pkgname"
  #install -t "${pkgdir}/usr/share/doc/$pkgname/" doc/html-main/*
  install -m 0644 -t "${pkgdir}/usr/share/doc/$pkgname/" doc/html-main/*
}
