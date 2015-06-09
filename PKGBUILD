# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=maya-calendar-bzr
pkgver=r789
pkgrel=1
pkgdesc='The Pantheon Calendar'
arch=('i686' 'x86_64')
url='https://launchpad.net/maya'
license=('GPL3')
groups=('pantheon-unstable')
depends=('folks' 'granite-bzr' 'libchamplain' 'libpeas')
makedepends=('bzr' 'cmake' 'vala')
install='maya-calendar.install'
source=('maya-calendar::bzr+lp:maya'
        'maya-calendar-evolution3.16.patch')
sha256sums=('SKIP'
            'd49987b6e2158a1403521354aeeacd23e65ada377f4047f9b9a7f0b5249c2df7')

pkgver() {
  cd maya-calendar

  echo "r$(bzr revno)"
}

prepare() {
  cd maya-calendar

  patch -Np1 -i ../maya-calendar-evolution3.16.patch
  sed 's|${CMAKE_INSTALL_FULL_LIBDIR}|${CMAKE_INSTALL_PREFIX}/lib|g' -i $(grep -rl CMAKE_INSTALL_FULL_LIBDIR)
}

build() {
  cd maya-calendar

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build && cd build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DGSETTINGS_COMPILE='FALSE'
  make
}

package() {
  cd maya-calendar/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
