# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# See http://wiki.archlinux.org/index.php/VCS_PKGBUILD_Guidelines
# for more information on packaging from GIT sources.

# Maintainer: Your Name <youremail@domain.com>
pkgname=sqlite-pcre-git
pkgver=20120608
pkgrel=1
pkgdesc="Perl-compatible regular expression support for the SQLite"
arch=('i686' 'x86_64')
url="http://git.altlinux.org/people/at/packages/?p=sqlite3-pcre.git"
license=('custom')
depends=('sqlite')
makedepends=('git' 'pcre' 'sqlite')

_gitroot=git://git.altlinux.org/people/at/packages/sqlite3-pcre.git
_gitname=sqlite-pcre

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
  cflags=`pkg-config --cflags sqlite3 libpcre`
  libs=`pkg-config --libs sqlite3 libpcre`
  gcc -shared -o pcre.so $cflags -W -Werror -fPIC pcre.c $libs -Wl,-z,defs
}

package() {
  cd "$srcdir/$_gitname-build"
  install -pD -m755 pcre.so "$pkgdir"/usr/lib/sqlite3/pcre.so
}

# vim:set ts=2 sw=2 et:
