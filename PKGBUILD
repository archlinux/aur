# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-ocaml-merlin-git
pkgver=20150520
pkgrel=1
pkgdesc="Context sensitive completion for OCaml in Vim and Emacs"
arch=('i686' 'x86_64')
depends=('ocaml'
         'ocaml-biniou'
         'ocaml-findlib'
         'ocaml-yojson'
         'python2'
         'vim')
url="https://github.com/the-lambda-church/merlin"
license=('MIT')
source=(${pkgname%-git}::git+https://github.com/the-lambda-church/merlin)
sha256sums=('SKIP')
options=('!strip')
provides=('vim-ocaml-merlin')
conflicts=('ocaml-merlin-git' 'vim-bufsync-git' 'vim-ocaml-merlin')
install=vimdoc.install

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

package() {
  cd ${pkgname%-git}

  msg2 'Building...'
  install -dm 755 "$pkgdir/usr/bin"
  ./configure \
    --bindir "/usr/bin" \
    --sharedir "/usr/share" \
    --prefix "$pkgdir/usr" \
    --vimdir "$pkgdir/usr/share/vim/vimfiles" \
    --enable-compiled-emacs-mode
  make

  msg2 'Installing...'
  make DESTDIR="$pkgdir" install

  msg2 'Fixing directories...'
  install -dm 755 "$pkgdir/usr/share"
  find "$pkgdir" -type d -name "bin" -exec \
    cp -dpr --no-preserve=ownership '{}' "$pkgdir/usr" \;
  find "$pkgdir" -type d -name "emacs" -exec \
    cp -dpr --no-preserve=ownership '{}' "$pkgdir/usr/share" \;
  find "$pkgdir" -type d -name "vimfiles" -exec \
    cp -dpr --no-preserve=ownership '{}' "$pkgdir/usr/share" \;

  msg2 'Installing documentation...'
  for _doc in `find . -maxdepth 1 -type f -name "*.md" -printf '%f\n'` CHANGELOG; do
    install -Dm 644 $_doc "$pkgdir/usr/share/doc/${pkgname%-git}/$_doc"
  done

  msg2 'Installing license...'
  install -Dm 644 LICENSE_MIT.txt "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE_MIT.txt"

  msg2 'Cleaning up pkgdir...'
  rm -rf "$pkgdir/home" "$pkgdir/usr/share/vimfiles/README.md"
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}
