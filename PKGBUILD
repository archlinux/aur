# Maintainer: Que Quotion <quequotion@bugmenot.org>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: flamelab <panosfilip@gmail.com>

pkgname=slingshot-launcher-standalone-bzr
pkgver=r752
pkgrel=1
pkgdesc='The Pantheon Application Launcher (without Gala dependencies)'
arch=('i686' 'x86_64')
url='https://launchpad.net/slingshot'
license=('GPL3')
groups=('pantheon-qq')
depends=('gdk-pixbuf2' 'glib2' 'glibc' 'gnome-menus' 'gtk3' 'json-glib'
         'libgee' 'libsoup' 'plank' 'zeitgeist'
         'libgranite.so' 'libswitchboard-2.0.so' 'libwingpanel-2.0.so')
makedepends=('bzr' 'cmake' 'vala')
provides=(slingshot-launcher{,-bzr})
conflicts=(slingshot-launcher{,-bzr})
install='slingshot-launcher.install'
#source=('slingshot-launcher::bzr+lp:slingshot'
source=('slingshot-launcher::bzr+lp:slingshot'
        'no-gala.patch')
sha256sums=('SKIP'
            '869a6fdbf0cbe9063b83876f20e223e416652469b1e76e7a3d6a0de1dd0d1a8f')

pkgver() {
  cd slingshot-launcher

  echo "r$(bzr revno)"
}

prepare() {
  cd slingshot-launcher

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build

  # Disable functions that depend on Gala
  patch -Np2 < ../no-gala.patch

}

build() {
  cd slingshot-launcher/build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='/usr/lib' \
    -DGSETTINGS_COMPILE='FALSE' \
    -DUSE_UNITY='FALSE'
  make
}

package() {
  cd slingshot-launcher/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
