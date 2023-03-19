# Maintainer: Leonidas P. <jpegxguy at outlook dot com>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=upower-silent-mouse
pkgver=1.90.0
pkgrel=3
pkgdesc="Abstraction for enumerating power devices, listening to device events and querying history and statistics"
url="https://upower.freedesktop.org"
arch=(x86_64)
license=(GPL)
depends=(
  libgudev
  libimobiledevice
  systemd
  usbmuxd
)
makedepends=(
  docbook-xsl
  git
  gobject-introspection
  gtk-doc
  meson
  python
)
checkdepends=(
  python-dbus
  python-dbusmock
  python-gobject
  python-packaging
  umockdev
)
provides=(upower)
conflicts=(upower)
backup=(etc/UPower/UPower.conf)
_commit=d4259c009b3ca1169dfd19231a040c233fc3b58d  # tags/v1.90.0^0
source=("git+https://gitlab.freedesktop.org/upower/upower.git#commit=$_commit"
        "https://github.com/guiambros/silent-mouse/raw/main/up-device-0_99_13.patch")
b2sums=('SKIP'
        'f06d23bfe0358e18a7fa02ecfcb8f0041fe0239042d43ce08dc63138ba7281a5106d7ebfb37495887fee6f8fb90150d4df23a443025ba72defa9e446744e8629')

pkgver() {
  cd upower
  git describe --tags | sed -e 's/^v\|^UPOWER_//;s/_/\./g;s/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd upower

  # Fix use of libimobiledevice
  git cherry-pick -n 81a89385a45d3de1028bcd86b3688fb465b4035c

  cd src
  patch -Np0 -i "${srcdir}/up-device-0_99_13.patch"
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

# vim:set sw=2 sts=-1 et:
