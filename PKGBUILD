# Maintainer: <craven@gmx.net>
pkgname=mit-scheme-git
pkgver=20160120
pkgrel=1
pkgdesc="MIT/GNU Scheme is an implementation of the Scheme programming language, providing an interpreter, compiler, source-code debugger, integrated Emacs-like editor, and a large runtime library."
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/mit-scheme/"
license=('GPL')
groups=()
depends=('glibc' 'ncurses' 'zlib' 'mit-scheme')
optdepends=('openssl: support for openssl')
makedepends=('git')
provides=()
conflicts=('mit-scheme')
replaces=()
backup=()
options=()
install=
source=()

noextract=()
#generate with 'makepkg -g'

_gitroot=git://git.savannah.gnu.org/mit-scheme.git
_gitname=mit-scheme

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

  #
  # BUILD HERE
  #
  cd src
  ./Setup.sh
  ./configure --prefix=/usr --with-x --enable-native-code
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  cd src
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
