# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Star Brilliant <m13253@hotmail.com>

pkgname=upower-nocritical
_pkgname=upower
pkgver=1.90.4
pkgrel=2
provides=(upower)
pkgdesc="Abstraction for enumerating power devices, listening to device events and querying history and statistics (With a patch to disable low battery action)"
arch=('i686' 'x86_64')
url="http://upower.freedesktop.org"
license=(GPL-2.0-or-later)
depends=(
  gcc-libs
  glib2
  glib2-devel
  glibc
  libgudev
  libimobiledevice
  libplist
)
optdepends=(
  'usbmuxd: Read charge status of iOS devices'
)
makedepends=(
  docbook-xsl
  git
  gobject-introspection
  gtk-doc
  meson
  python
  systemd
  usbmuxd
)
checkdepends=(
  python-dbus
  python-dbusmock
  python-gobject
  python-packaging
  umockdev
)
conflicts=('upower')
backup=('etc/UPower/UPower.conf')
_tag=v${pkgver}
source=("git+https://gitlab.freedesktop.org/upower/upower.git#tag=$_tag"
        0001-Add-a-critical-action-Ignore.patch)
md5sums=('SKIP'
         '1be98d9fc7f2db0cf08e1209474e98a3')

pkgver() {
  cd $_pkgname
  git describe --tags | sed -e 's/^v\|^UPOWER_//;s/_/\./g;s/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd $_pkgname
  patch -p1 < "$srcdir/0001-Add-a-critical-action-Ignore.patch"
}

build() {
  arch-meson upower build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  depends+=(libg{lib,object,io}-2.0.so)
  provides+=(libupower-glib.so)

  meson install -C build --destdir "$pkgdir"
}
