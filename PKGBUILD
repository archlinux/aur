# Maintainer: Brian Bidlock <bidulock@openss7.org>
# Contributor: Nezmer <Nezmer@allurelinux.org>

pkgname=libsoup-gnome-git
pkgver=20130422
pkgrel=1
pkgdesc="Gnome HTTP Library with gnome integration enabled /git repo"
arch=('i686' 'x86_64')
url="http://live.gnome.org/LibSoup"
license=('LGPL')
depends=('gnome-keyring' 'libproxy')
makedepends=('intltool' 'gtk-doc' 'git' 'gnome-common')
provides=('libsoup=2.29.0' 'libsoup-git')
conflicts=('libsoup' 'libsoup-newest' 'libsoup-git' 'libsoup-gnome')
replaces=('libsoup' 'libsoup-newest' 'libsoup-git' 'libsoup-gnome')
options=('!libtool')
source=()

_gitroot="git://git.gnome.org/libsoup"
_gitname="libsoup"

build() {

  cd "$srcdir"
  msg "Connecting to the epiphany git repository..."

  if [ -d "$srcdir/$_gitname" ] ; then
  cd $_gitname && git pull origin
  msg "The local files are updated."
  else
  git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  cp -r "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build/"

  ./autogen.sh --prefix=/usr --sysconfdir=/etc \
  --localstatedir=/var --disable-static --with-gnome --disable-gtk-doc || return 1
  make || return 1
}
package() {
  cd "$srcdir/$_gitname-build/"
  make DESTDIR="$pkgdir" install || return 1
}
