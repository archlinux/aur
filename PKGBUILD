# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Daniel Landau <aur@landau.fi>
# Contributor: Justin Coffman <jcoffman at datasecu dot red>
# Contributor: Sibren Vasse <arch at sibrenvasse dot nl>
# Contributor: oozyslug <oozyslug at gmail dot com>
# Contributor: Justin Coffman <jcoffman at datasecu dot red>

pkgname=byobu
pkgver=6.1.12
pkgrel=1
pkgdesc='Enhanced tmux'
arch=(any)
url='https://byobu.org/'
license=(GPL-3.0)
depends=(libnewt python tmux)
makedepends=(gettext git setconf)
source=('git+https://github.com/dustinkirkland/byobu#commit=cd253f0229b68d3c2cffa8d862309c6ea7019d94')
b2sums=('2efc481edef6f74641e93de012a34d2ac496a7bf402d390aa677954aa08554efeba3a2833a7c385a712923a96c0a765397db9d8f86cb2c19021547c5cf5e231b')

prepare() {
  # Adjust path to SOCKETDIR
  setconf "$pkgname/etc/byobu/socketdir" SOCKETDIR '"/tmp/screens"'

  # Tweak the two .desktop files that comes with Byobu
  cd $pkgname/usr/share/byobu/desktop
  setconf byobu.desktop Name 'Byobu Gnome Terminal'
  setconf byobu.desktop Icon=/usr/share/byobu/pixmaps/byobu.svg
  setconf byobu.desktop \
    Exec "gnome-terminal --name=us.kirkland.terminals.byobu --class=us.kirkland.terminals.byobu -- byobu"
  setconf byobu.desktop.old Icon=/usr/share/byobu/pixmaps/byobu.svg
}

build() {
  cd $pkgname
  autoreconf -fiv
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  DESTDIR="$pkgdir" make -C "$pkgname" install

  # Move .desktop files to /usr/share/applications
  install -d "$pkgdir/usr/share/applications"
  mv "$pkgdir/usr/share/byobu/desktop/byobu.desktop" \
    "$pkgdir/usr/share/applications/byobu.desktop"
  mv "$pkgdir/usr/share/byobu/desktop/byobu.desktop.old" \
    "$pkgdir/usr/share/applications/byobu_old.desktop"
  rmdir "$pkgdir/usr/share/byobu/desktop"
}
