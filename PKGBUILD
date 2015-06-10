# Maintainer: Alexander Rødseth <rodseth@gmail.com>
pkgname=ccode-git
pkgver=20110326
pkgrel=1
pkgdesc="ViM autocompletion for C"
url="https://github.com/nsf/ccode"
arch=('x86_64' 'i686')
license=('MIT')
depends=('clang')
makedepends=('git')
_gitroot="git://github.com/nsf/ccode.git"
_gitname="ccode"

build() {
  cd "$srcdir"
  msg "Connecting to github.com GIT server...."
  if [[ -d $_gitname ]] ; then
    ( cd "$_gitname" && git pull origin )
    msg "The local files are updated."
  else
    git clone "$_gitroot"
  fi
  msg "GIT checkout done or server timeout"

  rm -rf "$_gitname-build"
  git clone "$_gitname" "$_gitname-build"
  cd "$_gitname-build"

  msg2 "Building..."
  head -2 update.bash > compile.bash
  chmod +x compile.bash
  ./compile.bash
}

package() {
  cd "$srcdir/$_gitname-build"
  msg2 "Packaging..."
  install -Dm755 ccode "$pkgdir/usr/bin/ccode"
  install -Dm644 vim/plugin/ccode.vim \
    "$pkgdir/usr/share/vim/vimfiles/plugin/ccode.vim"
  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
# vim:set ts=2 sw=2 et:
