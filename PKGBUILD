# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Star Brilliant <m13253@hotmail.com>

pkgname=upower-nocritical
_pkgname=upower
pkgver=1.90.0
pkgrel=1
pkgdesc="Abstraction for enumerating power devices, listening to device events and querying history and statistics (With a patch to disable low battery action)"
arch=('i686' 'x86_64')
url="http://upower.freedesktop.org"
license=('GPL')
depends=('systemd' 'libusb' 'libimobiledevice' 'libgudev')
makedepends=('intltool' 'docbook-xsl' 'gobject-introspection' 'python' 'git' 'gtk-doc')
provides=('upower')
conflicts=('upower')
backup=('etc/UPower/UPower.conf')
_commit=d4259c009b3ca1169dfd19231a040c233fc3b58d  # tags/v1.90.0^0
source=("git+https://gitlab.freedesktop.org/upower/upower.git#commit=$_commit"
        0001-Add-a-critical-action-Ignore.patch)
md5sums=('SKIP'
         '69fbeb7e5906a59fd39f702d01f83815')

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
