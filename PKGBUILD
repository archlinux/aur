# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=wp2git-git
pkgver=20120918
pkgrel=2
pkgdesc="A tool to download and import a Wikipedia page to a Git repository"
arch=('i686' 'x86_64')
url="https://github.com/CyberShadow/wp2git"
license=('custom')
depends=('curl' 'git')
makedepends=('git' 'gdc' 'd-stdlib')

_gitroot=https://github.com/CyberShadow/wp2git.git
_gitname=master

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone --recursive "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone --recursive "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #
  rdmd --build-only wp2git
}

package() {
  cd "$srcdir/$_gitname-build"
  install -Dm755 wp2git $pkgdir/usr/bin/wp2git
  install -D LICENSE $pkgdir/usr/share/licenses/wp2git-git/LICENSE
}

# vim:set ts=2 sw=2 et:
