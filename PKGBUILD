# $Id$
# Maintainer: Dan Elkouby <streetwalkermc@gmail.com>
# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Maintainer: Ionut Biru <ibiru@archlinux.org>
# Contributor: Michael Kanis <mkanis_at_gmx_dot_de>

_pkgname=scream
pkgname=scream-git
pkgver=3.28.0+47+gc495f1aa8
pkgrel=1
pkgdesc="mutter but it's just an X11 compositor"
url="https://github.com/Streetwalrus/scream"
arch=(x86_64)
license=(GPL)
depends=(libinput zenity libxkbfile libxkbcommon-x11)
makedepends=(intltool git)
conflicts=(mutter)
source=("git+https://github.com/Streetwalrus/scream.git")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $_pkgname

  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd $_pkgname

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
      --libexecdir=/usr/lib --disable-static \
      --disable-schemas-compile --enable-compile-warnings=minimum

  # https://bugzilla.gnome.org/show_bug.cgi?id=655517
  sed -e 's/ -shared / -Wl,-O1,--as-needed\0/g' \
      -i {.,cogl,clutter}/libtool

  make
}

package() {
  cd $_pkgname
  make DESTDIR="$pkgdir" install
}
