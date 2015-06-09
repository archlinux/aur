# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=merlin-git
pkgver=20150520
pkgrel=1
pkgdesc="Context sensitive completion for OCaml in Vim and Emacs (ocamlmerlin binary only)"
arch=('i686' 'x86_64')
depends=('ocaml' 'ocaml-biniou' 'ocaml-findlib' 'ocaml-yojson' 'python2')
makedepends=('git' 'make')
url="https://github.com/the-lambda-church/merlin"
license=('MIT')
source=(${pkgname%-git}::git+https://github.com/the-lambda-church/merlin)
sha256sums=('SKIP')
options=('!strip')
provides=('merlin' 'ocaml-merlin')
conflicts=('merlin' 'ocaml-merlin' 'vim-ocaml-merlin-git')

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

build() {
  cd ${pkgname%-git}

  msg 'Building...'
  ./configure
  make
}

package() {
  cd ${pkgname%-git}

  msg 'Installing license...'
  install -Dm 644 LICENSE_MIT.txt "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE_MIT.txt"

  msg 'Installing documentation...'
  for _doc in `find . -maxdepth 1 -type f -name "*.md" -printf '%f\n'` CHANGELOG; do
    install -Dm 644 $_doc "$pkgdir/usr/share/doc/${pkgname%-git}/$_doc"
  done

  msg 'Installing...'
  install -Dm 755 ocamlmerlin "$pkgdir/usr/bin/ocamlmerlin"

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
