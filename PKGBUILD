# Maintainer: Zhiwei Chen <condy0919@gmail.com>

_pkgname=ocp-indent
pkgname=ocaml-${_pkgname}
pkgver=1.8.1
pkgrel=2
pkgdesc="Indentation tool for OCaml, to be used from editors like Emacs and Vim."
arch=('x86_64')
depends=('ocaml' 'ocaml-findlib' 'ocaml-cmdliner>=1.0.0')
makedepends=('git' 'dune>=1.0')
url="https://github.com/OCamlPro/ocp-indent"
license=('MIT')
source=("${url}/archive/${pkgver}.tar.gz" config.patch)
sha256sums=('5c7bffd3a488ed3efc3e2c3cf9641433d317a53c8386f7f3c6fc737e3fdf0c67'
            '253c69d1e786484ef13592a1a8a14c4be92fce634d75ff8d1077b868f4658b59')
options=('!strip')
provides=('ocaml-ocp-indent')
conflicts=('ocaml-ocp-indent')

build() {
  cd "${_pkgname}-${pkgver}"

  # Fix compile error
  patch src/indentConfig.ml ${srcdir}/config.patch
  sed -i 's|(flags :standard -w -9)|(flags :standard -w -9 -warn-error -57)|g' src/dune

  dune build
}

package() {
  cd "${_pkgname}-${pkgver}"

  DESTDIR="${pkgdir}" dune install --prefix "/usr" --libdir "lib/ocaml"

  # Dune installs documentation in /usr/doc, fix that.
  install -dm755 "${pkgdir}/usr/share/"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"

  rm "${pkgdir}"/usr/lib/ocaml/${_pkgname}/dune-package
}

