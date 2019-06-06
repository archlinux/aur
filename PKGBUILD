# Maintainer: taskie <t@skie.jp>

pkgname=satysfi-git
_pkgname=SATySFi
pkgver=r2148.e1e0270
pkgrel=1
pkgdesc='A statically-typed, functional typesetting system'
arch=('x86_64')
url='https://github.com/gfngfn/SATySFi'
license=('LGPL3')
depends=('glibc')
optdepends=()
makedepends=('git' 'libx11' 'ocaml-findlib' 'opam' 'rsync' 'wget')
conflicts=('satysfi')
provides=('satysfi')
options=()
source=("git+https://github.com/gfngfn/${_pkgname}")
md5sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${_pkgname}"
  sed -ie '/^LIBDIR=/d' install-libs.sh
  sed -ie '2iLIBDIR=${pkgdir}/usr/share/satysfi' install-libs.sh
  sed -ie 's/lib-satysfi/${srcdir}\/${_pkgname}\/lib-satysfi/' install-libs.sh
  export OPAMROOT="${srcdir}/.opam"
  export OPAMYES=1
  opam init --no-setup
  eval "$(opam config env)"
  opam repository add satysfi-external https://github.com/gfngfn/satysfi-external-repo.git
  opam pin add --no-action satysfi .
  # bypass "ERROR: Preinstalled ocamlbuild detected at ..."
  export CHECK_IF_PREINSTALLED=false
  opam install --deps-only satysfi
  make -j 1 PREFIX=/usr
  ./download-fonts.sh
}

package() {
  cd "${_pkgname}"
  make install PREFIX="${pkgdir}/usr"
  env srcdir="$srcdir" pkgdir="$pkgdir" _pkgname="$_pkgname" ./install-libs.sh
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
