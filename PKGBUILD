# $Id: PKGBUILD 198163 2013-10-30 13:10:44Z allan $
# Original Package : Ionut Biru <ibiru@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: Lubosz Sarnecki <lubosz@gmail.com>

pkgname=libgee-git
pkgver=0.12.0.428.f71b18a
pkgrel=1
pkgdesc="GObject collection library"
url="http://live.gnome.org/Libgee"
license=(LGPL2.1)
arch=(i686 x86_64)
depends=(glib2)
makedepends=(gobject-introspection vala gnome-common)

provides=('libgee='$pkgver)
conflicts=('libgee')

source='git+git://git.gnome.org/libgee'
sha256sums=('SKIP')

_gitname='libgee'

pkgver() {
  cd $_gitname
  version=$(grep AC_INIT configure.ac | sed 's/AC_INIT(\[libgee\], \[//' | sed 's/\], \[https:\/\/bugzilla.gnome.org\/enter_bug.cgi?product=libgee\], \[libgee\])//')
  hash=$(git log --pretty=format:'%h' -n 1)
  revision=$(git rev-list --count HEAD)
  
  echo $version.$revision.$hash
}

build() {
  cd $_gitname
  ./autogen.sh --prefix=/usr --disable-static
  make
}

check() {
  cd $_gitname
  # generates a bazillion traps - make sure systemd's core_pattern
  # is deactivated, or you'll DoS the journal and the system
  #make check
}

package() {
  cd $_gitname
  make DESTDIR="$pkgdir" install
}
