# Maintainer: Sebastian Krzyszkowiak <dos@dosowisko.net>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

pkgbase=modemmanager-git
pkgname=(modemmanager-git libmm-glib-git)
pkgver=1.10.0+170+gd7696d8e
pkgrel=1
pkgdesc="Mobile broadband modem management service"
arch=(x86_64)
url="https://www.freedesktop.org/wiki/Software/ModemManager/"
license=(GPL2 LGPL2.1)
depends=(systemd libgudev polkit ppp libqmi libmbim)
makedepends=(gtk-doc gobject-introspection vala autoconf-archive git)
source=("git+https://gitlab.freedesktop.org/mobile-broadband/ModemManager.git"
        strict-filter.diff)
sha256sums=('SKIP'
            '0602cc5088b193426c3af3d6ce14a7fd6502b06f77982dc56291d834280f311e')

pkgver() {
  cd ModemManager
  git describe --tags | sed 's/-rc/rc/;s/-/+/g'
}

prepare() {
  cd ModemManager

  # Recommended by upstream
  patch -Np1 -i ../strict-filter.diff

  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd ModemManager
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --sbindir=/usr/bin \
    --with-dbus-sys-dir=/usr/share/dbus-1/system.d \
    --with-udev-base-dir=/usr/lib/udev \
    --with-polkit=permissive \
    --with-systemd-journal \
    --with-systemd-suspend-resume \
    --disable-gtk-doc \
    --disable-static

  # https://bugzilla.gnome.org/show_bug.cgi?id=655517
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make
}

check() {
  cd ModemManager
  make -k check
}

package_modemmanager-git() {
  depends+=(libmm-glib)
  optdepends=('usb_modeswitch: install if your modem shows up as a storage drive')
  options=(!emptydirs)
  provides=(modemmanager)
  conflicts=(modemmanager)

  cd ModemManager
  make DESTDIR="$pkgdir" install
  make DESTDIR="$pkgdir" -C libmm-glib uninstall
  make DESTDIR="$pkgdir" -C vapi uninstall

  # Some stuff to move is left over
  mv "$pkgdir/usr/include" ..
  mv "$pkgdir/usr/lib/pkgconfig" ..
}

package_libmm-glib-git() {
  pkgdesc="ModemManager library"
  depends=(glib2)
  provides=(libmm-glib)
  conflicts=(libmm-glib)

  install -d "$pkgdir/usr/lib"
  mv include "$pkgdir/usr"
  mv pkgconfig "$pkgdir/usr/lib"

  cd ModemManager
  make DESTDIR="$pkgdir" -C libmm-glib install
  make DESTDIR="$pkgdir" -C vapi install
}
