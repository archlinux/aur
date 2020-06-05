# Maintainer: oliver < a t >  first . in-berlin . de
# Contributor: Serge Zirukin <ftrvxmtrx@gmail.com>
# Contributor: Sergei Lebedev <superbobry@gmail.com>
# Contributor: Nicolas Pouillard <Nicolas.Pouillard@gmail.com>
# Contributor: Guillem Rieu <guillemr@gmx.net>
pkgname=ocamlnet
pkgver=4.1.7
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
md5sums=('55650be818c9c8940e7390b5d4cdbf76')
sha256sums=('1136b7134e3ba9de77060e46be09e332d15217aa1ff71e215362f6a729a02f65')

build(){
  cd "$srcdir/$pkgname-$pkgver"
  ./configure -enable-gnutls -enable-gssapi -enable-pcre -bindir /usr/bin

  # You may adapt the switch-settings to your needs before building the package.
  #
  # Defaults as printed by configure:
  #
  #     -disable-pcre
  #     -disable-full-pcre
  #     -disable-gtk
  #     -disable-gtk2
  #     -disable-tcl
  #     -disable-gnutls
  #     -disable-gssapi
  #     -disable-zip
  #     -disable-apache
  #     -disable-nethttpd
  #     -bindir /usr/bin
  #     -datadir <library directory>
  #     -cpp cpp

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
