# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Daniel Landau <aur@landau.fi>
# Contributor: Justin Coffman <jcoffman at datasecu dot red>
# Contributor: Sibren Vasse <arch at sibrenvasse dot nl>
# Contributor: oozyslug <oozyslug at gmail dot com>
# Contributor: Justin Coffman <jcoffman at datasecu dot red>

pkgname=byobu
pkgver=6.14
pkgrel=1
pkgdesc='Enhanced tmux'
arch=(any)
url='https://byobu.org/'
license=(GPL-3.0-only)
depends=(libnewt python tmux)
makedepends=(gettext git setconf)
source=("git+https://github.com/dustinkirkland/byobu#tag=$pkgver"
        "byobu-6.14-fix-double-install.patch")
b2sums=('ed5627709175ab1c719cb94906035b2e2df31bccd48760450632a8700422e9bf6a418dc6e2feb8c95da3e77b3741c00b8eed09824b73e4c1db075679f322a81d'
        '14da0443aeb3fb306c1f4bc139c74cc65e561b8b9b818efb2ffef877ed2aa37a039dda2620e090f58afdd910201e0036d91f3868d913ccdaa42006778072a1f8')

prepare() {
  cd $pkgname
  
  # Fix double installation issue in Makefile.am files
  patch -p1 -i ../byobu-6.14-fix-double-install.patch
  
  # Adjust path to SOCKETDIR
  setconf etc/byobu/socketdir SOCKETDIR '"/tmp/screens"'

  # Tweak the two .desktop files that comes with Byobu
  cd usr/share/byobu/desktop
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
