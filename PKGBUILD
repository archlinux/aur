# Maintainer: Vain <aurmaint1 on host: uninformativ dot de>
pkgname=gitodo-git
pkgver=20121110
pkgrel=1
pkgdesc="Manage your TODO items using Git as a backend"
arch=('any')
url='http://www.uninformativ.de/projects/?q=gitodo'
license=('custom:PIZZA-WARE')
makedepends=('git')
depends=('git' 'ruby')
optdepends=(
  'cron: Reminder functionality'
  'vim: A reasonable editor, syntax files are provided'
)

_gitroot='git://github.com/vain/gitodo.git'
_gitname='master'

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"
}

package() {
  cd "$srcdir/$_gitname-build"

  install -Dm755 gitodo "$pkgdir"/usr/bin/gitodo
  install -Dm755 highcal "$pkgdir"/usr/bin/highcal

  install -Dm644 man1/gitodo.1 "$pkgdir"/usr/share/man/man1/gitodo.1
  install -Dm644 man1/highcal.1 "$pkgdir"/usr/share/man/man1/highcal.1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -Dm644 vim/ftdetect/gitodo.vim \
    "$pkgdir"/usr/share/vim/vimfiles/ftdetect/gitodo.vim
  install -Dm644 vim/syntax/gitodo.vim \
    "$pkgdir"/usr/share/vim/vimfiles/syntax/gitodo.vim
}

# vim:set ts=2 sw=2 et:
