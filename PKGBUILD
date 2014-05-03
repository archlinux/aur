# Maintainer: Marek Kubica <marek@xivilization.net>
# Contributor: Serge Zirukin <ftrvxmtrx@gmail.com>
pkgname=ocaml-camomile
pkgver=0.8.5
pkgrel=4
pkgdesc="Comprehensive Unicode library for OCaml"
arch=('i686' 'x86_64')
url="https://github.com/yoriyuki/Camomile"
license=('LGPL')
makedepends=('ocaml' 'ocaml-findlib>=1.2.3')
source=(https://github.com/yoriyuki/${pkgname/ocaml-}/releases/download/rel-$pkgver/${pkgname/ocaml-/}-$pkgver.tar.bz2
        0002-Install-missing-camomileLibrary.a.patch)
sha512sums=('ef4da32f955e69e0b2958b4b2bf12ae94e210d8aa7cee5a9030607b79ac43a884758549f3164c223fb07d987a4a50b15f0bc5083ff67120270409f7fb9928014'
	'd3a802e00ec871fffab8896faffe1592c2e92e6ae33c5226cd8ba371ec8f8632d4079984c2f2238e907c5ebb8ece68d142a42e5071f6660eeeaf5be0bb15d0bd')
options=(!strip !makeflags staticlibs)

prepare() {
  cd "${srcdir}/${pkgname/ocaml-/}-${pkgver}"
  # Patch from Debian, Slackware to add camomileLibrary.a which is required
  # for some code to build
  patch -Np1 -i ../0002-Install-missing-camomileLibrary.a.patch
}

build() {
  cd "${srcdir}/${pkgname/ocaml-/}-${pkgver}"

  ./configure --prefix=/usr
  sed -i -e 's|ocamlfind install|ocamlfind install -destdir '${pkgdir}$(ocamlfind printconf destdir)'|' Makefile
  make
}

package() {
  cd "${srcdir}/${pkgname/ocaml-/}-${pkgver}"

  mkdir -p "${pkgdir}$(ocamlfind printconf destdir)"
  make DATADIR="${pkgdir}/usr/share" install
  install -Dm 644 COPYING ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

