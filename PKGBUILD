# Maintainer: solsTiCe d'Hiver <solstice.dhiver@gmail.com>
pkgname=ocaml-libvirt-git
_pkgname=libvirt-ocaml
pkgver=r185.94a93bd
pkgrel=5
pkgdesc="OCaml bindings for libvirt"
arch=('i686' 'x86_64')
url="https://libvirt.org/"
license=('GPL2')
depends=('ocaml' 'libvirt')
makedepends=('ocaml-findlib' 'git')
conflicts=('ocaml-libvirt')
provides=('ocaml-libvirt')
options=('!strip')
source=(git+https://gitlab.com/libvirt/libvirt-ocaml.git)

sha256sums=('SKIP')

pkgver() {
  cd ${_pkgname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" 
}

OCAMLFIND_DESTDIR="${pkgdir}$(ocamlfind printconf destdir)"

build() {
  cd "${srcdir}/${_pkgname}"
  autoreconf -i
  ./configure --prefix /usr# --libdir /usr/lib/ocaml
  make
}

package() {
  cd "${srcdir}/${_pkgname}"

  mkdir -p "$OCAMLFIND_DESTDIR"

  env DESTDIR="${pkgdir}" OCAMLFIND_DESTDIR="$OCAMLFIND_DESTDIR" make install

  #make DESTDIR="${pkgdir}" install
  #install -dm755 "${pkgdir}/usr/share/"
  #mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
}

