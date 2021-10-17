# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=cozy-audiobooks-git
_gitname=cozy
pkgdesc='A modern audio book player for Linux and macOS using GTK+ 3'
pkgver=1.1.2.r1.g5b75e4e
pkgrel=1
url='https://cozy.geigi.de'
arch=('i686' 'x86_64')
license=('GPL3')
provides=('cozy-audiobooks')
conflicts=('cozy-audiobooks')
depends=('appstream-glib'
         libgranite.so libhandy libdazzle
         'desktop-file-utils'
         'gst-python'
         'gstreamer'
         'gtk3'
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
makedepends=('meson' 'ninja' 'git' granite)
source=("cozy-audiobooks::git+https://github.com/geigi/cozy")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/cozy-audiobooks"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/cozy-audiobooks"
  meson --prefix='/usr' build
  ninja -C build
  ninja -C build com.github.geigi.cozy-update-po
  ninja -C build extra-update-po
}

package() {
  cd "${srcdir}/cozy-audiobooks"
  DESTDIR="${pkgdir}" ninja -C build install
  ln -s /usr/bin/com.github.geigi.cozy "$pkgdir/usr/bin/cozy-audiobooks"
}
