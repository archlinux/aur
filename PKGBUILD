# Maintainer: Pieter Goetschalckx <3.14.e.ter <at> gmail <dot> com>

_pkgname=tis-interpreter
pkgname=$_pkgname-git
pkgver=r95.33132ce
pkgrel=1
pkgdesc="An interpreter for finding subtle bugs in programs written in standard C"
arch=('i686' 'x86_64')
url="https://github.com/TrustInSoft/tis-interpreter"
license=('LGPL2.1')
makedepends=('git' 'ocaml' 'ocaml-findlib' 'zarith' 'ocaml-easy-format' 'ocaml-biniou' 'ocaml-yojson')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("frama-c-ocaml-4-04.patch" "git+https://github.com/TrustInSoft/$_pkgname")
sha256sums=('b6f7c77da046b558328c901a9e176c6d4ee361aa11eb8e6cc87971290c6b2525'
            'SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$_pkgname"
  sed -i 's#^ROOT_PATH=.*$#ROOT_PATH=/usr/share/tis-interpreter#' "tis-interpreter/tis-interpreter.sh"
  sed -i 's#^TIS_PATH=.*$#TIS_PATH=/usr#' "tis-interpreter/tis-interpreter.sh"
  patch -p1 -i "$srcdir/frama-c-ocaml-4-04.patch"
}

build() {
  cd "$_pkgname"
  ./configure --prefix=/usr --disable-from_analysis --disable-gui --disable-impact --disable-inout --disable-metrics --disable-occurrence --disable-pdg --disable-postdominators --enable-rtegen --disable-scope --disable-slicing --disable-sparecode --enable-users --disable-aorai --disable-obfuscator --disable-report --disable-security_slicing --disable-wp --disable-wp-coq --disable-wp-why3 --disable-print_api --with-all-static
  make depend
  make WARNINGS="-w @a-3-4-6-9-41-44-45-48-50-60"
}

package() {
  cd "$_pkgname"
  make DESTDIR="$pkgdir/" install

  cp -r -a "$_pkgname" "$pkgdir/usr/share/"
  ln -s "/usr/share/tis-interpreter/tis-interpreter.sh" "$pkgdir/usr/bin/tis-interpreter"
}
