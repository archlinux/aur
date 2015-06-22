# Maintainer: Lubosz Sarnecki <lubosz@gmail.com>
# Original package: Ionut Biru <ibiru@archlinux.org>

_gitname=vte
_realname=vte3
pkgname=$_realname-git

pkgver=0.39.91.3401.f2c40ef
pkgrel=1
pkgdesc="Virtual Terminal Emulator widget for use with GTK3"
arch=('i686' 'x86_64')
license=('LGPL')
options=('!emptydirs')
makedepends=('intltool' 'gobject-introspection' 'gtk3' 'gtk-doc' 'gperf')
url="http://www.gnome.org"
depends=('gtk3' 'vte-common' 'glibc')

provides=(vte3=$pkgver vte-common)
conflicts=($_realname vte-common)

source=(git://git.gnome.org/vte)
md5sums=("SKIP")

subver() {
  PREFIX="m4_define(\[version_$1\],"
  echo $(grep $PREFIX configure.ac | eval sed "'s/$PREFIX//'" | sed 's/)//')
}
 
pkgver() {
  cd $_gitname
  major=$(subver major)
  minor=$(subver minor)
  micro=$(subver micro)
  hash=$(git log --pretty=format:'%h' -n 1)
  revision=$(git rev-list --count HEAD)
  echo $major.$minor.$micro.$revision.$hash
}

build() {
  cd $_gitname
  ./autogen.sh --prefix=/usr --sysconfdir=/etc \
      --libexecdir=/usr/lib/vte \
      --localstatedir=/var --disable-static \
      --enable-introspection
  make
}

package() {
  cd $_gitname
  make DESTDIR="$pkgdir" install
}
