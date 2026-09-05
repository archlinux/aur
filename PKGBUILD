# Maintainer: Hans-Nikolai Viessmann <hans AT viess DOT mn>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Bruno Pagani <archange@archlinux.org>

pkgname=cppo
pkgver=1.8.0
pkgrel=2
pkgdesc="C-style preprocessor for OCaml"
arch=('x86_64')
url="https://github.com/ocaml-community/cppo"
license=('BSD-3-Clause')
depends=('glibc')
optdepends=('ocamlbuild: ocamlbuild plugin')
makedepends=('dune>=3.24' 'ocamlbuild')
options=('!strip')
source=("https://github.com/ocaml-community/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
        'https://github.com/ocaml-community/cppo/commit/b657297d67d27f9d93ba6f8d479f93be6e23081f.patch')
sha256sums=('6e62a8ee0217c9cc38d5860110eb18eb8d89c05c420353d298e1431fe8bac00f'
            '4102bfd69a8d74b119ca718fb6e4d747d91e2018fa17e9565ee123ff17169f11')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  patch -p1 < ../b657297d67d27f9d93ba6f8d479f93be6e23081f.patch
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  dune build --profile release
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  dune runtest
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # hmmm, --libdir behaviour changed in dune 3.2.0, it must now be an absolute path?!
  DESTDIR="${pkgdir}" dune install --prefix "/usr" --libdir "/usr/lib/ocaml" --docdir "/usr/share/doc"

  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
