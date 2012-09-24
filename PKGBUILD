# Maintainer: Vain <aurmaint1 on host: uninformativ dot de>
pkgname=gitary-git
pkgver=20120922
pkgrel=1
pkgdesc="A diary using git as its backend"
arch=('any')
url='http://www.uninformativ.de/projects/?q=gitary'
license=('custom:PIZZA-WARE')
makedepends=('git')
depends=('git')
optdepends=(
  'vim: A reasonable editor, syntax files are provided'
)

_gitroot='git://github.com/vain/gitary.git'
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

  install -Dm755 gitary "$pkgdir"/usr/bin/gitary
  install -Dm644 gitary-functions "$pkgdir"/usr/lib/gitary/gitary-functions

  install -Dm644 man1/gitary.1 "$pkgdir"/usr/share/man/man1/gitary.1

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -Dm644 vim/ftdetect/gitary.vim \
    "$pkgdir"/usr/share/vim/vimfiles/ftdetect/gitary.vim
  install -Dm644 vim/syntax/gitary.vim \
    "$pkgdir"/usr/share/vim/vimfiles/syntax/gitary.vim
}

# vim:set ts=2 sw=2 et:
