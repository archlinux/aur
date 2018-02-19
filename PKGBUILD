# Maintainer: taskie <t@skie.jp>

pkgname=satysfi-git
_pkgname=SATySFi
pkgver=r1314.3e6d067
pkgrel=1
pkgdesc="A statically-typed, functional typesetting system"
arch=('x86_64')
url="https://github.com/gfngfn/SATySFi"
license=('LGPL3')
depends=('glibc')
optdepends=()
makedepends=('git' 'libx11' 'ocaml-findlib' 'opam' 'rsync' 'wget')
conflicts=("satysfi")
provides=("satysfi")
options=()
source=("git+https://github.com/gfngfn/${_pkgname}")
md5sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${_pkgname}"
  export OPAMROOT="${srcdir}/.opam"
  export OPAMYES=1
  opam init --no-setup
  eval "$(opam config env)"
  opam pin add --no-action satysfi .
  # bypass "ERROR: Preinstalled ocamlbuild detected at ..."
  export CHECK_IF_PREINSTALLED=false
  opam install --deps-only satysfi
  make lib
  make PREFIX=/usr
}

package() {
  cd "${_pkgname}"
  make install PREFIX="${pkgdir}/usr"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
