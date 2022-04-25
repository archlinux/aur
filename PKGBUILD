# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Daniel Landau <aur@landau.fi>
# Contributor: Justin Coffman <jcoffman at datasecu dot red>
# Contributor: Sibren Vasse <arch at sibrenvasse dot nl>
# Contributor: oozyslug <oozyslug at gmail dot com>
# Contributor: Justin Coffman <jcoffman at datasecu dot red>

pkgname=byobu
pkgver=5.133
pkgrel=3
pkgdesc='Enhanced tmux'
arch=(any)
url='https://byobu.org/'
license=(GPL3)
depends=(libnewt python tmux)
makedepends=(gettext setconf)
source=("$pkgname-$pkgver.tar.gz::https://launchpad.net/byobu/trunk/$pkgver/+download/byobu_$pkgver.orig.tar.gz"
        "$pkgname-$pkgver.tar.gz.asc::https://launchpad.net/byobu/trunk/$pkgver/+download/..-byobu_$pkgver.orig.tar.gz.asc")
sha256sums=('4d8ea48f8c059e56f7174df89b04a08c32286bae5a21562c5c6f61be6dab7563'
            'SKIP')
validpgpkeys=('E2D9E1C5F9F5D59291F4607D95E64373F1529469') # Dustin Kirkland <kirkland@ubuntu.com>

prepare() {
  # Adjust path to SOCKETDIR
  setconf "$pkgname-$pkgver/etc/byobu/socketdir" SOCKETDIR '"/tmp/screens"'

  # Tweak the two .desktop files that comes with Byobu
  cd "$pkgname-$pkgver/usr/share/byobu/desktop"
  setconf byobu.desktop Name 'Byobu Gnome Terminal'
  setconf byobu.desktop Icon=/usr/share/byobu/pixmaps/byobu.svg
  setconf byobu.desktop \
    Exec "gnome-terminal --name=us.kirkland.terminals.byobu --class=us.kirkland.terminals.byobu -- byobu"
  setconf byobu.desktop.old Icon=/usr/share/byobu/pixmaps/byobu.svg
}

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  DESTDIR="$pkgdir" make -C "$pkgname-$pkgver" install

  # Move .desktop files to /usr/share/applications
  install -d "$pkgdir/usr/share/applications"
  mv "$pkgdir/usr/share/byobu/desktop/byobu.desktop" \
    "$pkgdir/usr/share/applications/byobu.desktop"
  mv "$pkgdir/usr/share/byobu/desktop/byobu.desktop.old" \
    "$pkgdir/usr/share/applications/byobu_old.desktop"
  rmdir "$pkgdir/usr/share/byobu/desktop"
}

# getver: launchpad.net/byobu/+download
# vim: ts=2 sw=2 et:
