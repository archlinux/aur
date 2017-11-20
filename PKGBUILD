# Maintainer: oliver < a t >  first . in-berlin . de
# Contributor: Serge Zirukin <ftrvxmtrx@gmail.com>
# Contributor: Sergei Lebedev <superbobry@gmail.com>
# Contributor: Nicolas Pouillard <Nicolas.Pouillard@gmail.com>
# Contributor: Guillem Rieu <guillemr@gmx.net>
pkgname=ocamlnet
pkgver=4.1.4
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
sha256sums=('46c3dace26123bdded9fd5ee841a18ede47d4b940e9320ce1db168d5891e1142')

build(){
  cd "$srcdir/$pkgname-$pkgver"
  ./configure -enable-gnutls -enable-gssapi -enable-pcre -bindir /usr/bin

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
  install -m 0644 -t "${pkgdir}/usr/share/doc/$pkgname/" doc/html-main/*
}
