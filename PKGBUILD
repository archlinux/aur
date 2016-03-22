# Based on a PKGBUILD by Maxime Gauduin <alucryd@archlinux.org>

pkgname=switchboard-plug-parental-controls-bzr
pkgver=r115
pkgrel=2
pkgdesc='Parental controls plug for Switchboard'
arch=('i686' 'x86_64')
url='https://launchpad.net/switchboard-plug-parental-controls'
license=('GPL3')
groups=('pantheon-unstable')
depends=('glib2' 'glibc' 'gtk3'
         'granite' 'switchboard' 'accountsservice')
makedepends=('bzr' 'cmake' 'vala')
provides=('switchboard-plug-parental-controls')
conflicts=('switchboard-plug-parental-controls')
source=('bzr+lp:switchboard-plug-parental-controls')
sha256sums=('SKIP')

pkgver() {
  cd switchboard-plug-parental-controls

  echo "r$(bzr revno)"
}

build() {
  cd switchboard-plug-parental-controls

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build && cd build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='/usr/lib'
  make
}

package() {
  cd switchboard-plug-parental-controls/build

  make DESTDIR="${pkgdir}" install

  # Move the systemd service in place.
  cd ${pkgdir}
  mkdir -p usr/lib/systemd/system
  mv lib/systemd/system/pantheon-parental-controls.service usr/lib/systemd/system/
  rm -r lib
}

# vim: ts=2 sw=2 et:
