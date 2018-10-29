# Maintainer: Que Quotion <quequotion@bugmenot.com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

pkgname=gnome-bluetooth-pantheon
pkgver=3.26.1+3+r2.63f0bf3f4
pkgrel=1
pkgdesc="The GNOME Bluetooth Subsystem (with elementary OS patches)"
url="https://wiki.gnome.org/Projects/GnomeBluetooth"
arch=(x86_64)
license=(GPL LGPL)
depends=(gtk3 libnotify bluez libcanberra libsystemd pulseaudio-bluetooth)
makedepends=(gobject-introspection gtk-doc docbook-xsl git systemd meson)
groups=(pantheon)
provides=(gnome-bluetooth="${pkgver}")
conflicts=(gnome-bluetooth)
source=("git+https://github.com/elementary/os-patches.git#branch=gnome-bluetooth-bionic-patched"
        61-gnome-bluetooth-rfkill.rules)
sha256sums=('SKIP'
            '8dd2d3637f380a89e72f65e6c8021e994ccbdc645f1a1b1dbffe74ac9f061f53')

pkgver() {
    cd "os-patches"

    printf "3.26.1+3+r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  arch-meson "os-patches" build -D gtk_doc=true -D icon_update=false
  ninja -C build
}

check() {
  meson test -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
  install -Dt "$pkgdir/usr/lib/udev/rules.d" -m644 61-gnome-bluetooth-rfkill.rules
}
