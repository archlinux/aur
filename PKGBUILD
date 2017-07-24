# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=merlin
pkgver=2.5.0
pkgrel=1
pkgdesc="Context sensitive completion for OCaml in Vim and Emacs (ocamlmerlin binary only)"
arch=('i686' 'x86_64')
depends=('ocaml' 'ocaml-biniou' 'ocaml-findlib' 'ocaml-yojson' 'python2')
makedepends=('make')
url="https://github.com/ocaml/merlin"
license=('MIT')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/ocaml/$pkgname/tar.gz/v$pkgver)
sha256sums=('4bf4f8b7b3a3852605a7bf8cf576dea569e368cb6642b2d68f435b6d9de55336')
options=('!strip')
provides=('merlin' 'ocaml-merlin')
conflicts=('ocaml-merlin' 'vim-ocaml-merlin-git')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure \
      --prefix "/usr" \
      --sharedir "/usr/share" \
      --vimdir "/usr/share/vim/vimfiles" \
      --enable-compiled-emacs-mode
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make install DESTDIR="$pkgdir"

  install -Dm 644 LICENSE_MIT.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"

  for _doc in $(find . -maxdepth 1 -type f -name "*.md" -printf '%f\n') CHANGELOG; do
    install -Dm 644 $_doc "$pkgdir/usr/share/doc/$pkgname/$_doc"
  done
}
