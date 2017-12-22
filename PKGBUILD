# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=pantheon-calendar-git
pkgver=r1398.528cd23
pkgrel=1
pkgdesc='The Pantheon Calendar'
arch=('x86_64')
url='https://github.com/elementary/calendar'
license=('GPL3')
groups=('pantheon-unstable')
depends=('cairo' 'clutter' 'clutter-gtk' 'evolution-data-server' 'folks'
         'gdk-pixbuf2' 'geocode-glib' 'glib2' 'glibc' 'gtk3' 'libchamplain'
         'libgee' 'libical' 'libnotify' 'libsoup'
         'libgranite.so')
makedepends=('cmake' 'git' 'granite-git' 'intltool' 'vala')
provides=('pantheon-calendar')
conflicts=('maya-calendar' 'pantheon-calendar')
replaces=('maya-calendar-bzr')
source=('pantheon-calendar::git+https://github.com/elementary/calendar.git')
sha256sums=('SKIP')

pkgver() {
  cd pantheon-calendar

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd pantheon-calendar

  sed 's|${CMAKE_INSTALL_FULL_LIBDIR}|${CMAKE_INSTALL_PREFIX}/lib|g' -i $(grep -rl CMAKE_INSTALL_FULL_LIBDIR)

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd pantheon-calendar/build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DGSETTINGS_COMPILE='FALSE'
  make
}

package() {
  cd pantheon-calendar/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
