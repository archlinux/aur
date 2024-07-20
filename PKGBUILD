# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=cozy-audiobooks-git
_gitname=cozy
pkgdesc="A modern audio book player for Linux and macOS using GTK+ 3"
pkgver=1.3.0.r0.g4c978ec5
pkgrel=2
url="https://cozy.geigi.de"
arch=(any)
license=('GPL3')
provides=('cozy-audiobooks')
conflicts=('cozy-audiobooks')
depends=('appstream-glib'
          libhandy libdazzle
         'desktop-file-utils'
         'gst-python'
         'gstreamer'
         'gtk4'
         libadwaita
         dbus-python
         'python-distro'
         'python-requests'
         'python-pytz'
         'python-gobject'
         'python-mutagen'
         'python-cairo'
         'python-peewee'
         'gst-plugins-good'
         'python-apsw')
makedepends=('meson' 'ninja' 'git' )
source=("cozy-audiobooks::git+https://github.com/geigi/cozy#tag=1.3.0")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/cozy-audiobooks"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/cozy-audiobooks"
  arch-meson . build

  ninja -C build com.github.geigi.cozy-update-po
  ninja -C build extra-update-po
  meson compile -C build
}

package() {
  cd "${srcdir}/cozy-audiobooks"
  DESTDIR="${pkgdir}" ninja -C build install
  ln -s /usr/bin/com.github.geigi.cozy "$pkgdir/usr/bin/cozy-audiobooks"
}
