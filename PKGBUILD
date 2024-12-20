# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>
# Contributor: Eric Fung <loseurmarbles[at]gmail[dot]com>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Leonard de Ruijter <leonard@aur.archlinux.org>
# Contributor: Serge Zirukin <ftrvxmtrx@gmail.com>
# Contributor: Sergei Lebedev <superbobry@gmail.com>
# Contributor: Magnus Therning <magnus@therning.org>

pkgname=ocaml-pcre
pkgver=8.0.1
pkgrel=1
pkgdesc="Perl compatible regular expressions for OCaml"
arch=('x86_64')
url="http://mmottl.github.io/pcre-ocaml"
license=('LicenseRef-LGPL2.1-with-OCaml-LGPL-linking-exception')
depends=('glibc' 'ocaml-base' 'ocaml-findlib' 'pcre')
makedepends=('dune')
provides=('pcre-ocaml')
replaces=('pcre-ocaml')
conflicts=('pcre-ocaml')
options=('!strip' 'staticlibs' '!debug')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mmottl/pcre-ocaml/releases/download/${pkgver}/pcre-${pkgver}.tbz")
b2sums=('bd20af0ffe60d0f74374e8bbe0de4fba3bfe73e7517b23f13b22f65d4f350ffe5de21b2b32a74e5ef9047622ce5274f4760c9edf27cfb1594aff84d03194dec4')


build() {
    cd "${srcdir}/pcre-${pkgver}"

    export OCAMLPATH="$(ocamlfind printconf destdir)"
    dune build @install
}

check() {
    cd "${srcdir}/pcre-${pkgver}"
    dune runtest --verbose
}

package() {
    cd "${srcdir}/pcre-${pkgver}"

    dune install \
	 --destdir="${pkgdir}" \
	 --prefix="/usr" \
	 --docdir="/usr/share/doc" \
	 --libdir="$(ocamlfind printconf destdir)"

    # TODO
    #  - doc needs an odoc package

    mv "${pkgdir}/usr/share/doc/pcre" "${pkgdir}/usr/share/doc/${pkgname}"

    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
    mv "${pkgdir}/usr/share/doc/${pkgname}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}"
}
