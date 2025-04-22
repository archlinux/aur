# Maintainer: Christopher Price <pricechrispy at gmail dot com>
# Contributor: Moritz Lipp <mlq@pwmt.org>
_pkgname=google-drive-ocamlfuse
pkgname=google-drive-ocamlfuse-git
pkgver=r685.5509011
pkgrel=1
pkgdesc='FUSE-based file system backed by Google Drive, written in OCaml'
arch=('x86_64')
url='https://astrada.github.io/google-drive-ocamlfuse/'
license=('MIT')
depends=(
'ocaml>=4.08.0'
'ocaml-findlib>=1.2.7'
'ocamlfuse>=2.7.1'
'gapi-ocaml>=0.4.5'
'ocaml-sqlite3>=1.6.1'
'ocaml-extlib'
'tiny_httpd>=0.6'
)
makedepends=(
'git'
'dune'
'ocaml-ounit'
)
options=('!strip' 'staticlibs')
conflicts=('google-drive-ocamlfuse')
provides=('google-drive-ocamlfuse')
source=('git+https://github.com/astrada/google-drive-ocamlfuse.git')
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$_pkgname"

    export OCAMLPATH="$(ocamlfind printconf destdir)"

    dune build -p "$_pkgname"
}

package() {
    cd "$srcdir/$_pkgname"

    dune install "$_pkgname" --destdir="${pkgdir}" --prefix="/usr" --libdir="$(ocamlfind printconf destdir)"

    install -dm755 "${pkgdir}/usr/share/"

    mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
}
