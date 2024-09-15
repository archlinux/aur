# Maintainer: XZS <d dot f dot fischer at web dot de>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-visual-star-search-git
pkgver=0.2
pkgrel=1
pkgdesc="Start a search from a visual block in Vim"
arch=('any')
depends=('vim')
groups=('vim-plugins')
url="https://github.com/bronson/vim-visual-star-search"
license=('MIT')
install=vimdoc.install

makedepends+=('git')
source+=("${_gitname:=${pkgname%-git}}::${_giturl:-git+$url}")
for integ in $(get_integlist)
do
  typeset -n array="${integ}sums"
  array+=('SKIP')
done
provides+=("$_gitname=$pkgver")
conflicts+=("$_gitname")
pkgver() {
  cd ${_gitname:-$pkgname}
  git describe --long --tags 2>/dev/null | sed 's/[^[:digit:]]*\(.\+\)-\([[:digit:]]\+\)-g\([[:xdigit:]]\{7\}\)/\1.r\2.g\3/;t;q1'
  [ ${PIPESTATUS[0]} -eq 0 ] || \
printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$_gitname"
  install -m644 -Dt "$pkgdir/usr/share/vim/vimfiles/plugin" plugin/*
}
