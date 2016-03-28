# Maintainer: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: Kevin MacMartin <prurigro at gmail dot com>

pkgname=terminfo-neovim-tmux
pkgver=1.0
pkgrel=1
pkgdesc="tmux terminfo formats with Neovim <C-h> key fix"
arch=('any')
url="https://github.com/neovim/neovim/issues/2048#issuecomment-78045837"
license=('MIT')
makedepends=('ncurses')

_terms=('tmux'
        'tmux-256color')

_patch_terminfo() {
  infocmp "$1" | sed \
    -e 's/^'$1'[^|]*|[^,]*,/'$1'-neovim|'$1' with Neovim <C-h> support,/' \
    -e 's/kbs=^[hH]/kbs=\\177/' > "$1".tmp
  tic "$1".tmp -o terminfo
  rm "$1".tmp
}

build() {
  [[ -d terminfo ]] && rm -rf terminfo
  for term in ${_terms[@]}; do
    _patch_terminfo "$term"
  done
}

package() {
  install -dm 755 "$pkgdir/usr/share"
  mv terminfo "$pkgdir/usr/share"
}
