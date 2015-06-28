# Maintainer: Michael Mansell <michael.mansell@gmail.com>
# Maintainer: Gosha Tugai [SAL9000] <gosha.tugai@gmail.com>
# Contributor: Ross Melin <rdmelin@gmail.com>

# 1.1-2 : Updated autogen.sh.patch to handle newer versions of automake.

pkgname=gimp-plugin-deskew-git
pkgver=1.1
pkgrel=2
pkgdesc="Auto straighten lines of text in scanned documents"
arch=('x86_64')
#(old) url="http://www.cubewano.org/gimp-deskew-plugin/"
url="https://github.com/prokoudine/gimp-deskew-plugin"
license=('GPL')
depends=('gimp')
makedepends=('git')
provides=('gimp-plugin-deskew')
conflicts=('gimp-plugin-deskew')
source=('autogen.sh.patch')
md5sums=('90ce5c6a84fb8b67a034badad0dd6758')

_gitroot='git://github.com/prokoudine/gimp-deskew-plugin.git'
_gitname='gimp-deskew-plugin'

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
  # Of course it's incompatible with newest autoconf >_<
  msg "Patching autogen.sh for autoconf-1.12"
  patch -u -F5 -N autogen.sh ../../autogen.sh.patch
  msg "autogen.sh"
  ./autogen.sh --prefix=/usr
  msg "make"
  make || return 1
  msg "make install"
  make DESTDIR="$pkgdir/" install
  # hack to correct broken make --install
  mv $pkgdir/usr/usr/lib $pkgdir/usr/
  rmdir $pkgdir/usr/usr
}

# vim:set ts=2 sw=2 et:

