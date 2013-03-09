# Maintainer: Vianney le Clément de Saint-Marcq <vleclement AT gmail·com>
pkgname=tmux-applet-git
pkgver=20130309
pkgrel=1
pkgdesc="Simple applet enhancement and configuration file for tmux"
arch=('i686' 'x86_64')
url="https://bitbucket.org/vianney/tmux-applet"
license=('GPL3')
depends=('tmux')
makedepends=('git')
backup=('etc/tmux-applet.conf')
install=install

_gitroot=https://bitbucket.org/vianney/tmux-applet.git
_gitname=tmux-applet

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

  make PREFIX=/usr ETCDIR=/etc
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" PREFIX=/usr ETCDIR=/etc install
}

# vim:set ts=2 sw=2 et:
