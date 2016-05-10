# Maintainer: Pieter Goetschalckx <3.14.e.ter <at> gmail <dot> com>

_pkgname=tis-interpreter
pkgname=$_pkgname-git
pkgver=r47.e8de317
pkgrel=1
pkgdesc="An interpreter for finding subtle bugs in programs written in standard C"
arch=('i686' 'x86_64')
url="https://github.com/TrustInSoft/tis-interpreter"
license=('LGPL2.1')
depends=('ocaml' 'ocaml-findlib' 'zarith' 'ocaml-easy-format' 'ocaml-biniou' 'ocaml-yojson')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://github.com/TrustInSoft/$_pkgname")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$_pkgname"
  sed -i 's#^ROOT_PATH=.*$#ROOT_PATH=/usr/share/tis-interpreter#' "tis-interpreter/tis-interpreter.sh"
  sed -i 's#^TIS_PATH=.*$#TIS_PATH=/usr#' "tis-interpreter/tis-interpreter.sh"
}

build() {
  cd "$_pkgname"
  ./configure --prefix=/usr --disable-from_analysis --disable-gui --disable-impact --disable-inout --disable-metrics --disable-occurrence --disable-pdg --disable-postdominators --enable-rtegen --disable-scope --disable-slicing --disable-sparecode --enable-users --disable-aorai --disable-obfuscator --disable-report --disable-security_slicing --disable-wp --disable-wp-coq --disable-wp-why3 --disable-print_api --with-all-static
  make depend
  make
}

package() {
  cd "$_pkgname"
  make DESTDIR="$pkgdir/" install

  cp -r -a "$_pkgname" "$pkgdir/usr/share/"
  ln -s "/usr/share/tis-interpreter/tis-interpreter.sh" "$pkgdir/usr/bin/tis-interpreter"
}
